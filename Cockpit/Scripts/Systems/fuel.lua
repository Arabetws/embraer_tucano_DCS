dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")

startup_print("fuel: load")

local dev = GetSelf()

local update_time_step = 0.02 --update will be called 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()

function update()
end

function post_initialize()
    startup_print("fuel: postinit start")
    local birth = LockOn_Options.init_conditions.birth_place

    if birth=="GROUND_HOT" or birth=="AIR_HOT" then
        dev:performClickableAction(device_commands.FuelLeftMain, 1, true)
        dev:performClickableAction(device_commands.FuelRightMain, 1, true)
        dev:performClickableAction(device_commands.FuelLeftAux, 0, true)
        dev:performClickableAction(device_commands.FuelRightAux, 0, true)
        dev:performClickableAction(device_commands.FuelLeftXfr, -1, true)
        dev:performClickableAction(device_commands.FuelRightXfr, -1, true)
    elseif birth=="GROUND_COLD" then
        dev:performClickableAction(device_commands.FuelLeftMain, 0, true)
        dev:performClickableAction(device_commands.FuelRightMain, 0, true)
        dev:performClickableAction(device_commands.FuelLeftAux, -1, true)
        dev:performClickableAction(device_commands.FuelRightAux, -1, true)
        dev:performClickableAction(device_commands.FuelLeftXfr, -1, true)
        dev:performClickableAction(device_commands.FuelRightXfr, -1, true)
    end
    startup_print("fuel: postinit end")
end

dev:listen_command(device_commands.FuelLeftMain)
dev:listen_command(device_commands.FuelRightMain)
dev:listen_command(device_commands.FuelLeftAux)
dev:listen_command(device_commands.FuelRightAux)
dev:listen_command(device_commands.FuelLeftXfr)
dev:listen_command(device_commands.FuelRightXfr)
dev:listen_command(device_commands.FuelLeftMainStTest)
dev:listen_command(device_commands.FuelRightMainStTest)
dev:listen_command(device_commands.FuelLeftAuxStTest)
dev:listen_command(device_commands.FuelRightAuxStTest)
dev:listen_command(device_commands.FuelLeftXfrStTest)
dev:listen_command(device_commands.FuelRightXfrStTest)
dev:listen_command(device_commands.FuelLeftMainStBright)
dev:listen_command(device_commands.FuelRightMainStBright)
dev:listen_command(device_commands.FuelLeftAuxStBright)
dev:listen_command(device_commands.FuelRightAuxStBright)
dev:listen_command(device_commands.FuelLeftXfrStBright)
dev:listen_command(device_commands.FuelRightXfrStBright)

function SetCommand(command,value)
    debug_message_to_user("fuel: command "..tostring(command).." = "..tostring(value))
    if command==device_commands.EngineStart then
    elseif command == iCommandEnginesStart then
    elseif command == iCommandEnginesStop then
        -- dev:performClickableAction(device_commands.EngineStart, 0, true)
    end
end

startup_print("fuel: load end")
need_to_be_closed = false -- close lua state after initialization


