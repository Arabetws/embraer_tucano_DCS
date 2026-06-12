dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")
dofile(LockOn_Options.script_path.."Systems/alarm_api.lua")

local PANEL_ALARM_TEST = get_param_handle("PANEL_ALARM_TEST")

-- dofile(LockOn_Options.script_path.."Systems/hydraulic_system_api.lua")

startup_print("gear: load")

local dev = GetSelf()

local update_time_step = 0.01 --was 0.05
make_default_activity(update_time_step)

local sensor_data = get_base_data()




-- constants/conversion values

local rate_met2knot = 0.539956803456
local ias_knots = 0 -- * rate_met2knot

-- keys & devices

local Gear  = Keys.PlaneGear
local GearUp = Keys.PlaneGearUp
local GearDown = Keys.PlaneGearDown
local GearHandle = device_commands.Gear

local GearNoseRetractTimeSec = 8    -- 8 seconds to retract
local GearNoseExtendTimeSec = 6     -- 6 seconds to extend

local GearMainTimeSec = 5           -- 5 seconds to retract and extend main gear

local LeftSideLead = 0.4 / (GearMainTimeSec) -- left side main gear leads right side, both opening and closing, by 0.7 seconds

local GEAR_NOSE_STATE = 1.0 -- 0 = retracted, 1.0 = extended -- "current" nose gear position
local GEAR_LEFT_STATE =	1.0 -- 0 = retracted, 1.0 = extended -- "current" main left gear position
local GEAR_RIGHT_STATE = 1.0 -- 0 = retracted, 1.0 = extended -- "current" main right gear position
local GEAR_TARGET =     1.0 -- 0 = retracted, 1.0 = extended -- "future" gear position

local GEAR_ERR   = 0

local emergency_gear_countdown = 0

local ONCE = 1

dev:listen_command(Keys.PlaneGear)
dev:listen_command(Keys.PlaneGearUp)
dev:listen_command(Keys.PlaneGearDown)

dev:listen_command(device_commands.LndGear)
dev:listen_command(device_commands.LndGearBeep)
dev:listen_command(device_commands.LndGearEmerUp)

dev:listen_command(device_commands.LndGearDoorsTest)
dev:listen_command(device_commands.LndGearRightTest)
dev:listen_command(device_commands.LndGearLeftTest)
dev:listen_command(device_commands.LndGearNoseTest)
dev:listen_command(device_commands.LndGearDoorsBright)
dev:listen_command(device_commands.LndGearRightBright)
dev:listen_command(device_commands.LndGearLeftBright)
dev:listen_command(device_commands.LndGearNoseBright)

local function get_elec_primary_ac_ok()
    return true
end

local function get_elec_retraction_release_ground()
    return sensor_data.getWOW_LeftMainLandingGear() > 0
end

local function get_elec_retraction_release_airborne()
    return sensor_data.getWOW_LeftMainLandingGear() == 0
end

local function get_hyd_utility_ok()
    return true
end

local function get_elec_external_power()
    return false
end
local function get_elec_primary_dc_ok()
    return true;
end

function SetCommand(command,value)
    debug_message_to_user("gear: command "..tostring(command).." = "..tostring(value))

    local gear_handle_pos = get_cockpit_draw_argument_value(1263)  -- -1==down, 0==neutral, 1==up
    if command == Keys.PlaneGear then
        if gear_handle_pos==1 then
            dev:performClickableAction(device_commands.LndGear, -1, false)
        elseif gear_handle_pos==0 then
            if GEAR_TARGET == 0 then
                dev:performClickableAction(device_commands.LndGear, -1, false)
            else
                dev:performClickableAction(device_commands.LndGear, 1, false)
            end
        elseif gear_handle_pos==-1 then
            dev:performClickableAction(device_commands.LndGear, 1, false)
        end
    elseif command == Keys.PlaneGearUp then
        dev:performClickableAction(device_commands.LndGear, 1, false)
    elseif command == Keys.PlaneGearDown then
        dev:performClickableAction(device_commands.LndGear, -1, false)
    elseif command == device_commands.LndGear then
        if value == 1 then GEAR_TARGET = 0
        elseif value == -1 then GEAR_TARGET = 1
        else
            GEAR_TARGET = GEAR_NOSE_STATE
        end
    end
end

local gear_nose_retract_increment = update_time_step / GearNoseRetractTimeSec
local gear_nose_extend_increment = update_time_step / GearNoseExtendTimeSec
local gear_main_increment = update_time_step / GearMainTimeSec
local prev_retraction_release_airborne=get_elec_retraction_release_airborne()


local gear_light_param = get_param_handle("GEAR_HANDLE_LIGHT")
local dev_gear_nose = get_param_handle("GEAR_NOSE_LIGHT")
local dev_gear_left = get_param_handle("GEAR_LEFT_LIGHT")
local dev_gear_right = get_param_handle("GEAR_RIGHT_LIGHT")
local dev_gear_door = get_param_handle("GEAR_DOOR_LIGHT")


function update()
    local gear_handle_pos = get_cockpit_draw_argument_value(1263)  -- 1==up, 0==neutral, -1==down
    local allowRetract = sensor_data.getWOW_LeftMainLandingGear() == 0
    if get_hyd_utility_ok() or GEAR_ERR == 1 then
        -- make primary nosegear adjustments if needed
        if GEAR_TARGET ~= GEAR_NOSE_STATE then
            if GEAR_NOSE_STATE < GEAR_TARGET or GEAR_ERR==1 then
                GEAR_NOSE_STATE = GEAR_NOSE_STATE + gear_nose_extend_increment
                if GEAR_ERR == 1 then -- extend more quickly (drop by gravity and ram air pressure)
                    GEAR_NOSE_STATE = GEAR_NOSE_STATE + 2*gear_nose_extend_increment
                end
            else
                if GEAR_ERR == 0 and allowRetract then
                    GEAR_NOSE_STATE = GEAR_NOSE_STATE - gear_nose_retract_increment
                end
            end
        end

        -- make primary main gear adjustments if needed
        if GEAR_TARGET ~= GEAR_LEFT_STATE or GEAR_TARGET ~= GEAR_RIGHT_STATE then
            -- left gear moves first, both up and down
            if GEAR_LEFT_STATE < GEAR_TARGET or GEAR_ERR==1 then
                -- extending
                GEAR_LEFT_STATE = GEAR_LEFT_STATE + gear_main_increment
                if GEAR_ERR == 1 then -- extend more quickly (drop by gravity and ram air pressure)
                    GEAR_LEFT_STATE = GEAR_LEFT_STATE + 2*gear_main_increment
                end
            else
                if GEAR_ERR == 0 and allowRetract then
                    GEAR_LEFT_STATE = GEAR_LEFT_STATE - gear_main_increment
                end
            end

            -- right gear lags left gear by LeftSideLead seconds
            if GEAR_RIGHT_STATE < GEAR_TARGET or GEAR_ERR==1 then
                if GEAR_LEFT_STATE > LeftSideLead then
                    GEAR_RIGHT_STATE = GEAR_RIGHT_STATE + gear_main_increment
                    if GEAR_ERR == 1 then -- extend more quickly (drop by gravity and ram air pressure)
                        GEAR_RIGHT_STATE = GEAR_RIGHT_STATE + 2*gear_main_increment
                    end
                end
            else
                if GEAR_LEFT_STATE < (1-LeftSideLead) then
                    if GEAR_ERR == 0 and allowRetract then
                        GEAR_RIGHT_STATE = GEAR_RIGHT_STATE - gear_main_increment
                    end
                end
            end
        end
    end

    -- handle rounding errors induced by non-modulo increment remainders
    if gear_handle_pos == 1 and GEAR_TARGET == 0 and GEAR_NOSE_STATE <= 0 and GEAR_LEFT_STATE <= 0 and GEAR_RIGHT_STATE <=0 then
        dev:performClickableAction(device_commands.LndGear, 0, false)
    end

    if sensor_data.getWOW_LeftMainLandingGear() == 0 and gear_handle_pos == -1 and GEAR_TARGET == 1 and GEAR_NOSE_STATE >= 1 and GEAR_LEFT_STATE >= 1 and GEAR_RIGHT_STATE >=1 then
        dev:performClickableAction(device_commands.LndGear, 0, false)
    end

    if GEAR_NOSE_STATE < 0 then
        GEAR_NOSE_STATE = 0
    elseif GEAR_NOSE_STATE > 1 then
        GEAR_NOSE_STATE = 1
    end

    if GEAR_LEFT_STATE < 0 then
        GEAR_LEFT_STATE = 0
    elseif GEAR_LEFT_STATE > 1 then
        GEAR_LEFT_STATE = 1
    end

    if GEAR_RIGHT_STATE < 0 then
        GEAR_RIGHT_STATE = 0
    elseif GEAR_RIGHT_STATE > 1 then
        GEAR_RIGHT_STATE = 1
    end
	
    set_aircraft_draw_argument_value(0,GEAR_NOSE_STATE) -- nose gear draw angle
    set_aircraft_draw_argument_value(3,GEAR_RIGHT_STATE) -- right gear draw angle
    set_aircraft_draw_argument_value(5,GEAR_LEFT_STATE) -- left gear draw angle

     if get_elec_primary_dc_ok() then
        if GEAR_NOSE_STATE == 1 and get_elec_emergency_ok() then
            dev_gear_nose:set(1)
        else
            dev_gear_nose:set(0)
        end

        if GEAR_LEFT_STATE == 1 and get_elec_emergency_ok() then
            dev_gear_left:set(1)
        else
            dev_gear_left:set(0)
        end

        if GEAR_RIGHT_STATE == 1 and get_elec_emergency_ok() then
            dev_gear_right:set(1)
        else
            dev_gear_right:set(0)
        end

        if GEAR_RIGHT_STATE ~= 0 and GEAR_LEFT_STATE ~= 0 and GEAR_NOSE_STATE ~= 0 and get_elec_emergency_ok() then
            dev_gear_door:set(1)
        else
            dev_gear_door:set(0)
        end
    end

    if ( ((GEAR_NOSE_STATE+GEAR_LEFT_STATE+GEAR_RIGHT_STATE)/3) ~= gear_handle_pos or PANEL_ALARM_TEST:get() == 1) and get_elec_emergency_ok() then
        gear_light_param:set(1.0)
    else
        gear_light_param:set(0.0)
    end

    if GEAR_ERR==1 and get_elec_external_power() then
        -- pretend ground crew reset gear fault
        GEAR_ERR = 0
        print_message_to_user("Ground crew reset landing gear")
    end
end

function post_initialize()
    startup_print("gear: postinit start")

	local birth = LockOn_Options.init_conditions.birth_place
	if birth=="GROUND_HOT" then
        dev:performClickableAction(device_commands.LndGear, -1, true)
        GEAR_NOSE_STATE = 1
        GEAR_RIGHT_STATE = 1
        GEAR_LEFT_STATE = 1
        GEAR_TARGET = 1
    elseif birth=="GROUND_COLD" then
        dev:performClickableAction(device_commands.LndGear, 0, true)
        GEAR_NOSE_STATE = 1
        GEAR_RIGHT_STATE = 1
        GEAR_LEFT_STATE = 1
        GEAR_TARGET = 1
	elseif birth=="AIR_HOT" then
        dev:performClickableAction(device_commands.LndGear, 0, true)
		GEAR_NOSE_STATE = 0
        GEAR_RIGHT_STATE = 0
        GEAR_LEFT_STATE = 0
        GEAR_TARGET = 0
	end
    dev:performClickableAction(device_commands.LndGearEmerUp, 0, true)

    set_aircraft_draw_argument_value(0,GEAR_NOSE_STATE)     -- nose gear draw angle
    set_aircraft_draw_argument_value(3,GEAR_RIGHT_STATE)    -- right gear draw angle
    set_aircraft_draw_argument_value(5,GEAR_LEFT_STATE)     -- left gear draw angle

    startup_print("gear: postinit end")
end

startup_print("gear: load end")

need_to_be_closed = false -- close lua state after initialization
