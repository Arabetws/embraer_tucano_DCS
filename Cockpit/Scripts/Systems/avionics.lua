dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")
dofile(LockOn_Options.script_path.."Systems/avionics_api.lua")
dofile(LockOn_Options.script_path.."Systems/alarm_api.lua")
dofile(LockOn_Options.script_path.."Systems/weapon_system_api.lua")

startup_print("avionics: load")

local dev = GetSelf()

local update_time_step = 0.02 --update will be called 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()


local iCommandPlaneTrimLeft = 93
local iCommandPlaneTrimRight = 94
local iCommandPlaneTrimUp = 95
local iCommandPlaneTrimDown = 96
local iCommandPlaneTrimLeftRudder = 98
local iCommandPlaneTrimRightRudder = 99
local iCommandPlaneTrimStop = 215
local iCommandAltimeterPressureIncrease = 316
local iCommandAltimeterPressureDecrease = 317
local iCommandAltimeterPressureStop = 318

local avionics_trim_updown = 0
local avionics_trim_wingleftright = 0
local avionics_trim_rudderleftright = 0



AVIONICS_MASTER_MODE:set(AVIONICS_MASTER_MODE_ID.NAV)
AVIONICS_MASTER_MODE_LAST:set(-1)

local master_mode = -1
local master_mode_last = -1

local function master_mode_state_machine()
    master_mode = get_avionics_master_mode()
    if master_mode == AVIONICS_MASTER_MODE_ID.NAV and get_avionics_gear_down() then set_avionics_master_mode(AVIONICS_MASTER_MODE_ID.LANDING) end
    if master_mode == AVIONICS_MASTER_MODE_ID.LANDING and not get_avionics_gear_down() then set_avionics_master_mode(AVIONICS_MASTER_MODE_ID.NAV) end
end

local function master_mode_changed()
    master_mode = get_avionics_master_mode()
    if master_mode == master_mode_last then return 0 end

    if master_mode == AVIONICS_MASTER_MODE_ID.NAV and master_mode_last == AVIONICS_MASTER_MODE_ID.LANDING then
    end
    AVIONICS_MASTER_MODE_TXT:set(AVIONICS_MASTER_MODE_STR[master_mode])
    master_mode_last = master_mode
end

AVIONICS = {
    IAS = get_param_handle("AVIONICS_IAS"),
    IAS_MAX = get_param_handle("AVIONICS_IAS_MAX"),
    IAS_SET = get_param_handle("AVIONICS_IAS_SET"),

    RPM = get_param_handle("AVIONICS_RPM"),
    RPM_UNIT = get_param_handle("AVIONICS_RPM_UNIT"),

    OIL_PRESS = get_param_handle("AVIONICS_OIL_PRESS"),
    OIL_TEMP = get_param_handle("AVIONICS_OIL_TEMP"),

    PROP_RPM = get_param_handle("AVIONICS_PROP_RPM"),
    PROP_RPM_UNIT = get_param_handle("AVIONICS_PROP_RPM_UNIT"),

    T5 = get_param_handle("AVIONICS_T5"),

    FF = get_param_handle("AVIONICS_FF"),

    ALT_10000 = get_param_handle("AVIONICS_ALT_10000"),
    ALT_1000 = get_param_handle("AVIONICS_ALT_1000"),
    ALT_100 = get_param_handle("AVIONICS_ALT_100"),

    ALT_MB_1000 = get_param_handle("AVIONICS_ALT_MB_1000"),
    ALT_MB_100 = get_param_handle("AVIONICS_ALT_MB_100"),
    ALT_MB_10 = get_param_handle("AVIONICS_ALT_MB_10"),
    ALT_MB_1 = get_param_handle("AVIONICS_ALT_MB_1"),

    ALT_INHG_1000 = get_param_handle("AVIONICS_ALT_INHG_1000"),
    ALT_INHG_100 = get_param_handle("AVIONICS_ALT_INHG_100"),
    ALT_INHG_10 = get_param_handle("AVIONICS_ALT_INHG_10"),
    ALT_INHG_1 = get_param_handle("AVIONICS_ALT_INHG_1"),

    TOTAL_FUEL_1000 = get_param_handle("AVIONICS_TOTAL_FUEL_1000"),
    TOTAL_FUEL_100 = get_param_handle("AVIONICS_TOTAL_FUEL_100"),
    TOTAL_FUEL_10 = get_param_handle("AVIONICS_TOTAL_FUEL_10"),
    TOTAL_FUEL_1 = get_param_handle("AVIONICS_TOTAL_FUEL_1"),

    TOTAL_FUEL_LEFT = get_param_handle("AVIONICS_TOTAL_FUEL_LEFT"),
    TOTAL_FUEL_RIGHT = get_param_handle("AVIONICS_TOTAL_FUEL_RIGHT"),

    TURN_RATE = get_param_handle("AVIONICS_TURN_RATE"),
    SLIP_RATE = get_param_handle("AVIONICS_SLIP_RATE"),

    ACCEL = get_param_handle("AVIONICS_ACCEL"),
    ACCEL_MAX = get_param_handle("AVIONICS_ACCEL_MAX"),
    ACCEL_MIN = get_param_handle("AVIONICS_ACCEL_MIN"),

    HSI_COURSE = get_param_handle("AVIONICS_HSI_COURSE"),
    HSI_HDG = get_param_handle("AVIONICS_HSI_HDG"),

    TRIM_UPDOWN = get_param_handle("AVIONICS_TRIM_UPDOWN"),
    TRIM_WINGLEFTRIGHT = get_param_handle("AVIONICS_TRIM_WINGLEFTRIGHT"),
    TRIM_RUDDERLEFTRIGHT = get_param_handle("AVIONICS_TRIM_RUDDERLEFTRIGHT"),

}

function get_digit(value, digit_nr)
    if digit_nr == 1 then return (value / 10) % 1 end
    local digit_min = digit_min or 1
    digit_nr = digit_nr - digit_min

    digit_min = math.pow(10,digit_min-1)
    digit_nr = math.pow(10,digit_nr)

    local turn_step = (value % digit_min)
    local digit = (value / digit_nr) % 10
    if (digit % 1) > 0.9 then
        if (math.ceil(digit) - digit) < digit_min / digit_nr then
            digit = math.floor(digit*10) / 10 + turn_step/10
        else
            digit =  math.floor(digit*10) / 10
        end
    end
    digit = digit / 10
    return digit
end

function interpolate(value, input, output)
    if #input ~= #output then return end
    local input_last = input[1]
    local output_last = output[1]
    local ret=0

    for i=2, #input do
        if value < input[i] then
            ret = (value - input[i-1]) / (input[i]-input[i-1]) * (output[i] - output[i-1]) + output[i-1]
            break
        end
        input_last=i
    end
    if ret < output[1] then ret = output[1] end
    if ret > output[#output] then ret = output[#output] end
    return ret
end

local ias_max = 282
local ias_set = 130
local total_fuel = 0

local accel_max = 1
local accel_min = 1
local ALT_PRESSURE_STD_INHG = 29.92
local hsi_hdg = 0
local hsi_course = 0
local adjust = true
local oil_press_warning = 0
local total_fuel_right_warning = 0
local total_fuel_left_warning = 0
local beta_caution = 0

function update()
    if adjust then -- workaround for getBarometricAltitude
		local x, y, z = sensor_data.getSelfCoordinates()
		local dif = math.floor(y/10) - math.floor(sensor_data.getBarometricAltitude()/10)
		if dif > 0 then
			for i=1, math.floor(math.abs(dif/3)) do
				dispatch_action(nil, iCommandAltimeterPressureIncrease)
			end
			dispatch_action(nil, iCommandAltimeterPressureIncrease)
		elseif dif < 0 then
			for i=1, math.floor(math.abs(dif/3)) do
				dispatch_action(nil, iCommandAltimeterPressureDecrease)
			end
			dispatch_action(nil, iCommandAltimeterPressureDecrease)
		else
			adjust = false
		end
		return 0
	end

    -- IAS
    local ias = sensor_data.getIndicatedAirSpeed() * 1.94384
    local iasx, iasy, iasz = sensor_data.getSelfAirspeed()
    if ias == 0 then ias = math.sqrt(iasx * iasx + iasy * iasy + iasz * iasz )  * 1.94384 end
    -- if ias > ias_max then ias_max = ias end
    AVIONICS.IAS:set(ias)
    AVIONICS.IAS_MAX:set(ias_max)
    AVIONICS.IAS_SET:set(ias_set)

    -- RPM Ng
    local rpm = sensor_data.getEngineLeftRPM()
    AVIONICS.RPM:set(rpm)
    AVIONICS.RPM_UNIT:set(rpm%10)

    -- OIL Pressure
    local oil_press = interpolate(rpm, {0, 54, 92, 95, 101.5}, {0, 75, 85, 90, 100})
    AVIONICS.OIL_PRESS:set(oil_press)
    if oil_press < 40 and oil_press_warning == 0 then
        set_warning(WARNING_ID.OIL_PRESS, 2)
        oil_press_warning = 1
    elseif oil_press >= 40 and oil_press_warning == 1 then
        set_warning(WARNING_ID.OIL_PRESS, 0)
        oil_press_warning = 0
    end

    -- OIL Temperature
    local oil_temp = interpolate(rpm, {0, 54, 92, 95, 101.5}, {25, 60, 85, 90, 100})
    AVIONICS.OIL_TEMP:set(oil_temp)


    -- RPM Nh
    local rpmnh = interpolate(sensor_data.getEngineLeftRPM(), {0, 67, 92, 95, 101.5}, {0, 90, 90, 98.5, 98.5})
    AVIONICS.PROP_RPM:set(rpmnh)
    AVIONICS.PROP_RPM_UNIT:set(rpmnh % 10)

    if rpm >= 54 and rpmnh < 90 and beta_caution == 0 then
        set_caution(CAUTION_ID.BETA, 2)
        beta_caution = 1
    elseif (rpm < 54 or rpmnh >= 90) and beta_caution == 1 then
        set_caution(CAUTION_ID.BETA, 0)
        beta_caution = 0
    end
    
    -- T5
    local t5 = sensor_data.getEngineLeftTemperatureBeforeTurbine()
    AVIONICS.T5:set(t5)

    -- ALT
    local altitude = sensor_data.getBarometricAltitude()*3.2808399
    AVIONICS.ALT_10000:set(get_digit(altitude/100,3))
    AVIONICS.ALT_1000:set(get_digit(altitude/100,2))
    AVIONICS.ALT_100:set((altitude / 1000) % 1)

    local ALT_PRESSURE_STD_MB = ALT_PRESSURE_STD_INHG / 0.02953

    AVIONICS.ALT_MB_1000:set(get_digit(ALT_PRESSURE_STD_MB,4))
    AVIONICS.ALT_MB_100:set(get_digit(ALT_PRESSURE_STD_MB,3))
    AVIONICS.ALT_MB_10:set(get_digit(ALT_PRESSURE_STD_MB,2))
    AVIONICS.ALT_MB_1:set(get_digit(ALT_PRESSURE_STD_MB,1))

    AVIONICS.ALT_INHG_1000:set(get_digit(ALT_PRESSURE_STD_INHG*100,4))
    AVIONICS.ALT_INHG_100:set(get_digit(ALT_PRESSURE_STD_INHG*100,3))
    AVIONICS.ALT_INHG_10:set(get_digit(ALT_PRESSURE_STD_INHG*100,2))
    AVIONICS.ALT_INHG_1:set(get_digit(ALT_PRESSURE_STD_INHG*100,1))

    -- FF
    local ff = sensor_data.getEngineLeftFuelConsumption() 
    AVIONICS.FF:set(ff * 7936.6414386556)

    -- Total Fuel
    total_fuel = total_fuel - ff * update_time_step
    total_fuel_lb = total_fuel * 2.20462
    AVIONICS.TOTAL_FUEL_1000:set(get_digit(total_fuel_lb, 4))
    AVIONICS.TOTAL_FUEL_100:set(get_digit(total_fuel_lb, 3))
    AVIONICS.TOTAL_FUEL_10:set(get_digit(total_fuel_lb, 2))
    AVIONICS.TOTAL_FUEL_1:set(get_digit(total_fuel_lb, 1))

    -- Wings Fuel
    local total_fuel_left = sensor_data.getTotalFuelWeight() / 2 * 2.20462
    local total_fuel_right = total_fuel_left
    AVIONICS.TOTAL_FUEL_LEFT:set(total_fuel_left)
    AVIONICS.TOTAL_FUEL_RIGHT:set(total_fuel_right)

    if total_fuel_left < 73 and total_fuel_left_warning == 0 then
        set_warning(WARNING_ID.FUEL_LOW_LEFT, 2)
        total_fuel_left_warning = 1
    elseif total_fuel_left >= 73 and total_fuel_left_warning == 1 then
        set_warning(WARNING_ID.FUEL_LOW_LEFT, 0)
        total_fuel_left_warning = 0
    end
    if total_fuel_right < 73 and total_fuel_right_warning == 0 then
        set_warning(WARNING_ID.FUEL_LOW_RIGHT, 2)
        total_fuel_right_warning = 1
    elseif total_fuel_right >= 73 and total_fuel_right_warning == 1 then
        set_warning(WARNING_ID.FUEL_LOW_RIGHT, 0)
        total_fuel_right_warning = 0
    end

    -- Turn Indicator
    local turn_rate = math.deg(sensor_data.getRateOfYaw())
    AVIONICS.TURN_RATE:set(turn_rate)

    local slip_rate = sensor_data.getRateOfYaw()
    AVIONICS.SLIP_RATE:set(slip_rate)

    -- RALT
    local radar_alt = sensor_data.getRadarAltitude() * 3.2808399
    if radar_alt > 0 and radar_alt < 5000 then radar_alt = round_to(radar_alt, 10) else radar_alt = -1 end

    -- VV
    local vv = sensor_data.getVerticalVelocity() * 3.2808399 * 60
    
    -- HDG
    local hdg = math.deg(-sensor_data.getHeading())
    if hdg < 0 then hdg = 360 + hdg end
    hdg = hdg % 360

    -- Turn Rate (deg/min)
    local turn_rate = math.deg(sensor_data.getRateOfYaw())*60

    -- Accel
    local accel = sensor_data.getVerticalAcceleration()
    if accel_max < accel then accel_max = accel end
    if accel_min > accel then accel_min = accel end
    AVIONICS.ACCEL:set(accel)
    AVIONICS.ACCEL_MAX:set(accel_max)
    AVIONICS.ACCEL_MIN:set(accel_min)

    AVIONICS.HSI_HDG:set(hsi_hdg)
    AVIONICS.HSI_COURSE:set(hsi_course)

    AVIONICS.TRIM_UPDOWN:set(avionics_trim_updown)
    AVIONICS.TRIM_WINGLEFTRIGHT:set(avionics_trim_wingleftright)
    AVIONICS.TRIM_RUDDERLEFTRIGHT:set(avionics_trim_rudderleftright)

    local value = get_cockpit_draw_argument_value(1950)
    if value == 1 then 
        dispatch_action(nil,iCommandPlaneTrimRight)
        dev:performClickableAction(iCommandPlaneTrimRight)
    elseif value == -1 then
        dispatch_action(nil,iCommandPlaneTrimLeft)
        dev:performClickableAction(iCommandPlaneTrimLeft)
    end

    value = get_cockpit_draw_argument_value(1951)
    if value == 1 then 
        dispatch_action(nil,iCommandPlaneTrimDown)
        dev:performClickableAction(iCommandPlaneTrimDown)
    elseif value == -1 then
        dispatch_action(nil,iCommandPlaneTrimUp)
        dev:performClickableAction(iCommandPlaneTrimUp)
    end
end

function post_initialize()
    startup_print("avionics: postinit start")
    dispatch_action(nil, iCommandAltimeterPressureIncrease)
	dispatch_action(nil, iCommandAltimeterPressureDecrease)

    local birth = LockOn_Options.init_conditions.birth_place

    if birth=="GROUND_HOT" then
    elseif birth=="AIR_HOT" then
    elseif birth=="GROUND_COLD" then
        -- dev:performClickableAction(device_commands.EnvRecFan, 0, true)
    end
    total_fuel = sensor_data.getTotalFuelWeight()
    startup_print("avionics: postinit end")
end

dev:listen_command(iCommandPlaneTrimLeft)
dev:listen_command(iCommandPlaneTrimRight)
dev:listen_command(iCommandPlaneTrimUp)
dev:listen_command(iCommandPlaneTrimDown)
dev:listen_command(iCommandPlaneTrimLeftRudder)
dev:listen_command(iCommandPlaneTrimRightRudder)
dev:listen_command(device_commands.IASSet)

dev:listen_command(iCommandAltimeterPressureIncrease)
dev:listen_command(iCommandAltimeterPressureDecrease)

function SetCommand(command,value)
    debug_message_to_user("avionics: command "..tostring(command).." = "..tostring(value))
    if command==iCommandPlaneTrimUp then
        if avionics_trim_updown < 10 then 
            avionics_trim_updown = avionics_trim_updown + 0.01
        else
            dispatch_action(nil,iCommandPlaneTrimDown)
        end
    elseif command == iCommandPlaneTrimDown then
        if avionics_trim_updown > -10 then 
            avionics_trim_updown = avionics_trim_updown - 0.01
        else
            dispatch_action(nil,iCommandPlaneTrimUp)
        end
    elseif command == iCommandPlaneTrimLeft then
        if avionics_trim_wingleftright < 45 then 
            avionics_trim_wingleftright = avionics_trim_wingleftright + 0.05
        else
            dispatch_action(nil,iCommandPlaneTrimRight)
        end
    elseif command == iCommandPlaneTrimRight then
        if avionics_trim_wingleftright > -45 then 
            avionics_trim_wingleftright = avionics_trim_wingleftright - 0.05
        else
            dispatch_action(nil,iCommandPlaneTrimLeft)
        end
    elseif command == iCommandPlaneTrimLeftRudder then
        if avionics_trim_rudderleftright > -10 then 
            avionics_trim_rudderleftright = avionics_trim_rudderleftright - 0.01
        else
            dispatch_action(nil,iCommandPlaneTrimRightRudder)
        end
    elseif command == iCommandPlaneTrimRightRudder then
        if avionics_trim_rudderleftright < 10 then 
            avionics_trim_rudderleftright = avionics_trim_rudderleftright + 0.01
        else
            dispatch_action(nil,iCommandPlaneTrimLeftRudder)
        end
    elseif command == device_commands.TrimEmerAil then
        if value == 0 then dispatch_action(nil,iCommandPlaneTrimStop) end
    elseif command == device_commands.TrimEmerElev then
        if value == 0 then dispatch_action(nil,iCommandPlaneTrimStop) end
    elseif command == device_commands.AccelSet then
        if value == 1 then
            accel_max=-5
            accel_min=10
        end
    elseif command == device_commands.IASSet then
        if value > 0 then ias_set = ias_set - 0.5 
        elseif value < 0 then ias_set = ias_set + 0.5
        end
        if ias_set < 0 then ias_set = 0 end
        if ias_set > 340 then ias_set = 340 end
    elseif command == device_commands.HSIHeading then
        if value > 0 then hsi_hdg = hsi_hdg - math.rad(0.5)
        elseif value < 0 then hsi_hdg = hsi_hdg + math.rad(0.5)
        end
        hsi_hdg = hsi_hdg % math.rad(360)
    elseif command == device_commands.HSICourse then
        if value > 0 then hsi_course = hsi_course - math.rad(0.5)
        elseif value < 0 then hsi_course = hsi_course + math.rad(0.5)
        end
        hsi_course = hsi_course % math.rad(360)
    elseif command == device_commands.AltPressureKnob then
        if value > 0 then 
            ALT_PRESSURE_STD_INHG = ALT_PRESSURE_STD_INHG - 0.005 
            dispatch_action(nil,iCommandAltimeterPressureDecrease)
        elseif value < 0 then 
            ALT_PRESSURE_STD_INHG = ALT_PRESSURE_STD_INHG + 0.005
            dispatch_action(nil,iCommandAltimeterPressureIncrease)
        end
        if ALT_PRESSURE_STD_INHG < 29.10 then ALT_PRESSURE_STD_INHG = 20 end
        if ALT_PRESSURE_STD_INHG > 30.99 then ALT_PRESSURE_STD_INHG = 39 end

    end
end

startup_print("avionics: load end")
need_to_be_closed = false -- close lua state after initialization