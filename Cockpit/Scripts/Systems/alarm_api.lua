dofile(LockOn_Options.script_path.."devices.lua")

local count = 0
local function counter()
    count = count + 1
    return count
end

local count = 0

WARNING_ID = {
    GENERATOR           = 1,
    CANOPY              = 2,
    OIL_PRESS           = 3,
    OXYGEN_PRESS        = 4,
    BATT_TEMP           = 5,
    EMERG_HYD_PRESS     = 6,
    FUEL_LOW_LEFT       = 7,
    FUEL_LOW_RIGHT      = 8,
    CHIP_DET            = 9,
    FIRE                = 100,
    WARNING             = 34,
}

CAUTION_ID = {
    BETA                = 11,
    FLAPS               = 12,
    CIRC_BREAKER        = 13,
    BATTERY             = 14,
    MAIN_INVERTER       = 15,
    STBY_INVERTER       = 16,
    V115_VAC_BUS         = 17,
    V26_VAC_BUS          = 18,
    FUEL_PRESS          = 19,
    MAIN_HYD_PRESS      = 20,
    HYD_FILTER          = 21,
    FUEL_FILTER         = 22,
    AIR_COND            = 23,
    FREE_GYRO           = 24,
    SEAT_PIN            = 26,
    CAUTION             = 35,
}

ADVICE_ID = {
    PX                  = 27,
    DESAFOGAR           = 28,
    IGNITION            = 29,
    INN_SEP             = 30,
    PITOT_STAT          = 31,
    EXT_POWER           = 32,
}

VOICE_ID = {
    STALL               = counter(),
    OVER_G              = counter(),
    SPEED               = counter(),
    WARNING             = counter(),
    LANDING_GEAR        = counter(),
}

-- alarm state 0 = off; 1 = on; 2 = acknowledged
-- alarm id ;


function set_warning(id, state)
    state = state or 1
    local alarm = GetDevice(devices.ALARM)
    if state == 0 then          alarm:SetCommand(device_commands.ALERTS_RESET_WARNING,id)
    elseif state == 1 then      alarm:SetCommand(device_commands.ALERTS_SET_WARNING,id)
    elseif state == 2 then      alarm:SetCommand(device_commands.ALERTS_ACK_WARNING,id)
    end
end

function set_caution(id, state)
    state = state or 1
    local alarm = GetDevice(devices.ALARM)
    if state == 0 then          alarm:SetCommand(device_commands.ALERTS_RESET_CAUTION,id)
    elseif state == 1 then      alarm:SetCommand(device_commands.ALERTS_SET_CAUTION,id)
    elseif state == 2 then      alarm:SetCommand(device_commands.ALERTS_ACK_CAUTION,id)
    end
end

function set_advice(id, state)
    state = state or 1
    local alarm = GetDevice(devices.ALARM)
    if state == 0 then          alarm:SetCommand(device_commands.ALERTS_RESET_ADVICE,id)
    elseif state == 1 then      alarm:SetCommand(device_commands.ALERTS_SET_ADVICE,id)
    end
end

function set_voice(id, state) -- TODO create voice alarms
    state = state or 1
    local alarm = GetDevice(devices.ALARM)
    --if state == 0 then          alarm:SetCommand(device_commands.ALERTS_RESET_ADVICE,id)
    --elseif state == 1 then      alarm:SetCommand(device_commands.ALERTS_SET_ADVICE,id)
    --end
end


function acknowledge_warnings()
    local alarm = GetDevice(devices.ALARM)
    alarm:SetCommand(device_commands.ALERTS_ACK_WARNINGS, 0)
end

function acknowledge_cautions()
    local alarm = GetDevice(devices.ALARM)
    alarm:SetCommand(device_commands.ALERTS_ACK_CAUTIONS, 0)
end
