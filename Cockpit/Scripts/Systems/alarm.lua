dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")
-- dofile(LockOn_Options.script_path.."utils.lua")


dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")
dofile(LockOn_Options.script_path.."Systems/engine_api.lua")
dofile(LockOn_Options.script_path.."Systems/alarm_api.lua")

local PANEL_ALARM_TEST = get_param_handle("PANEL_ALARM_TEST")

-- dofile(LockOn_Options.script_path.."Systems/hydraulic_system_api.lua")

local warnings = {}

local cautions = {}

local advices = {}

local function acknowledge_warnings()
    for i,v in pairs(warnings) do
        if v.state ==  1 then
            warnings[i].state = 2
        end
    end
    set_warning(WARNING_ID.WARNING, 0)
end

local function acknowledge_cautions()
  for i,v in pairs(cautions) do
      if v.state ==  1 then
          cautions[i].state = 2
      end
  end
  set_caution(CAUTION_ID.CAUTION, 0)
end

local function clear_warning(id)
    set_warning(id,0)
end

local function set_alert(alerttable, id, state, text)
    local alert = {}
    alert.id = id
    alert.state = state
    alert.text = text
    param=get_param_handle("LIGHT_" .. tostring(id+200))

    for i,v in pairs(alerttable) do
        if v.id ==  id then
            if state == 0 then
                table.remove(alerttable, i)
                param:set(0)
            else 
                alerttable[i].state = state
                state = 0
                param:set(1)
            end
            break
        end
    end
    if state > 0 then  
        table.insert(alerttable,alert) 
        param:set(1)
    end
end

local function set_warning(id, state)
    state = state or 1
    for index, value in pairs(WARNING_ID) do
        if value == id then
            set_alert(warnings, id, state, index:gsub("_"," "))
            if state > 0 and id ~=  WARNING_ID.WARNING then set_alert(warnings, WARNING_ID.WARNING, state, "WARNING") end
        end
    end
    if state == 0 then
        for i,v in pairs(warnings) do
            if v.id ~= WARNING_ID.WARNING and v.state > 0 then 
                state = 1 
                break
            end
        end
        if state == 0 then set_alert(warnings, WARNING_ID.WARNING, 0, "WARNING") end
    end
end

local function set_caution(id, state)
    for index, value in pairs(CAUTION_ID) do
        if value == id then
            set_alert(cautions, id, state, index:gsub("_"," "))
            if state > 0 and id ~= CAUTION_ID.CAUTION then set_alert(cautions, CAUTION_ID.CAUTION, state, index:gsub("_"," ")) end
        end
    end
    if state == 0 then
        for i,v in pairs(cautions) do
            if v.id ~= CAUTION_ID.CAUTION and v.state > 0 then 
                state = 1 
                break
            end
        end
        if state == 0 then set_alert(cautions, CAUTION_ID.CAUTION, 0, "CAUTION") end
    end
end

local function set_advice(id, state)
  for index, value in pairs(ADVICE_ID) do
      if value == id then
          set_alert(advices, id, state, index:gsub("_"," "))
      end
  end
end

local dev = GetSelf()

local update_time_step = 0.02
-- make_default_activity(update_time_step) -- enables call to update

local sensor_data = get_base_data()

function post_initialize()
end

function SetCommand(command,value)
    debug_message_to_user("alarm: " .. tostring(command) .. "=" .. value)
    if command == device_commands.ALERTS_SET_WARNING then  set_warning(value, 1)
    elseif command == device_commands.ALERTS_RESET_WARNING then set_warning(value, 0)
    elseif command == device_commands.ALERTS_ACK_WARNING then set_warning(value, 2)
    elseif command == device_commands.ALERTS_ACK_WARNINGS then acknowledge_warnings()
    elseif command == device_commands.ALERTS_SET_CAUTION then  set_caution(value, 1)
    elseif command == device_commands.ALERTS_RESET_CAUTION then set_caution(value, 0)
    elseif command == device_commands.ALERTS_ACK_CAUTION then set_caution(value, 2)
    elseif command == device_commands.ALERTS_ACK_CAUTIONS then acknowledge_cautions()
    elseif command == device_commands.ALERTS_SET_ADVICE then  set_advice(value, 1)
    elseif command == device_commands.ALERTS_RESET_ADVICE then set_advice(value, 0)
    elseif command == device_commands.WARNING_PRESS then acknowledge_warnings()
    elseif command == device_commands.CAUTION_PRESS then acknowledge_cautions()
    end
end

function update()
end

need_to_be_closed = false -- close lua state after initialization
