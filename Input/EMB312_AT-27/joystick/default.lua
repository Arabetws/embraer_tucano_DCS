local cockpit = folder.."../../../Cockpit/Scripts/"
dofile(cockpit.."devices.lua")
dofile(cockpit.."command_defs.lua")

local res = external_profile("Config/Input/Aircrafts/common_joystick_binding.lua")

join(res.keyCommands,{

    --Flight Control
{down = iCommandPlaneUpStart,				                up = iCommandPlaneUpStop,			                name = _('Aircraft Pitch Down'),	                            category = _('Flight Control')},
{down = iCommandPlaneDownStart,				                up = iCommandPlaneDownStop,			                name = _('Aircraft Pitch Up'),		                            category = _('Flight Control')},
{down = iCommandPlaneLeftStart,				                up = iCommandPlaneLeftStop,			                name = _('Aircraft Bank Left'),		                            category = _('Flight Control')},
{down = iCommandPlaneRightStart,			                up = iCommandPlaneRightStop,		                name = _('Aircraft Bank Right'),	                            category = _('Flight Control')},
{down = iCommandPlaneLeftRudderStart,		                up = iCommandPlaneLeftRudderStop,	                name = _('Aircraft Rudder Left'),	                            category = _('Flight Control')},
{down = iCommandPlaneRightRudderStart,		                up = iCommandPlaneRightRudderStop,	                name = _('Aircraft Rudder Right'),	                            category = _('Flight Control')},


{pressed = iCommandThrottleIncrease,                        up = iCommandThrottleStop,                          name = _('Throttle Up'),			                            category = _('Flight Control')},
{pressed = iCommandThrottleDecrease,                        up = iCommandThrottleStop,                          name = _('Throttle Down'),			                            category = _('Flight Control')},
{down = Keys.Cutoff,               		                    up = Keys.Cutoff,                                   name = _('Engine Cutoff else other'),		                    category = _('Flight Control'),                value_down =  1.0,		value_up = 0.0},


{down = iCommandPlaneAUTIncreaseRegime,			                                                                name = _('Throttle Step Up'),			                        category = _('Flight Control')},
{down = iCommandPlaneAUTDecreaseRegime,			                                                                name = _('Throttle Step Down'),			                        category = _('Flight Control')},

{pressed = iCommandPlaneTrimLeftRudder,	                    up = iCommandPlaneTrimStop,                         name = _('Trim: Rudder Left'),		                            category = _('Flight Control')},
{pressed = iCommandPlaneTrimRightRudder,                    up = iCommandPlaneTrimStop,                         name = _('Trim: Rudder Right'),		                            category = _('Flight Control')},

-- Systems          
{down = iCommandPlaneWingtipSmokeOnOff,		                                                                    name = _('Smoke'),						                        category = _('Systems')},
{down = iCommandPlaneCockpitIllumination,	                                                                    name = _('Illumination Cockpit'),		                        category = _('Systems')},
{down = iCommandPlaneLightsOnOff,			                                                                    name = _('Navigation lights'),			                        category = _('Systems')},
{down = iCommandPlaneHeadLightOnOff,		                                                                    name = _('Gear Light Near/Far/Off'),	                        category = _('Systems')},
{down = iCommandPlaneFlaps,					                                                                    name = _('Flaps Up/Desc/Land'),				                    category = _('Systems'), value_down =  -1.0},
{down = iCommandPlaneFlaps,					                                                                    name = _('Flaps Descend'),				                        category = _('Systems'), value_down =  0.5},
{down = iCommandPlaneFlapsOn,				                                                                    name = _('Flaps Landing Position'),		                        category = _('Systems')},
{down = iCommandPlaneFlapsOff,				                                                                    name = _('Flaps Up'),					                        category = _('Systems')},
{down = iCommandPlaneFlaps,                                 up = iCommandPlaneFlaps,                            name = _('Flaps Landing Position Else Desc'),                   category = _('Systems'), value_down =  1.0,		value_up = 0.5},
{down = iCommandPlaneFlaps,                                 up = iCommandPlaneFlaps,                            name = _('Flaps Up Else Desc'),                                 category = _('Systems'), value_down =  0.0,		value_up = 0.5},
{down = iCommandPlaneGear,					                                                                    name = _('Landing Gear Up/Down'),		                        category = _('Systems')},
{down = iCommandPlaneGearUp,				                                                                    name = _('Landing Gear Up'),			                        category = _('Systems')},
{down = iCommandPlaneGearDown,				                                                                    name = _('Landing Gear Down'),			                        category = _('Systems')},
{down = iCommandPlaneGearUp,					            up = iCommandPlaneGearDown,                         name = _('Landing Gear Down else Up'),		                    category = _('Systems')},
{down = iCommandPlaneGearDown,					            up = iCommandPlaneGearUp,                           name = _('Landing Gear Up else Down'),		                    category = _('Systems')},
{down = iCommandPlaneWheelBrakeOn,                          up = iCommandPlaneWheelBrakeOff,			        name = _('Wheel Brake On'),		                                category = _('Systems')},
-- {down = iCommandPlaneWheelBrakeLeftOn,	                    up = iCommandPlaneWheelBrakeLeftOff,		        name = _('Wheel Brake Left - ON/OFF'),		                    category = {_('Systems')}},
-- {down = iCommandPlaneWheelBrakeRightOn,	                    up = iCommandPlaneWheelBrakeRightOff,		        name = _('Wheel Brake Right - ON/OFF'),		                    category = {_('Systems')}},
{down = iCommandPlaneFonar,					                                                                    name = _('Canopy Open/Close'),					                category = _('Systems')},
-- {down = iCommandPlaneResetMasterWarning,		                                                                name = _('Audible Warning Reset'),				                category = _('Systems')},
-- {down = Keys.JettisonWeapons,                               up = Keys.JettisonWeapons,                          name = _('Weapons Jettison'),                                   category = _('Systems'),                        value_down =  1.0,		value_up = 0.0},
{down = iCommandPlaneEject,					                                                                    name = _('Eject (3 times)'),					                category = _('Systems')},

-- {down = iCommandPilotSeatAdjustmentUp,	                    up = iCommandPilotSeatAdjustmentStop,		        name = _('SEAT ADJ Switch - UP/OFF'),		                    category = {_('Systems')}},
-- {down = iCommandPilotSeatAdjustmentDown,	                up = iCommandPilotSeatAdjustmentStop,		        name = _('SEAT ADJ Switch - DOWN/OFF'),		                    category = {_('Systems')}},

{pressed = iCommandAltimeterPressureIncrease,	            up = iCommandAltimeterPressureStop,                 name = _('Altimeter Pressure Increase'),                        category = _('Systems')},
{pressed = iCommandAltimeterPressureDecrease,               up = iCommandAltimeterPressureStop,                 name = _('Altimeter Pressure Decrease'),                        category = _('Systems')},

-- Stick
{pressed = iCommandPlaneTrimUp,			                    up = iCommandPlaneTrimStop,                         name = _('Trim: Nose Up'),			                            category = {_('Stick'), _('HOTAS')}},
{pressed = iCommandPlaneTrimDown,		                    up = iCommandPlaneTrimStop,                         name = _('Trim: Nose Down'),		                            category = {_('Stick'), _('HOTAS')}},
{pressed = iCommandPlaneTrimLeft,		                    up = iCommandPlaneTrimStop,                         name = _('Trim: Left Wing Down'),	                            category = {_('Stick'), _('HOTAS')}},
{pressed = iCommandPlaneTrimRight,		                    up = iCommandPlaneTrimStop,                         name = _('Trim: Right Wing Down'),	                            category = {_('Stick'), _('HOTAS')}},
    
{down = Keys.Call,	                                        up = Keys.Call,                                     name = _('Call'),                                               category = {_('Stick'), _('HOTAS')}, value_down =  1.0,		value_up = 0.0},

--Throttle
{down = Keys.COM1,                                          up = Keys.COM1,                                     name = _('COM Fwd - COM1 (V/UHF1)'),                            category = {_('Throttle'), _('HOTAS'), _('Communications')}, value_down =  1.0,		value_up = 0.0},
{down = Keys.COM2,                                          up = Keys.COM2,                                     name = _('COM Aft - COM2 (V/UHF2)'),                            category = {_('Throttle'), _('HOTAS'), _('Communications')}, value_down =  1.0,		value_up = 0.0},
    
--NightVision                   
{down    = iCommandViewNightVisionGogglesOn   ,                                                                 name = _('Toggle goggles')   ,                                  category = _('Sensors')},
{pressed = iCommandPlane_Helmet_Brightess_Up  ,                                                                 name = _('Gain goggles up')  ,                                  category = _('Sensors')},
{pressed = iCommandPlane_Helmet_Brightess_Down,                                                                 name = _('Gain goggles down'),                                  category = _('Sensors')},

-- mirrors
{down = iCommandToggleMirrors,                                                                                  name = _('Toggle Mirrors'),                   category = {_('View Cockpit')}},


})

-- joystick axes 
join(res.axisCommands,{
    {                                               action = iCommandPlaneRoll,			name = _('Roll')},
    {                                               action = iCommandPlanePitch,		name = _('Pitch')},
    {                                               action = iCommandPlaneRudder,		name = _('Rudder')},
    {                                               action = iCommandPlaneThrustCommon, name = _('Thrust')},
    {                                               action = Keys.AirBrake,             name = _('Airbrake')},
    {                                               action = iCommandWheelBrake,		name = _('Wheel Brake'),		category = {_('Systems')}},
    {												action = iCommandLeftWheelBrake,	name = _('Wheel Brake Left'),	category = {_('Systems')}},
    {												action = iCommandRightWheelBrake,	name = _('Wheel Brake Right'),	category = {_('Systems')}},
    {												action = iCommandRightWheelBrake,	name = _('Wheel Brake Right'),	category = {_('Systems')}},
    {                                               action = Keys.TDCX,                 name = _('TDC Slew Vertical'),  category = {_('Throttle'), _('HOTAS')}},
    {                                               action = Keys.TDCY,                 name = _('TDC Slew Horizontal'),category = {_('Throttle'), _('HOTAS')}},
})

return res
