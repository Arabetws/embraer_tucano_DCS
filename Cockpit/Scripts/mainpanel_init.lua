-- show_param_handles_list()

shape_name   	   = "Cockpit_T-27"
is_EDM			   = true
new_model_format   = true
ambient_light    = {255,255,255}
ambient_color_day_texture    = {72, 100, 160}
ambient_color_night_texture  = {40, 60 ,150}
ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}
-- fc3_cockpit_draw_args = true
-- ed_fm_set_fc3_cockpit_draw_args_v2
-- use_external_shape=flase
local ft_to_meter = 0.3048

dusk_border					 = 0.4
draw_pilot					 = false

external_model_canopy_arg	 = 38

use_external_views = false

day_texture_set_value   = 0.0
night_texture_set_value = 0.1

local controllers = LoRegisterPanelControls()

mirrors_data =
{
    center_point 	= {0.6,0.099,0.00},
    width 		 	= 1.0, --1.2,
    aspect 		 	= 1.0,
	  rotation 	 	= math.rad(-1);
	  animation_speed = 2.0;
	  near_clip 		= 0.1;
	  middle_clip		= 10;
	  far_clip		= 5000;
}

mirrors_draw                    = CreateGauge()
mirrors_draw.arg_number         = 183
mirrors_draw.input              = {0,1}
mirrors_draw.output             = {0,1}
mirrors_draw.controller         = controllers.mirrors_draw



HideStick                       	= CreateGauge("parameter")
HideStick.arg_number            	= 153
HideStick.parameter_name        	= "HIDE_STICK"
HideStick.input                 	= {0.0, 1.0}
HideStick.output                	= {0.0, 1.0}

StickPitch							= CreateGauge()
StickPitch.arg_number				= 2
StickPitch.input					= {-100, 100}
StickPitch.output					= {-1, 1}
StickPitch.controller				= controllers.base_gauge_StickPitchPosition

StickBank							= CreateGauge()
StickBank.arg_number				= 3
StickBank.input						= {-100, 100}
StickBank.output					= {1, -1}
StickBank.controller				= controllers.base_gauge_StickRollPosition

-- Throttle							= CreateGauge()
-- Throttle.arg_number					= 80
-- Throttle.input						= {0, 1}
-- Throttle.output						= {0, 1}
-- Throttle.controller					= controllers.base_gauge_ThrottleLeftPosition
  
Throttle							                     = CreateGauge("parameter")
Throttle.arg_number					               = 80
Throttle.input						                 = {-1, 1}
Throttle.output						                 = {-1, 1}
Throttle.parameter_name				             = "ENGINE_THROTTLE"
  
RudderPedals						                   = CreateGauge()
RudderPedals.arg_number				             = 4
RudderPedals.input					               = {-100, 100}
RudderPedals.output					               = {-1, 1}
RudderPedals.controller				             = controllers.base_gauge_RudderPosition
  
LeftBrakePedal						                 = CreateGauge("parameter")
LeftBrakePedal.arg_number			             = 5
LeftBrakePedal.input				               = {-1,1}
LeftBrakePedal.output				               = {0,1}
LeftBrakePedal.parameter_name		           = "LEFT_BRAKE_PEDAL"
  
RightBrakePedal						                 = CreateGauge("parameter")
RightBrakePedal.arg_number			           = 6
RightBrakePedal.input				               = {-1,1}
RightBrakePedal.output				             = {0,1}
RightBrakePedal.parameter_name		         = "RIGHT_BRAKE_PEDAL"
  
  

-- Flight Instruments

-- Heading
Heading	        			                    = CreateGauge("parameter")
Heading.arg_number	                      = 10
Heading.input		                          = {0,   2*math.pi}
Heading.output		                        = {1.0, 0.0}
Heading.controller    		                = controllers.base_gauge_Heading

-- Airspeed
AirspeedNeedle				                    = CreateGauge("parameter")
AirspeedNeedle.arg_number	                = 11
AirspeedNeedle.input		                  = {0,   40,   85,  170,  255, 340}
AirspeedNeedle.output		                  = {0.0, 0.04, 0.25, 0.5, 0.75, 1.0}
AirspeedNeedle.parameter_name		          = "AVIONICS_IAS"

AirspeedMaxNeedle				                  = CreateGauge("parameter")
AirspeedMaxNeedle.arg_number	            = 12
AirspeedMaxNeedle.input		                = {0,   40,   85,  170,  255, 340}
AirspeedMaxNeedle.output		              = {0.0, 0.04, 0.25, 0.5, 0.75, 1.0}
AirspeedMaxNeedle.parameter_name		      = "AVIONICS_IAS_MAX"

AirspeedSetNeedle				                  = CreateGauge("parameter")
AirspeedSetNeedle.arg_number	            = 1500
AirspeedSetNeedle.input		                = {0,   40,   85,  170,  255, 340}
AirspeedSetNeedle.output		              = {0.0, 0.04, 0.25, 0.5, 0.75, 1.0}
AirspeedSetNeedle.parameter_name		      = "AVIONICS_IAS_SET"

-- Engine RPM Ng
EngineRPM							                    = CreateGauge("parameter")
EngineRPM.arg_number					            = 13
EngineRPM.input						                = {0, 99, 110}
EngineRPM.output						              = {0, 0.99, 1}
EngineRPM.parameter_name				          = "AVIONICS_RPM"

EngineRPM_Unit							              = CreateGauge("parameter")
EngineRPM_Unit.arg_number					        = 14
EngineRPM_Unit.input						          = {0, 10}
EngineRPM_Unit.output						          = {0, 1}
EngineRPM_Unit.parameter_name				      = "AVIONICS_RPM_UNIT"

-- Propeller RPM Nh
PropellerRPM							                = CreateGauge("parameter")
PropellerRPM.arg_number					          = 15
PropellerRPM.input						            = {0, 99, 110}
PropellerRPM.output						            = {0, 0.99, 1}
PropellerRPM.parameter_name			          = "AVIONICS_PROP_RPM"

PropellerRPM_Unit							            = CreateGauge("parameter")
PropellerRPM_Unit.arg_number					    = 16
PropellerRPM_Unit.input						        = {0, 10}
PropellerRPM_Unit.output						      = {0, 1}
PropellerRPM_Unit.parameter_name				  = "AVIONICS_PROP_RPM_UNIT"


-- Engine T5
EngineT5							                    = CreateGauge("parameter")
EngineT5.arg_number				                = 17
EngineT5.input						                = {0, 600, 850, 1200}
EngineT5.output						                = {0, 0.25, 0.75, 1}
EngineT5.parameter_name		                = "AVIONICS_T5"

-- Fuel Flow
EngineFF							                    = CreateGauge("parameter")
EngineFF.arg_number					              = 18
EngineFF.input						                = {0, 500}
EngineFF.output						                = {0, 1}
EngineFF.parameter_name				            = "AVIONICS_FF"

-- Total Fuel
EngineTotalFuel_1000							        = CreateGauge("parameter")
EngineTotalFuel_1000.arg_number					  = 19
EngineTotalFuel_1000.input						    = {0, 1}
EngineTotalFuel_1000.output						    = {0, 1}
EngineTotalFuel_1000.parameter_name				= "AVIONICS_TOTAL_FUEL_1000"

EngineTotalFuel_100							          = CreateGauge("parameter")
EngineTotalFuel_100.arg_number					  = 20
EngineTotalFuel_100.input						      = {0, 1}
EngineTotalFuel_100.output						    = {0, 1}
EngineTotalFuel_100.parameter_name				= "AVIONICS_TOTAL_FUEL_100"

EngineTotalFuel_10							          = CreateGauge("parameter")
EngineTotalFuel_10.arg_number					    = 21
EngineTotalFuel_10.input						      = {0, 1}
EngineTotalFuel_10.output						      = {0, 1}
EngineTotalFuel_10.parameter_name				  = "AVIONICS_TOTAL_FUEL_10"

EngineTotalFuel_1							            = CreateGauge("parameter")
EngineTotalFuel_1.arg_number					    = 22
EngineTotalFuel_1.input						        = {0, 1}
EngineTotalFuel_1.output						      = {0, 1}
EngineTotalFuel_1.parameter_name				  = "AVIONICS_TOTAL_FUEL_1"

-- Wings Fuel
EngineTotalFuelLeft							          = CreateGauge("parameter")
EngineTotalFuelLeft.arg_number			      = 23
EngineTotalFuelLeft.input						      = {0, 600}
EngineTotalFuelLeft.output						    = {0, 1}
EngineTotalFuelLeft.parameter_name		    = "AVIONICS_TOTAL_FUEL_LEFT"

EngineTotalFuelRight							        = CreateGauge("parameter")
EngineTotalFuelRight.arg_number			      = 24
EngineTotalFuelRight.input						    = {0, 600}
EngineTotalFuelRight.output						    = {0, 1}
EngineTotalFuelRight.parameter_name		    = "AVIONICS_TOTAL_FUEL_RIGHT"

-- Canopy
Canopy    							                  = CreateGauge()
Canopy.arg_number 			              		= 26
Canopy.input   					              	  = {0,1}
Canopy.output  					              	  = {0,1}
Canopy.controller 			              		= controllers.base_gauge_CanopyPos

--Turn Indicator
TurnNeedle				                        = CreateGauge("parameter")
TurnNeedle.arg_number	                    = 27
TurnNeedle.input		                      = {-6, 6}
TurnNeedle.output		                      = {1.0, -1.0}
TurnNeedle.parameter_name	                = "AVIONICS_TURN_RATE"

Slipball				                          = CreateGauge("parameter")
Slipball.arg_number		                    = 28
Slipball.input			                      = {-math.pi, math.pi}
Slipball.output			                      = {-1.0, 1.0}
Slipball.parameter_name		                = "BASE_SENSOR_AOS"

VerticalVelocity					                = CreateGauge()
VerticalVelocity.arg_number		            = 29
VerticalVelocity.input				            = {-6000*ft_to_meter/60, -4000*ft_to_meter/60, -2000*ft_to_meter/60, -1000*ft_to_meter/60, -500*ft_to_meter/60, 0, 500*ft_to_meter/60, 1000*ft_to_meter/60, 2000*ft_to_meter/60, 4000*ft_to_meter/60, 6000*ft_to_meter/60} --1000ft/min => m/s
VerticalVelocity.output				            = {-1.0, -0.76, -0.50, -0.29, -0.15, 0.0, 0.15, 0.29, 0.50, 0.76, 1.0}
VerticalVelocity.controller		            = controllers.base_gauge_VerticalVelocity

-- Altimeter
Altimeter_10000_footPtr				            = CreateGauge("parameter")
Altimeter_10000_footPtr.arg_number	      = 30
Altimeter_10000_footPtr.input		          = {0.0, 1.0}
Altimeter_10000_footPtr.output		        = {0.0, 1.0}
Altimeter_10000_footPtr.parameter_name		= "AVIONICS_ALT_10000"

Altimeter_1000_footPtr				            = CreateGauge("parameter")
Altimeter_1000_footPtr.arg_number	        = 31
Altimeter_1000_footPtr.input		          = {0.0, 1.0}
Altimeter_1000_footPtr.output		          = {0.0, 1.0}
Altimeter_1000_footPtr.parameter_name		  = "AVIONICS_ALT_1000"

Altimeter_100_footPtr				              = CreateGauge("parameter")
Altimeter_100_footPtr.arg_number	        = 32
Altimeter_100_footPtr.input			          = {0.0, 1.0}
Altimeter_100_footPtr.output		          = {0.0, 1.0}
Altimeter_100_footPtr.parameter_name		  = "AVIONICS_ALT_100"

Altimeter_Pressure_1000_mb					      = CreateGauge("parameter")
Altimeter_Pressure_1000_mb.arg_number		  = 33
Altimeter_Pressure_1000_mb.input			    = {0, 1}
Altimeter_Pressure_1000_mb.output			    = {0.0, 1.0}
Altimeter_Pressure_1000_mb.parameter_name	= "AVIONICS_ALT_MB_1000"

Altimeter_Pressure_100_mb					        = CreateGauge("parameter")
Altimeter_Pressure_100_mb.arg_number		  = 34
Altimeter_Pressure_100_mb.input			      = {0, 1}
Altimeter_Pressure_100_mb.output			    = {0.0, 1.0}
Altimeter_Pressure_100_mb.parameter_name	= "AVIONICS_ALT_MB_100"

Altimeter_Pressure_10_mb					        = CreateGauge("parameter")
Altimeter_Pressure_10_mb.arg_number		    = 35
Altimeter_Pressure_10_mb.input			      = {0, 1}
Altimeter_Pressure_10_mb.output			      = {0.0, 1.0}
Altimeter_Pressure_10_mb.parameter_name		= "AVIONICS_ALT_MB_10"

Altimeter_Pressure_1_mb					          = CreateGauge("parameter")
Altimeter_Pressure_1_mb.arg_number		    = 36
Altimeter_Pressure_1_mb.input			        = {0, 1}
Altimeter_Pressure_1_mb.output			      = {0.0, 1.0}
Altimeter_Pressure_1_mb.parameter_name		= "AVIONICS_ALT_MB_1"

Altimeter_Pressure_1000_inhg					    = CreateGauge("parameter")
Altimeter_Pressure_1000_inhg.arg_number		= 37
Altimeter_Pressure_1000_inhg.input			  = {0, 1}
Altimeter_Pressure_1000_inhg.output			  = {0.0, 1.0}
Altimeter_Pressure_1000_inhg.parameter_name = "AVIONICS_ALT_INHG_1000"

Altimeter_Pressure_100_inhg					      = CreateGauge("parameter")
Altimeter_Pressure_100_inhg.arg_number		= 38
Altimeter_Pressure_100_inhg.input			    = {0, 1}
Altimeter_Pressure_100_inhg.output			  = {0.0, 1.0}
Altimeter_Pressure_100_inhg.parameter_name  = "AVIONICS_ALT_INHG_100"

Altimeter_Pressure_10_inhg					      = CreateGauge("parameter")
Altimeter_Pressure_10_inhg.arg_number		  = 39
Altimeter_Pressure_10_inhg.input			    = {0, 1}
Altimeter_Pressure_10_inhg.output			    = {0.0, 1.0}
Altimeter_Pressure_10_inhg.parameter_name = "AVIONICS_ALT_INHG_10"

Altimeter_Pressure_1_inhg					        = CreateGauge("parameter")
Altimeter_Pressure_1_inhg.arg_number		  = 40
Altimeter_Pressure_1_inhg.input			      = {0, 1}
Altimeter_Pressure_1_inhg.output			    = {0.0, 1.0}
Altimeter_Pressure_1_inhg.parameter_name  = "AVIONICS_ALT_INHG_1"

-- Accel
Accel                    					        = CreateGauge("parameter")
Accel.arg_number		                      = 41
Accel.input			                          = {-5, 0, 10}
Accel.output			                        = {-1.0, 0, 1.0}
Accel.parameter_name                      = "AVIONICS_ACCEL"

AccelMax                    					    = CreateGauge("parameter")
AccelMax.arg_number		                    = 42
AccelMax.input			                      = {-5, 0, 10}
AccelMax.output			                      = {-1.0, 0, 1.0}
AccelMax.parameter_name                   = "AVIONICS_ACCEL_MAX"

AccelMin                    					    = CreateGauge("parameter")
AccelMin.arg_number		                    = 43
AccelMin.input			                      = {-5, 0, 10}
AccelMin.output			                      = {-1.0, 0, 1.0}
AccelMin.parameter_name                   = "AVIONICS_ACCEL_MIN"


local RADIANS_TO_DEGREES = 57.2958

ADIRoll                                   = CreateGauge()
ADIRoll.arg_number                        = 44
ADIRoll.input                             = {math.rad(-180), math.rad(180)}
ADIRoll.output                            = {1.0, -1.0}
ADIRoll.controller		                    = controllers.base_gauge_Roll

ADIPitch                                  = CreateGauge()
ADIPitch.arg_number                       = 45
ADIPitch.input                            = {math.rad(-180), math.rad(180)}
ADIPitch.output                           = {-1.0, 1.0}
ADIPitch.controller		                    = controllers.base_gauge_Pitch

ADIOff                                    = CreateGauge("parameter")
ADIOff.arg_number                         = 46
ADIOff.input                              = {0, 1}
ADIOff.output                             = {0, 1}
ADIOff.parameter_name		                  = "ELEC_AVIONICS_OK"

ADIOff                                    = CreateGauge("parameter")
ADIOff.arg_number                         = 65
ADIOff.input                              = {0, 1}
ADIOff.output                             = {0, 1}
ADIOff.parameter_name		                  = "ELEC_AVIONICS_OK"

-- -- Flaps
-- Flaps                                     = CreateGauge()
-- Flaps.arg_number                          = 48
-- Flaps.input                               = {0, 1}
-- Flaps.output                              = {0, 1}
-- Flaps.controller		                      = controllers.base_gauge_FlapsPos

-- HSI
HSIHdg                                    = CreateGauge("parameter")
HSIHdg.arg_number                         = 49
HSIHdg.input                              = {0, math.rad(360)}
HSIHdg.output                             = {0, 1}
HSIHdg.parameter_name		                  = "AVIONICS_HSI_HDG"

HSICourse                                 = CreateGauge("parameter")
HSICourse.arg_number                      = 50
HSICourse.input                           = {0, math.rad(360)}
HSICourse.output                          = {0, 1}
HSICourse.parameter_name		              = "AVIONICS_HSI_COURSE"

HSINavFlag                                = CreateGauge("parameter")
HSINavFlag.arg_number                     = 51
HSINavFlag.input                          = {0, 1}
HSINavFlag.output                         = {0, 1}
HSINavFlag.parameter_name		              = "AVIONICS_HSI_NAV_FLAG"

HSIHdgFlag                                = CreateGauge("parameter")
HSIHdgFlag.arg_number                     = 52
HSIHdgFlag.input                          = {0, 1}
HSIHdgFlag.output                         = {0, 1}
HSIHdgFlag.parameter_name		              = "AVIONICS_HSI_HDG_FLAG"

HSICourseInd                              = CreateGauge("parameter")
HSICourseInd.arg_number                   = 53
HSICourseInd.input                        = {-1, 1}
HSICourseInd.output                       = {-1, 1}
HSICourseInd.parameter_name		            = "AVIONICS_HSI_COURSE_IND"

HSIGSFlag                                 = CreateGauge("parameter")
HSIGSFlag.arg_number                      = 54
HSIGSFlag.input                           = {0, 1}
HSIGSFlag.output                          = {0, 1}
HSIGSFlag.parameter_name		              = "AVIONICS_HSI_GS_FLAG"

HSIGSInd                                 = CreateGauge("parameter")
HSIGSInd.arg_number                      = 55
HSIGSInd.input                           = {-1, 1}
HSIGSInd.output                          = {-1, 1}
HSIGSInd.parameter_name		               = "AVIONICS_HSI_GS_IND"

-- TRIM
TRIM_Ailero                              = CreateGauge("parameter")
TRIM_Ailero.arg_number                   = 90
TRIM_Ailero.input                        = {-45, 45}
TRIM_Ailero.output                       = {1, -1}
TRIM_Ailero.parameter_name	             = "AVIONICS_TRIM_WINGLEFTRIGHT"

TRIM_Elevat                              = CreateGauge("parameter")
TRIM_Elevat.arg_number                   = 91
TRIM_Elevat.input                        = {-10, 10}
TRIM_Elevat.output                       = {1, -1}
TRIM_Elevat.parameter_name	             = "AVIONICS_TRIM_UPDOWN"

TRIM_Rudder                              = CreateGauge("parameter")
TRIM_Rudder.arg_number                   = 92
TRIM_Rudder.input                        = {-10, 10}
TRIM_Rudder.output                       = {-1, 1}
TRIM_Rudder.parameter_name	             = "AVIONICS_TRIM_RUDDERLEFTRIGHT"

-- Oil Pressure
OilPress							                = CreateGauge("parameter")
OilPress.arg_number					          = 82
OilPress.input						            = {0, 40, 100}
OilPress.output						            = {0, 0.1, 1}
OilPress.parameter_name			          = "AVIONICS_OIL_PRESS"

-- Oil Temp
OilTemp							                = CreateGauge("parameter")
OilTemp.arg_number					          = 83
OilTemp.input						            = {-10, 0, 60, 120}
OilTemp.output						            = {-0.1, 0, 0.5, 1}
OilTemp.parameter_name			          = "AVIONICS_OIL_TEMP"

for i=1,35 do
    Light                                = CreateGauge("parameter")
    Light.arg_number      	             = 200+i
    Light.input           	             = {0,1}
    Light.output          	             = {0,1}
    Light.parameter_name		             = "LIGHT_" ..  tostring(200+i)
    Light                                = nil
end

-- Light                                  

-- PnlBacklight	                 = CreateGauge("parameter")
-- PnlBacklight.arg_number      	= 201
-- PnlBacklight.input           	= {0,1}
-- PnlBacklight.output          	= {0,1}
-- PnlBacklight.parameter_name		= "PNL_BACKLIGHT"

-- CslBacklight	                 = CreateGauge("parameter")
-- CslBacklight.arg_number      	= 202
-- CslBacklight.input           	= {0,1}
-- CslBacklight.output          	= {0,1}
-- CslBacklight.parameter_name		= "CSL_BACKLIGHT"

-- Chartlight	                 	= CreateGauge("parameter")
-- Chartlight.arg_number      	= 203
-- Chartlight.input           	= {0,1}
-- Chartlight.output          	= {0,1}
-- Chartlight.parameter_name		= "CHART_LIGHT"

-- Stormlight	                 	= CreateGauge("parameter")
-- Stormlight.arg_number      	= 204
-- Stormlight.input           	= {0,1}
-- Stormlight.output          	= {0,1}
-- Stormlight.parameter_name		= "STORM_LIGHT"

-- PBrakeLight	               		= CreateGauge("parameter")
-- PBrakeLight.arg_number     	 	= 208
-- PBrakeLight.input          	 	= {0,1}
-- PBrakeLight.output         	 	= {0,1}
-- PBrakeLight.parameter_name		= "PBRAKE_LIGHT"

AlarmLight	               		= CreateGauge("parameter")
AlarmLight.arg_number     	 	= 200
AlarmLight.input          	 	= {0,1}
AlarmLight.output         	 	= {0,1}
AlarmLight.parameter_name		= "PANEL_ALARM_TEST"

GearNoseLight	            	= CreateGauge("parameter")
GearNoseLight.arg_number     	= 261
GearNoseLight.input          	= {0,1}
GearNoseLight.output         	= {0,1}
GearNoseLight.parameter_name	= "GEAR_NOSE_LIGHT"

GearLeftLight	            	= CreateGauge("parameter")
GearLeftLight.arg_number     	= 262
GearLeftLight.input          	= {0,1}
GearLeftLight.output         	= {0,1}
GearLeftLight.parameter_name	= "GEAR_LEFT_LIGHT"

GearRightLight	            	= CreateGauge("parameter")
GearRightLight.arg_number     	= 263
GearRightLight.input          	= {0,1}
GearRightLight.output         	= {0,1}
GearRightLight.parameter_name	= "GEAR_RIGHT_LIGHT"

GearDoorLight	            	= CreateGauge("parameter")
GearDoorLight.arg_number     	= 264
GearDoorLight.input          	= {0,1}
GearDoorLight.output         	= {0,1}
GearDoorLight.parameter_name	= "GEAR_DOOR_LIGHT"

GearHandleLight	           		= CreateGauge("parameter")
GearHandleLight.arg_number 	 	= 265
GearHandleLight.input      	 	= {0,1}
GearHandleLight.output     	 	= {0,1}
GearHandleLight.parameter_name	= "GEAR_HANDLE_LIGHT"


need_to_be_closed = true -- close lua state after initialization

Z_test =
{
	near = 0.05,
	far  = 4.0,
}

livery = "AFA"

--[[ available functions

 --base_gauge_RadarAltitude
 --base_gauge_BarometricAltitude
 --base_gauge_AngleOfAttack
 --base_gauge_AngleOfSlide
 --base_gauge_VerticalVelocity
 --base_gauge_TrueAirSpeed
 --base_gauge_IndicatedAirSpeed
 --base_gauge_MachNumber
 --base_gauge_VerticalAcceleration --Ny
 --base_gauge_HorizontalAcceleration --Nx
 --base_gauge_LateralAcceleration --Nz
 --base_gauge_RateOfRoll
 --base_gauge_RateOfYaw
 --base_gauge_RateOfPitch
 --base_gauge_Roll
 --base_gauge_MagneticHeading
 --base_gauge_Pitch
 --base_gauge_Heading
 --base_gauge_EngineLeftFuelConsumption
 --base_gauge_EngineRightFuelConsumption
 --base_gauge_EngineLeftTemperatureBeforeTurbine
 --base_gauge_EngineRightTemperatureBeforeTurbine
 --base_gauge_EngineLeftRPM
 --base_gauge_EngineRightRPM
 --base_gauge_WOW_RightMainLandingGear
 --base_gauge_WOW_LeftMainLandingGear
 --base_gauge_WOW_NoseLandingGear
 --base_gauge_RightMainLandingGearDown
 --base_gauge_LeftMainLandingGearDown
 --base_gauge_NoseLandingGearDown
 --base_gauge_RightMainLandingGearUp
 --base_gauge_LeftMainLandingGearUp
 --base_gauge_NoseLandingGearUp
 --base_gauge_LandingGearHandlePos
 --base_gauge_StickRollPosition
 --base_gauge_StickPitchPosition
 --base_gauge_RudderPosition
 --base_gauge_ThrottleLeftPosition
 --base_gauge_ThrottleRightPosition
 --base_gauge_HelicopterCollective
 --base_gauge_HelicopterCorrection
 --base_gauge_CanopyPos
 --base_gauge_CanopyState
 --base_gauge_FlapsRetracted
 --base_gauge_SpeedBrakePos
 --base_gauge_FlapsPos
 --base_gauge_TotalFuelWeight




/* protected: virtual void __cdecl cockpit::ccMainPanel::register_gauge_controllers(struct lua_State * __ptr64,int) __ptr64 */

void __thiscall cockpit::ccMainPanel::register_gauge_controllers(ccMainPanel *this,lua_State *param_1,int param_2)

{
                    /* 0x1b8e20  4479  ?register_gauge_controllers@ccMainPanel@cockpit@@MEAAXPEAUlua_State@@H@Z */
  lua_pushstring(param_1,"day_night_texture_switcher");
  lua_pushlightuserdata(param_1,&l_day_night_texture_switcher);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"mirrors_draw");
  lua_pushlightuserdata(param_1,l_mirrors_draw);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"pilot_draw");
  lua_pushlightuserdata(param_1,&_pilot_draw);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"Panel_Shake_Y");
  lua_pushlightuserdata(param_1,&l_Panel_Shake_Y);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"Panel_Shake_Z");
  lua_pushlightuserdata(param_1,l_Panel_Shake_Z);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"Panel_Rot_X");
  lua_pushlightuserdata(param_1,&l_Panel_Rot_X);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"head_shift_X");
  lua_pushlightuserdata(param_1,&l_head_shift_X);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"head_shift_Y");
  lua_pushlightuserdata(param_1,&l_head_shift_Y);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"head_shift_Z");
  lua_pushlightuserdata(param_1,&l_head_shift_Z);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"canopy");
  lua_pushlightuserdata(param_1,l_canopy);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RadarAltitude");
  lua_pushlightuserdata(param_1,l_base_gauge_RadarAltitude);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_BarometricAltitude");
  lua_pushlightuserdata(param_1,l_base_gauge_BarometricAltitude);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_AngleOfAttack");
  lua_pushlightuserdata(param_1,&l_base_gauge_AngleOfAttack);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_AngleOfSlide");
  lua_pushlightuserdata(param_1,FUN_1801b3a10);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_VerticalVelocity");
  lua_pushlightuserdata(param_1,FUN_1801b4c70);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_TrueAirSpeed");
  lua_pushlightuserdata(param_1,FUN_1801b4b90);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_IndicatedAirSpeed");
  lua_pushlightuserdata(param_1,FUN_1801b4110);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_MachNumber");
  lua_pushlightuserdata(param_1,FUN_1801b4340);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_VerticalAcceleration");
  lua_pushlightuserdata(param_1,FUN_1801b4c00);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_HorizontalAcceleration");
  lua_pushlightuserdata(param_1,FUN_1801b40a0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_LateralAcceleration");
  lua_pushlightuserdata(param_1,FUN_1801b41f0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RateOfRoll");
  lua_pushlightuserdata(param_1,FUN_1801b4650);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RateOfYaw");
  lua_pushlightuserdata(param_1,FUN_1801b46c0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RateOfPitch");
  lua_pushlightuserdata(param_1,FUN_1801b45e0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_Roll");
  lua_pushlightuserdata(param_1,FUN_1801b4810);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_MagneticHeading");
  lua_pushlightuserdata(param_1,FUN_1801b43b0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_Pitch");
  lua_pushlightuserdata(param_1,FUN_1801b4500);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_Heading");
  lua_pushlightuserdata(param_1,FUN_1801b3f50);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_EngineLeftFuelConsumption");
  lua_pushlightuserdata(param_1,FUN_1801b3bd0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_EngineRightFuelConsumption");
  lua_pushlightuserdata(param_1,FUN_1801b3d20);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_EngineLeftTemperatureBeforeTurbine");
  lua_pushlightuserdata(param_1,FUN_1801b3cb0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_EngineRightTemperatureBeforeTurbine");
  lua_pushlightuserdata(param_1,FUN_1801b3e00);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_EngineLeftRPM");
  lua_pushlightuserdata(param_1,FUN_1801b3c40);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_EngineRightRPM");
  lua_pushlightuserdata(param_1,FUN_1801b3d90);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_WOW_RightMainLandingGear");
  lua_pushlightuserdata(param_1,FUN_1801b4dc0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_WOW_LeftMainLandingGear");
  lua_pushlightuserdata(param_1,FUN_1801b4ce0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_WOW_NoseLandingGear");
  lua_pushlightuserdata(param_1,FUN_1801b4d50);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RightMainLandingGearDown");
  lua_pushlightuserdata(param_1,FUN_1801b4730);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_LeftMainLandingGearDown");
  lua_pushlightuserdata(param_1,FUN_1801b4260);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_NoseLandingGearDown");
  lua_pushlightuserdata(param_1,FUN_1801b4420);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RightMainLandingGearUp");
  lua_pushlightuserdata(param_1,FUN_1801b47a0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_LeftMainLandingGearUp");
  lua_pushlightuserdata(param_1,FUN_1801b42d0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_NoseLandingGearUp");
  lua_pushlightuserdata(param_1,FUN_1801b4490);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_LandingGearHandlePos");
  lua_pushlightuserdata(param_1,FUN_1801b4180);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_StickRollPosition");
  lua_pushlightuserdata(param_1,FUN_1801b49d0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_StickPitchPosition");
  lua_pushlightuserdata(param_1,FUN_1801b4960);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_RudderPosition");
  lua_pushlightuserdata(param_1,FUN_1801b4880);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_ThrottleLeftPosition");
  lua_pushlightuserdata(param_1,FUN_1801b4a40);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_ThrottleRightPosition");
  lua_pushlightuserdata(param_1,FUN_1801b4ab0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_HelicopterCollective");
  lua_pushlightuserdata(param_1,FUN_1801b3fc0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_HelicopterCorrection");
  lua_pushlightuserdata(param_1,FUN_1801b4030);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_CanopyPos");
  lua_pushlightuserdata(param_1,l_canopy);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_CanopyState");
  lua_pushlightuserdata(param_1,FUN_1801b3b60);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_FlapsRetracted");
  lua_pushlightuserdata(param_1,FUN_1801b3ee0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_SpeedBrakePos");
  lua_pushlightuserdata(param_1,FUN_1801b48f0);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_FlapsPos");
  lua_pushlightuserdata(param_1,FUN_1801b3e70);
  lua_settable(param_1,param_2);
  lua_pushstring(param_1,"base_gauge_TotalFuelWeight");
  lua_pushlightuserdata(param_1,FUN_1801b4b20);
  lua_settable(param_1,param_2);
  return;
}

--]]
