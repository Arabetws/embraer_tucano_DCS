dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")

local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step)

local sensor_data = get_base_data()

local FlapExtensionTimeSeconds = 6      -- flaps take 6 seconds to extend/retract fully

local FLAPS_STATE	=	0
local FLAPS_TARGET  =   0
local FLAPS_TARGET_LAST = 0
local MOVING = 0

dev:listen_command(Keys.PlaneFlaps)
dev:listen_command(Keys.PlaneFlapsOn)
dev:listen_command(Keys.PlaneFlapsOff)
dev:listen_command(device_commands.flaps)

function SetCommand(command,value)
    debug_message_to_user("flaps: command "..tostring(command).." = "..tostring(value))
    if get_elec_main_bar_ok() == true then
        if command == Keys.PlaneFlaps and value == -1 then
            if FLAPS_TARGET < 0.25 then
                dev:performClickableAction(device_commands.flaps, 0.5, false)
            elseif FLAPS_TARGET < 0.75 then
                if FLAPS_TARGET_LAST < 0.25 then 
                    dev:performClickableAction(device_commands.flaps, 1, false)
                else  
                    dev:performClickableAction(device_commands.flaps, 0, false) 
                end
            else
                dev:performClickableAction(device_commands.flaps, 0, false)
            end
        elseif command == Keys.PlaneFlaps or command == device_commands.flaps then
            FLAPS_TARGET_LAST = FLAPS_TARGET
            if value < 0.25 then 
                FLAPS_TARGET = 0
            elseif value < 0.75 then
                FLAPS_TARGET = 0.5
            else
                FLAPS_TARGET = 1
            end
            MOVING = 1
        elseif command == Keys.PlaneFlapsOn then
            dev:performClickableAction(device_commands.flaps, 1.0, false)
        elseif command == Keys.PlaneFlapsOff then
            dev:performClickableAction(device_commands.flaps, 0.0, false)
        end
    end
end

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
    if birth=="GROUND_HOT" or birth=="AIR_HOT" then
        dev:performClickableAction(device_commands.flaps, 0, true)
    elseif birth=="GROUND_COLD" then
        dev:performClickableAction(device_commands.flaps, 1, true)
        FLAPS_STATE = 1
        FLAPS_TARGET = 1
    end

end

local flaps_increment = update_time_step / FlapExtensionTimeSeconds -- sets the speed of flap animation
function update()
    if math.abs(FLAPS_STATE - FLAPS_TARGET)>=flaps_increment then
        if get_elec_main_bar_ok() == true then
            if MOVING == 1 then
                if FLAPS_STATE < FLAPS_TARGET then
                    FLAPS_STATE = FLAPS_STATE + flaps_increment
                else
                    FLAPS_STATE = FLAPS_STATE - flaps_increment
                end
            end
        end
    else
        MOVING = 0
	end
	
    if FLAPS_STATE < 0 then
        FLAPS_STATE = 0
    elseif FLAPS_STATE > 1 then
        FLAPS_STATE = 1
    end

	set_aircraft_draw_argument_value(9,FLAPS_STATE)
	set_aircraft_draw_argument_value(10,FLAPS_STATE)
end

need_to_be_closed = false -- close lua state after initialization
