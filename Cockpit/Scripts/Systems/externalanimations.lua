dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."functions.lua")

local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step) -- enables call to update

local sensor_data = get_base_data()

function post_initialize()
	set_aircraft_draw_argument_value(DRAW_FAN,-1)
end

local DRAW_FAN			 = 	407
local PropStepLim		 =  0.0833
local propState         =   0
local propMaxRPM		= 2000

AVIONICS = {
    PROP_RPM = get_param_handle("AVIONICS_PROP_RPM"),
}
function update()

	local propRPM = AVIONICS.PROP_RPM:get() / 100 * propMaxRPM
	--sensor is from 0 to 100 so it is divided by 100 and multiplied by the prop max RPM.
	
	local propStep = propRPM / 60 * update_time_step

	--keeps prop animation between 0 and 1
	if propRPM < 800 then
		propState = (propState + propStep)%1
		set_aircraft_draw_argument_value(475,0)
		set_aircraft_draw_argument_value(DRAW_FAN,propState)
		set_aircraft_draw_argument_value(413,1)
	else
		propState = (propState + propStep/100)%1
		set_aircraft_draw_argument_value(413,0)
		set_aircraft_draw_argument_value(475,-1)
		set_aircraft_draw_argument_value(DRAW_FAN,propState)
	end

	local ROLL_STATE = sensor_data:getStickPitchPosition() / 100
	set_aircraft_draw_argument_value(11, ROLL_STATE) -- right aileron
	set_aircraft_draw_argument_value(12, -ROLL_STATE) -- left aileron
	

	local PITCH_STATE = sensor_data:getStickRollPosition() / 100
	set_aircraft_draw_argument_value(15, PITCH_STATE) -- right elevator
	set_aircraft_draw_argument_value(16, PITCH_STATE) -- left elevator

	local RUDDER_STATE = sensor_data:getRudderPosition() / 100
	set_aircraft_draw_argument_value(17, -RUDDER_STATE)
	set_aircraft_draw_argument_value(2, -RUDDER_STATE)
end


function SetCommand(command,value)
end

need_to_be_closed = false -- close lua state after initialization
