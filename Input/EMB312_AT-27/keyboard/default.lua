local cockpit = folder.."../../../Cockpit/Scripts/"
dofile(cockpit.."devices.lua")
dofile(cockpit.."command_defs.lua")

local res = external_profile("Config/Input/Aircrafts/common_keyboard_binding.lua")

join(res.keyCommands,{





-- Flight Control               
{combos = {{key = 'Up'}},		                                        down = iCommandPlaneUpStart,			            up = iCommandPlaneUpStop,			        name = _('Aircraft Pitch Down'),	                            category = _('Flight Control')},
{combos = {{key = 'Down'}},		                                        down = iCommandPlaneDownStart,			            up = iCommandPlaneDownStop,			        name = _('Aircraft Pitch Up'),		                            category = _('Flight Control')},
{combos = {{key = 'Left'}},		                                        down = iCommandPlaneLeftStart,			            up = iCommandPlaneLeftStop,			        name = _('Aircraft Bank Left'),		                            category = _('Flight Control')},
{combos = {{key = 'Right'}},	                                        down = iCommandPlaneRightStart,			            up = iCommandPlaneRightStop,		        name = _('Aircraft Bank Right'),	                            category = _('Flight Control')},
{combos = {{key = 'Z'}},		                                        down = iCommandPlaneLeftRudderStart,	            up = iCommandPlaneLeftRudderStop,	        name = _('Aircraft Rudder Left'),	                            category = _('Flight Control')},
{combos = {{key = 'X'}},		                                        down = iCommandPlaneRightRudderStart,	            up = iCommandPlaneRightRudderStop,	        name = _('Aircraft Rudder Right'),	                            category = _('Flight Control')},


{combos = {{key = 'Num+'}}, 						                    pressed = iCommandThrottleIncrease,		            up = iCommandThrottleStop,                  name = _('Throttle Up'),		                                category = _('Flight Control')},
{combos = {{key = 'Num-'}}, 						                    pressed = iCommandThrottleDecrease,		            up = iCommandThrottleStop,                  name = _('Throttle Down'),		                                category = _('Flight Control')},
{                            						                    down = Keys.Cutoff,               		            up = Keys.Cutoff,                           name = _('Engine Cutoff else other'),		                    category = _('Flight Control'),                         value_down =  1.0,		value_up = 0.0},

{combos = {{key = 'PageUp'}},							                down = iCommandPlaneAUTIncreaseRegime,	            	                                        name = _('Throttle Step Up'),			                        category = _('Flight Control')},
{combos = {{key = 'PageDown'}},							                down = iCommandPlaneAUTDecreaseRegime,	            	                                        name = _('Throttle Step Down'),			                        category = _('Flight Control')},

{combos = {{key = 'Z', reformers = {'RCtrl'}}},	                        pressed = iCommandPlaneTrimLeftRudder,	            up = iCommandPlaneTrimStop,                 name = _('Trim: Rudder Left'),		                            category = _('Flight Control')},
{combos = {{key = 'X', reformers = {'RCtrl'}}},	                        pressed = iCommandPlaneTrimRightRudder,	            up = iCommandPlaneTrimStop,                 name = _('Trim: Rudder Right'),		                            category = _('Flight Control')},

-- Systems                      
{combos = {{key = 'T'}},							                    down = iCommandPlaneWingtipSmokeOnOff,		                                                    name = _('Smoke'),								                category = _('Systems')},
{combos = {{key = 'L'}},							                    down = iCommandPlaneCockpitIllumination,	                                                    name = _('Illumination Cockpit'),				                category = _('Systems')},
{combos = {{key = 'L', reformers = {'RCtrl'}}},		                    down = iCommandPlaneLightsOnOff,			                                                    name = _('Navigation lights'),					                category = _('Systems')},
{combos = {{key = 'L', reformers = {'RAlt'}}},		                    down = iCommandPlaneHeadLightOnOff,			                                                    name = _('Gear Light Near/Far/Off'),			                category = _('Systems')},
{combos = {{key = 'F'}},							                    down = iCommandPlaneFlaps,					                                                    name = _('Flaps Up/Desc/Land'), 				                category = _('Systems'), value_down =  -1.0},
{                                               	                    down = iCommandPlaneFlaps,				                                                        name = _('Flaps Descend'),				                        category = _('Systems'), value_down =  0.5},
{combos = {{key = 'F', reformers = {'LShift'}}},	                    down = iCommandPlaneFlapsOn,				                                                    name = _('Flaps Landing Position'),				                category = _('Systems')},
{combos = {{key = 'F', reformers = {'LCtrl'}}},		                    down = iCommandPlaneFlapsOff,				                                                    name = _('Flaps Up'),							                category = _('Systems')},
{combos = {{key = 'G'}},							                    down = iCommandPlaneGear,					                                                    name = _('Landing Gear Up/Down'),				                category = _('Systems')},
{combos = {{key = 'G', reformers = {'LCtrl'}}},		                    down = iCommandPlaneGearUp,					                                                    name = _('Landing Gear Up'),					                category = _('Systems')},
{combos = {{key = 'G', reformers = {'LShift'}}},	                    down = iCommandPlaneGearDown,				                                                    name = _('Landing Gear Down'),					                category = _('Systems')},
{                                                                       down = iCommandPlaneGearUp,					        up = iCommandPlaneGearDown,                 name = _('Landing Gear Down else Up'),		                    category = _('Systems')},
{combos = {{key = 'W'}},							                    down = iCommandPlaneWheelBrakeOn,                   up = iCommandPlaneWheelBrakeOff,            name = _('Wheel Brake On'),	                                    category = _('Systems')},
-- {combos = {{key = 'W',	reformers = {'LCtrl'}}},	                    down = iCommandPlaneWheelBrakeLeftOn,	            up = iCommandPlaneWheelBrakeLeftOff,		name = _('Wheel Brake Left - ON/OFF'),		                    category = {_('Systems')}},
-- {combos = {{key = 'W',	reformers = {'LAlt'}}},		                    down = iCommandPlaneWheelBrakeRightOn,	            up = iCommandPlaneWheelBrakeRightOff,		name = _('Wheel Brake Right - ON/OFF'),		                    category = {_('Systems')}},
{combos = {{key = 'C', reformers = {'LCtrl'}}},		                    down = iCommandPlaneFonar,					                                                    name = _('Canopy Open/Close'),					                category = _('Systems')},
{combos = {{key = 'N', reformers = {'RShift'}}},	                    down = iCommandPlaneResetMasterWarning,		                                                    name = _('Audible Warning Reset'),				                category = _('Systems')},
{combos = {{key = 'E', reformers = {'LCtrl'}}},		                    down = iCommandPlaneEject,					                                                    name = _('Eject (3 times)'),					                category = _('Systems')},

-- {													                    down = iCommandPilotSeatAdjustmentUp,	            up = iCommandPilotSeatAdjustmentStop,		name = _('SEAT ADJ Switch - UP/OFF'),		                    category = {_('Systems')}},
-- {													                    down = iCommandPilotSeatAdjustmentDown,	            up = iCommandPilotSeatAdjustmentStop,		name = _('SEAT ADJ Switch - DOWN/OFF'),		                    category = {_('Systems')}},

{combos = {{key = '=', reformers = {'RShift'}}},                        pressed = iCommandAltimeterPressureIncrease,	    up = iCommandAltimeterPressureStop,         name = _('Altimeter Pressure Increase'),                        category = _('Systems')},
{combos = {{key = '-', reformers = {'RShift'}}},                        pressed = iCommandAltimeterPressureDecrease,        up = iCommandAltimeterPressureStop,         name = _('Altimeter Pressure Decrease'),                        category = _('Systems')},

-- Stick                
{combos = {{key = '.', reformers = {'RCtrl'}}},	                        pressed = iCommandPlaneTrimUp,			            up = iCommandPlaneTrimStop,                 name = _('Trim: Nose Up'),			                            category = {_('Stick'), _('HOTAS')}},
{combos = {{key = ';', reformers = {'RCtrl'}}},	                        pressed = iCommandPlaneTrimDown,		            up = iCommandPlaneTrimStop,                 name = _('Trim: Nose Down'),		                            category = {_('Stick'), _('HOTAS')}},
{combos = {{key = ',', reformers = {'RCtrl'}}},	                        pressed = iCommandPlaneTrimLeft,		            up = iCommandPlaneTrimStop,                 name = _('Trim: Left Wing Down'),	                            category = {_('Stick'), _('HOTAS')}},
{combos = {{key = '/', reformers = {'RCtrl'}}},	                        pressed = iCommandPlaneTrimRight,		            up = iCommandPlaneTrimStop,                 name = _('Trim: Right Wing Down'),	                            category = {_('Stick'), _('HOTAS')}},

{                                                                       down = Keys.Call,	                                up = Keys.Call,                             name = _('Call'),                                               category = {_('Stick'), _('HOTAS')},            value_down =  1.0,		value_up = 0.0},

--Throttle
{                                                                       down = Keys.COM1,                                   up = Keys.COM1,                             name = _('COM Fwd - COM1 (V/UHF1)'),                            category = {_('Throttle'), _('HOTAS'), _('Communications')}, value_down =  1.0,		value_up = 0.0},
{                                                                       down = Keys.COM2,                                   up = Keys.COM2,                             name = _('COM Aft - COM2 (V/UHF2)'),                            category = {_('Throttle'), _('HOTAS'), _('Communications')}, value_down =  1.0,		value_up = 0.0},

--NightVision               
{combos = {{key = 'H', reformers = {'RShift'}}}		   ,                down    = iCommandViewNightVisionGogglesOn   ,                                                  name = _('Toggle goggles')   ,                                  category = _('Sensors')},
{combos = {{key = 'H', reformers = {'RShift','RCtrl'}}},                pressed = iCommandPlane_Helmet_Brightess_Up  ,                                                  name = _('Gain goggles up')  ,                                  category = _('Sensors')},
{combos = {{key = 'H', reformers = {'RShift','RAlt'}}} ,                pressed = iCommandPlane_Helmet_Brightess_Down,                                                  name = _('Gain goggles down'),                                  category = _('Sensors')},



{									                                    down = Keys.ElecBatt,                                                                           name = _('Battery On/Off'),                                     category = {_('Electrical')}},
{									                                    down = device_commands.ElecBatt,                up = device_commands.ElecBatt,                  name = _('Battery Reset else On'),                              category = {_('Electrical')},		        value_down =  1.0,      value_up =  0.0,                                               cockpit_device_id = devices.ELECTRIC_SYSTEM},
{									                                    down = device_commands.ElecBatt,                up = device_commands.ElecBatt,                  name = _('Battery Off else On'),                                category = {_('Electrical')},		        value_down =  -1.0,     value_up =  0.0,                                               cockpit_device_id = devices.ELECTRIC_SYSTEM},
{									                                    down = device_commands.ElecBatt,                                                                name = _('Battery On'),                                         category = {_('Electrical')},		        value_down =  0.0,                                                                     cockpit_device_id = devices.ELECTRIC_SYSTEM},
{									                                    down = device_commands.ElecBatt,                                                                name = _('Battery Off'),                                        category = {_('Electrical')},		        value_down =  -1.0,                                                                    cockpit_device_id = devices.ELECTRIC_SYSTEM},
{									                                    down = device_commands.ElecBatt,                                                                name = _('Battery Reset'),                                      category = {_('Electrical')},		        value_down =  1.0,                                                                     cockpit_device_id = devices.ELECTRIC_SYSTEM},

{									                                    down = Keys.ElecGen,                                                                            name = _('Generator On/Off-Reset'),                             category = {_('Electrical')}},
{									                                    down = device_commands.ElecGen,                 up = device_commands.ElecGen,                   name = _('Generator On else Off-Reset'),                        category = {_('Electrical')},	            value_down =  1.0,      value_up =  0.0,                                               cockpit_device_id = devices.ELECTRIC_SYSTEM},
{									                                    down = device_commands.ElecGen,                                                                 name = _('Generator On'),                                       category = {_('Electrical')},	            value_down =  1.0,                                                                     cockpit_device_id = devices.ELECTRIC_SYSTEM},
{									                                    down = device_commands.ElecGen,                                                                 name = _('Generator Off-Reset'),                                category = {_('Electrical')},	            value_down =  0.0,                                                                     cockpit_device_id = devices.ELECTRIC_SYSTEM},

-- mirrors
{combos = {{key = 'M' }},                                               down = iCommandToggleMirrors,                                                                   name = _('Toggle Mirrors'),                                     category = {_('View Cockpit')}},

})
return res
