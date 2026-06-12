dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")
dofile(LockOn_Options.script_path.."Systems/engine_api.lua")
dofile(LockOn_Options.script_path.."Systems/alarm_api.lua")

--dofile(LockOn_Options.script_path.."utils.lua")

startup_print("electric_system: load")

local electric_system = GetSelf()
local dev = electric_system

local update_time_step = 0.02 --update will be called 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()


local bat_pcp_v=28             -- main battery voltage
local bat_pcp_vmin=22          -- main battery minimum voltage
local bat_pcp_a=0              -- main battery curent
local bat_pcp_res=0            -- main battery resistance
local bat_pcp_ah=56            -- main battery capacity
local bat_pcp_t=25             -- main battery temperature
local bat_pcp_prot = false     -- main baterry protection

local bat_res_v=24             -- reserve battery voltage
local bat_res_a=0              -- reserve battery current
local bat_res_res=0            -- reserve battery resistance
local bat_res_ah=11            -- reserve battery capacity

-- CPM1 -> fonte externa
local ext_pwr_on = false
local ext_on = false
local ext_v = 0
local ext_vnom = 28.5


-- gcu generator control unit
-- Gerador inadequadamente fora da barra -> ERRO GEN, CAUTION sound, CAUT flash
-- Gerador -> off/reset reinicia os circuitos de proteção do gerador
-- Falha no gerador, EDS liga bateria para alimentar cargas para pouso automaticamente
local gen_on = false
local gen_v = 0
local gen_vnom = 30
local gen_amax=400

local mdp_warmup_delay = 28
local avoinics_master_on_delay = 2
local mdp_switch_delay = 2

-- Contactoras
local contact_cfe = false
local contact_clg = false
local contact_cpm1 = false
local contact_cpm2 = false
local contact_cb = false
local contact_cbe1 = false
local contact_cbe2 = false


-- Disjuntores
local disj_bat_res = true
local disj_bat_res_amax = 5000

local disj_avi_mst_bar_pcp_dc = true
local disj_avi_mst_bar_pcp_dc_amax = 5000

local disj_avi_mst_bar_emer_dc = true
local disj_avi_mst_bar_emer_dc_amax = 5000

local disj_res1 = true
local disj_res1_amax = 5000

local disj_res2 = true
local disj_res2_amax = 5000

local disj_emer_res = true
local disj_emer_res_amax = 5000

-- Fusíveis
local fuse_cbe1 = true
local fuse_cbe1_amax = 5000

local fuse_cbe2 = true
local fuse_cbe2_amax = 5000


-- Chaves
local sw_rbr = false
local sw_ar_solo = false
local sw_avi_mst = false


-- Barras
local bar_pcp_dc_v = 0
local bar_pcp_dc_a = 0
local bar_pcp_dc_res = 0

local bar_hot_v = 0
local bar_hot_a = 0
local bar_hot_res = 0

local bar_hot_res_v = 0
local bar_hot_res_a = 0
local bar_hot_res_res = 0

local bar_emer_dc_v = 0
local bar_emer_dc_a = 0
local bar_emer_dc_res = 0

local bar_res1_v = 0
local bar_res1_a = 0
local bar_res1_res = 0

local bar_res2_v = 0
local bar_res2_a = 0
local bar_res2_res = 0

local bar_emer_res_v = 0
local bar_emer_res_a = 0
local bar_emer_res_res = 0

local bar_avi_mst_pcp_dc_v = 0
local bar_avi_mst_pcp_dc_a = 0
local bar_avi_mst_pcp_dc_res = 0

local bar_avi_mst_emer_dc_v = 0
local bar_avi_mst_emer_dc_a = 0
local bar_avi_mst_emer_dc_res = 0

-- controls
local ctl_sw_ext_pwr_on = false

local battery_caution = 0
local gen_warning = 0
local stby_ac_caution = 0
local main_ac_caution = 0
local ac_caution = 0

local elec_avionics_emergency_warm_up_until = 0
local elec_avionics_warm_up_until = 0

function update()
    if get_batt_on() or
    (get_generator_on() and get_engine_on())  then -- Generator On and Engine On
        elec_main_bar_ok:set(((sensor_data.getWOW_LeftMainLandingGear() > 0 or get_engine_on())) and 1 or 0)
        if elec_emergency_ok:get() == 0 then set_caution(CAUTION_ID.V26_VAC_BUS,0) end
        elec_emergency_ok:set(1)
        
        if get_batt_on() then 
            elec_emergency_reserve_ok:set(1) 
        else 
            elec_emergency_reserve_ok:set(0) 
        end
    end

    if sensor_data.getWOW_LeftMainLandingGear() == 0 then
        elec_emergency_reserve_ok:set(1)
    end

    if not get_batt_on() and battery_caution == 0 then
        set_caution(CAUTION_ID.BATTERY, 1)
        battery_caution = 1
    elseif get_batt_on() and battery_caution == 1 then
        set_caution(CAUTION_ID.BATTERY, 0)
        battery_caution = 0
    end

    -- Engine is running but generator switch is off
    if get_engine_on() and not get_generator_on() and gen_warning == 0 then
        set_warning(WARNING_ID.GENERATOR, 2)
        gen_warning = 1
    -- Engine is running and generator switch is on
    elseif get_engine_on() and get_generator_on() and gen_warning == 1 then
        set_warning(WARNING_ID.GENERATOR, 0)
        gen_warning = 0
    -- Engine is not running and aircraft is airborne
    elseif not get_engine_on() and gen_warning == 0 then
        set_warning(WARNING_ID.GENERATOR, 2)
        gen_warning = 1
    end

    if get_main_ac_on() and main_ac_caution == 1 then
        set_caution(CAUTION_ID.MAIN_INVERTER, 0)
        main_ac_caution = 0
    elseif not get_main_ac_on() and main_ac_caution == 0 then
        set_caution(CAUTION_ID.MAIN_INVERTER, 2)
        main_ac_caution = 1
    end
    
    if get_stby_ac_on() and stby_ac_caution == 1 then
        set_caution(CAUTION_ID.STBY_INVERTER, 0)
        stby_ac_caution = 0
    elseif not get_stby_ac_on() and stby_ac_caution == 0 then
        set_caution(CAUTION_ID.STBY_INVERTER, 2)
        stby_ac_caution = 1
    end

    if (get_main_ac_on() or get_stby_ac_on()) and ac_caution == 1 then
        set_caution(CAUTION_ID.V115_VAC_BUS, 0)
        ac_caution = 0
    elseif not (get_main_ac_on() and get_stby_ac_on()) and ac_caution == 0 then
        set_caution(CAUTION_ID.V115_VAC_BUS, 2)
        ac_caution = 1
    end


    -- update_electrical()
end

electric_system:listen_command(315) -- iCommandPowerBattery1

electric_system:listen_command(706) -- iCommandPowerBattery1
electric_system:listen_command(707) -- iCommandPowerBattery1Cover
electric_system:listen_command(708) -- iCommandPowerBattery2
electric_system:listen_command(709) -- iCommandPowerBattery1Cover
electric_system:listen_command(710) -- iCommandPowerBattery1Cover
electric_system:listen_command(711) -- iCommandPowerBattery1Cover
electric_system:listen_command(712) -- iCommandPowerBattery1Cover
electric_system:listen_command(713) -- iCommandPowerBattery1Cover

electric_system:listen_command(1071) -- iCommandPowerBattery1Cover
electric_system:listen_command(1072) -- iCommandPowerBattery1Cover
electric_system:listen_command(1073) -- iCommandPowerBattery1Cover
electric_system:listen_command(1074) -- iCommandPowerBattery1Cover
electric_system:listen_command(1075) -- iCommandPowerBattery1Cover
electric_system:listen_command(1076) -- iCommandPowerBattery1Cover


function post_initialize()
    startup_print("electric_system: postinit start")

    local birth = LockOn_Options.init_conditions.birth_place

    if birth=="GROUND_HOT" or birth=="AIR_HOT" then
        dev:performClickableAction(device_commands.ElecBatt, 1, true)
        dev:performClickableAction(device_commands.ACMain, 1, true)
        dev:performClickableAction(device_commands.ACBackup, 1, true)
    elseif birth=="GROUND_COLD" then
        dev:performClickableAction(device_commands.ElecBatt, 0, true)
    end

    dev:performClickableAction(device_commands.ElecEmer, 0, true)
    dev:performClickableAction(device_commands.ElecGen, 0, true)
    startup_print("electric_system: postinit end")
end


dev:listen_command(Keys.BatteryPower)
dev:listen_command(Keys.PowerGeneratorLeft)
dev:listen_command(Keys.PowerGeneratorRight)

dev:listen_command(device_commands.ElecBatt)
dev:listen_command(device_commands.ElecGen)
dev:listen_command(Keys.ElecBatt)
dev:listen_command(Keys.ElecGen)
dev:listen_command(Keys.ElecExtPwr)


function SetCommand(command,value)
    debug_message_to_user("electric_system: command "..tostring(command).." = "..tostring(value))
    if command == device_commands.ElecBatt then
        if value==0 then
            dev:DC_Battery_on(true)
        elseif value == -1 then 
            dev:DC_Battery_on(false)
        end
    elseif command == device_commands.ElecGen then
        if value ~= -1 then
            electric_system:AC_Generator_1_on(true)
        else
            electric_system:AC_Generator_1_on(false)
        end
    elseif command == Keys.PowerGeneratorLeft then
        if value==1 then
            electric_system:AC_Generator_1_on(true)
        else
            electric_system:AC_Generator_1_on(false)
        end
    elseif command == Keys.PowerGeneratorRight then
        if value==1 then
            electric_system:AC_Generator_2_on(true)
        else
            electric_system:AC_Generator_2_on(false)
        end
    elseif command == Keys.BatteryPower then
        if value==1 then
            dev:DC_Battery_on(true)
        elseif value == 0 then 
            dev:DC_Battery_on(false)
        end
    elseif command == Keys.ElecBatt then
        dev:performClickableAction(device_commands.ElecBatt, get_cockpit_draw_argument_value(1001) == 0 and 1 or 0)
    elseif command == Keys.ElecGen then
        dev:performClickableAction(device_commands.ElecGen, get_cockpit_draw_argument_value(1002) == 0  and -1 or 0)
    end
end

startup_print("electric_system: load end")
need_to_be_closed = false -- close lua state after initialization

