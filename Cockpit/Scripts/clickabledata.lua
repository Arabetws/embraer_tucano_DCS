dofile(LockOn_Options.script_path.."clickable_defs.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")

-- local gettext = require("i_18n")
-- _ = gettext.translate



elements = {}

-- Mirrors
elements["PNT_MIRROR_L"]  = default_2_position_tumb("Toggle Mirrors", 0, 1625, nil)
elements["PNT_MIRROR_R"]  = default_2_position_tumb("Toggle Mirrors", 0, 1625, nil)

-- elements["PNT_2"] = default_2_position_tumb("Hide Stick Toggle", devices.GEAR, Keys.ToggleStick, nil)

-- CANOPY
elements["PNT_26"] = default_2_position_tumb("Canopy", devices.CANOPY, Keys.Canopy, 0)
elements["PNT_26"].animated        = {true, true}
elements["PNT_26"].animation_speed = {2, 2} 

-- ELECTRICAL
elements["PNT_1016"] = default_button("Battery Temp Test",                                          devices.ELECTRIC_SYSTEM, device_commands.ElecBattTempTest,  1016)
elements["PNT_1015"] = default_button("Battery Volt Test",                                          devices.ELECTRIC_SYSTEM, device_commands.ElecBattVoltTest,  1015)
--elements["PNT_1000"] = default_2_position_tumb("Backup (Auto/Off)",                                 devices.ELECTRIC_SYSTEM, device_commands.ElecBkp, 1000)
elements["PNT_1001"] = default_3_position_tumb("Battery (Internal/Off/Ext)",                        devices.ELECTRIC_SYSTEM, device_commands.ElecBatt,          1001,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1002"] = default_3_1_position_tumb("Generator (Rearm/On/Off)",                        devices.ELECTRIC_SYSTEM, device_commands.ElecGen,           1002,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1003"] = default_2_position_tumb("AC Converter - Main (On/Off)",                      devices.ELECTRIC_SYSTEM, device_commands.ACMain,            1003,TOGGLECLICK_MID_FWD)
elements["PNT_1004"] = default_2_position_tumb("AC Converter - Backup (On/Off)",                    devices.ELECTRIC_SYSTEM, device_commands.ACBackup,          1004,TOGGLECLICK_MID_FWD)
elements["PNT_1913"] = default_button_axis("Emer Battery (Test/Brightness)",                        devices.ELECTRIC_SYSTEM, device_commands.EmerBatTest, device_commands.EmerBatBright, 19131, 1913,{0,1}, {0,1})
elements["PNT_1914"] = default_button("Emerg Battery (Test)",                                       devices.ELECTRIC_SYSTEM, device_commands.EmerBat,            1914)

-- AIR COND
elements["PNT_1014"] = default_axis("Cabin Air Temperature",                                        devices.EXTANIM,         device_commands.CabinTemp, 1014, 0.0, -0.2, false, false)
elements["PNT_1017"] = default_axis("Cabin Air Heater",                                             devices.EXTANIM,         device_commands.CabinHeater, 1017, 0.0, 0.2, false, false)
elements["PNT_1018"] = default_axis("Cabin Air External",                                           devices.EXTANIM,         device_commands.CabinExternal, 1018, 0.0, 0.2, false, false)
elements["PNT_1013"] = multiposition_switch("Cabin Air Conditioner",                                devices.EXTANIM,         device_commands.CabinCond, 1013, 6, 1/6, false, 0, KNOBCLICK_MID_FWD)

-- ICE PROTECTION
elements["PNT_1006"] = default_2_position_tumb("Pitot Heat (Heat-Test/Off)",                        devices.EXTANIM,         device_commands.IcePitotPri,    1006,TOGGLECLICK_MID_FWD)
elements["PNT_1005"] = default_2_position_tumb("Pitot / Stat - Sec (On/Off)",                       devices.EXTANIM,         device_commands.IcePitotSec,    1005,TOGGLECLICK_MID_FWD)

-- INTERNAL LIGHTS
elements["PNT_1008"] = default_3_position_tumb("Storm (On/Off)",                                    devices.INTLIGHTS, device_commands.IntLightStorm,        1008,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1011"] = default_2_position_tumb("Panel (On/Off)",                                    devices.INTLIGHTS, device_commands.IntLightPnlOnOff,     1011,TOGGLECLICK_MID_FWD)
elements["PNT_1010"] = default_axis_limited("Panel (Brightness)",                                   devices.INTLIGHTS, device_commands.IntLightPnl,          1010, 0.0,-0.15)
elements["PNT_1009"] = default_axis_limited("Console (Brightness)",                                 devices.INTLIGHTS, device_commands.IntLightCsl,          1009, 0.0,-0.15)
elements["PNT_1012"] = default_2_position_tumb("Alarm Test (On/Off)",                               devices.INTLIGHTS, device_commands.IntLightAlm,          1012)
elements["PNT_1012"].stop_action		= {device_commands.IntLightAlm , device_commands.IntLightAlm}

elements["PNT_1007"] = default_2_position_tumb("Alarm Brightness (Hi/Low)",                         devices.INTLIGHTS, device_commands.IntLightAlmBright,    1007, TOGGLECLICK_MID_FWD)

-- FUEL
elements["PNT_1204"] = default_2_position_tumb("Left Wing Fuel Pump Main (On/Off)",                 devices.FUEL, device_commands.FuelLeftMain,              1204,TOGGLECLICK_MID_FWD)
elements["PNT_12021"] = default_2_position_tumb("Right Wing Fuel Pump Main (On/Off)",               devices.FUEL, device_commands.FuelRightMain,             12021,TOGGLECLICK_MID_FWD)
elements["PNT_1203"] = default_3_position_tumb("Left Wing Fuel Pump Aux (On/Auto/Off)",             devices.FUEL, device_commands.FuelLeftAux,               1203, nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1202"] = default_3_position_tumb("Right Wing Fuel Pump Aux (On/Auto/Off)",            devices.FUEL, device_commands.FuelRightAux,              1202, nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1200"] = default_3_1_position_tumb("Left Ext Fuel Transfer (Start/On/Off)",           devices.FUEL, device_commands.FuelLeftXfr,               1200, nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1201"] = default_3_1_position_tumb("Right Ext Fuel Transfer (Start/On/Off)",          devices.FUEL, device_commands.FuelRightXfr,              1201, nil,true,TOGGLECLICK_MID_FWD)

elements["PNT_1210"] = default_button_axis("Left Wing Fuel Pump Status Main (Test/Brightness)",     devices.FUEL, device_commands.FuelLeftMainStTest, device_commands.FuelLeftMainStBright, 12101, 1210,{0,1}, {0,1})
elements["PNT_1207"] = default_button_axis("Right Wing Fuel Pump Status Main (Test/Brightness)",    devices.FUEL, device_commands.FuelRightMainStTest, device_commands.FuelRightMainStBright, 12071, 1207,{0,1}, {0,1})
elements["PNT_1209"] = default_button_axis("Left Wing Fuel Pump Status Aux (Test/Brightness)",      devices.FUEL, device_commands.FuelLeftAuxStTest, device_commands.FuelLeftAuxStBright, 12091, 1209,{0,1}, {0,1})
elements["PNT_1208"] = default_button_axis("Right Wing Fuel Pump Status Aux (Test/Brightness)",     devices.FUEL, device_commands.FuelRightAuxStTest, device_commands.FuelRightAuxStBright, 12081, 1208,{0,1}, {0,1})
elements["PNT_1205"] = default_button_axis("Left Wing Ext Fuel Transfer Status (Test/Brightness)",  devices.FUEL, device_commands.FuelLeftXfrStTest, device_commands.FuelLeftXfrStBright, 12051, 1205,{0,1}, {0,1})
elements["PNT_1206"] = default_button_axis("Right Wing Ext Fuel Transfer Status (Test/Brightness)", devices.FUEL, device_commands.FuelRightXfrStTest, device_commands.FuelRightXfrStBright, 12061, 1206,{0,1}, {0,1})

elements["PNT_1801"] = default_2_position_tumb("Tot Adjust (On/Off)",                               devices.FUEL, device_commands.TotOn,                     1801,TOGGLECLICK_MID_FWD)

-- ICS
elements["PNT_1211"] = default_2_position_tumb("Audio VHF 1 (On/Off)",                              devices.RADIO, device_commands.RadioVHF1OnOff,           1211,TOGGLECLICK_MID_FWD)
elements["PNT_1212"] = default_2_position_tumb("Audio VHF 2 (On/Off)",                              devices.RADIO, device_commands.RadioVHF2OnOff,           1212,TOGGLECLICK_MID_FWD)
elements["PNT_1213"] = default_2_position_tumb("Audio (On/Off)",                                    devices.RADIO, device_commands.RadioOnOff,               1213,TOGGLECLICK_MID_FWD)
elements["PNT_1214"] = default_2_position_tumb("Audio NAV (On/Off)",                                devices.RADIO, device_commands.RadioNAVOnOff,            1214,TOGGLECLICK_MID_FWD)
elements["PNT_1215"] = default_2_position_tumb("Audio MKR (On/Off)",                                devices.RADIO, device_commands.RadioMKROnOff,            1215,TOGGLECLICK_MID_FWD)
elements["PNT_1216"] = default_2_position_tumb("Audio DME (On/Off)",                                devices.RADIO, device_commands.RadioDMEOnOff,            1216,TOGGLECLICK_MID_FWD)
elements["PNT_1217"] = default_2_position_tumb("Audio ADF (On/Off)",                                devices.RADIO, device_commands.RadioADFOnOff,            1217,TOGGLECLICK_MID_FWD)
elements["PNT_1221"] = default_2_position_tumb("Radio Mode (Normal/Emer)",                          devices.RADIO, device_commands.RadioEmer,                1221,TOGGLECLICK_MID_FWD)
elements["PNT_1220"] = default_axis_limited("Radio (Volume)",                                       devices.RADIO, device_commands.RadioVolume,              1220, {0,1},0.15)
elements["PNT_1219"] = default_2_position_tumb("Audio MKR (Hi/Lo)",                                 devices.RADIO, device_commands.RadioMKRHiLo,             1219,TOGGLECLICK_MID_FWD)
elements["PNT_1218"] = default_2_position_tumb("Audio Call (H/C Mic)",                              devices.RADIO, device_commands.RadioCallHC,              1218,TOGGLECLICK_MID_FWD)

-- Radio
elements["PNT_1222"] = default_button("ADF",                                                        devices.RADIO, device_commands.CrtlXfrRadioADF,          1222)
elements["PNT_1223"] = default_button("VHF 1",                                                      devices.RADIO, device_commands.CrtlXfrRadioVHF1,         1223)
elements["PNT_1224"] = default_button("DME",                                                        devices.RADIO, device_commands.CrtlXfrRadioDME,          1224)
elements["PNT_1225"] = default_button("TDR",                                                        devices.RADIO, device_commands.CrtlXfrRadioTDR,          1225)
elements["PNT_1226"] = default_button("VHF 2",                                                      devices.RADIO, device_commands.CrtlXfrRadioVHF2,         1226)
elements["PNT_1227"] = default_button("NAV",                                                        devices.RADIO, device_commands.CrtlXfrRadioNAV,          1227)

elements["PNT_1228"] = default_button_axis("Radio ATC (Test/Freq)",                                 devices.RADIO, device_commands.RadioATCFreq, device_commands.RadioATCFreqTest, 12281, 1228,{0,1}, {0,1})
elements["PNT_1229"] = default_axis_limited("Radio ATC (Freq)",                                     devices.RADIO, device_commands.RadioATCFreqLarge,         1229, {0,1},0.15)
elements["PNT_1230"] = default_button_axis("Radio ATC",                                             devices.RADIO, device_commands.RadioATCModeSmall, device_commands.RadioATCModeSmallPress, 12301, 1230,{0,1}, {0,1})
elements["PNT_1231"] = multiposition_switch_limited("Radio ATC Mode (Off/Stby/On/Alt Rep)",         devices.RADIO, device_commands.RadioATCModeLarge,        1231, 4, 0.25, false, 0, KNOBCLICK_MID_FWD)
elements["PNT_1232"] = default_button("Radio ATC IDENT",                                            devices.RADIO, device_commands.RadioATCIdent,            1232)

elements["PNT_1238"] = default_button_axis("Radio COM 1 (Freq)",                                    devices.RADIO, device_commands.RadioCOM1Freq, device_commands.RadioCOM1FreqPress, 12381, 1238,{0,1}, {0,1})
elements["PNT_1239"] = default_axis_limited("Radio COM 1 (Freq)",                                   devices.RADIO, device_commands.RadioCOM1FreqLarge,       1239, {0,1},0.15)
elements["PNT_1240"] = default_button_axis("Radio COM 1",                                           devices.RADIO, device_commands.RadioCOM1ModeSmall, device_commands.RadioCOM1ModeSmallPress, 12401, 1240,{0,1}, {0,1})
elements["PNT_1241"] = multiposition_switch_limited("Radio COM 1 Mode (Off/On/Test)",               devices.RADIO, device_commands.RadioCOM1ModeLarge,       1241, 3, 0.5, false, 0, KNOBCLICK_MID_FWD)
elements["PNT_1242"] = default_button("Radio COM 1 Tune",                                           devices.RADIO, device_commands.RadioCOM1Tune,            1242)
elements["PNT_1264"] = default_2_position_tumb("Radio COM 1 Select(A/B)",                           devices.RADIO, device_commands.RadioCOM1Sel,             1264,TOGGLECLICK_MID_FWD)

elements["PNT_1233"] = default_button_axis("Radio COM 2 (Freq)",                                    devices.RADIO, device_commands.RadioCOM2Freq, device_commands.RadioCOM2FreqPress, 12331, 1233,{0,1}, {0,1})
elements["PNT_1234"] = default_axis_limited("Radio COM 2 (Freq)",                                   devices.RADIO, device_commands.RadioCOM2FreqLarge,       1234, {0,1},0.15)
elements["PNT_1235"] = default_button_axis("Radio COM 2",                                           devices.RADIO, device_commands.RadioCOM2ModeSmall, device_commands.RadioCOM2ModeSmallPress, 12351, 1235,{0,1}, {0,1})
elements["PNT_1236"] = multiposition_switch_limited("Radio COM 2 Mode (Off/On/Test)",               devices.RADIO, device_commands.RadioCOM2ModeLarge,       1236, 3, 0.5, false, 0, KNOBCLICK_MID_FWD)
elements["PNT_1237"] = default_button("Radio COM 2 Tune",                                           devices.RADIO, device_commands.RadioCOM2Tune,            1237)
elements["PNT_1266"] = default_2_position_tumb("Radio COM 2 Select(A/B)",                           devices.RADIO, device_commands.RadioCOM2Sel,             1266,TOGGLECLICK_MID_FWD)

elements["PNT_1243"] = default_button_axis("Radio NAV (Freq/Test)",                                 devices.RADIO, device_commands.RadioNAVFreq, device_commands.RadioNAVFreqPress, 12431, 1243,{0,1}, {0,1})
elements["PNT_1244"] = default_axis_limited("Radio NAV (Freq)",                                     devices.RADIO, device_commands.RadioNAVFreqLarge,       1244, {0,1},0.15)
elements["PNT_1245"] = default_button_axis("Radio NAV",                                             devices.RADIO, device_commands.RadioNAVModeSmall, device_commands.RadioNAVModeSmallPress, 12451, 1245,{0,1}, {0,1})
elements["PNT_1246"] = multiposition_switch_limited("Radio NAV (Off/NAV/DME/Freq)",                 devices.RADIO, device_commands.RadioNAVModeLarge,       1246, 4, 1/3, false, 0, KNOBCLICK_MID_FWD)
elements["PNT_1247"] = default_button("Radio NAV Tune",                                             devices.RADIO, device_commands.RadioNAVTune,            1247)
elements["PNT_1265"] = default_2_position_tumb("Radio NAV Select(A/B)",                             devices.RADIO, device_commands.RadioNAVSel,             1265,TOGGLECLICK_MID_FWD)

elements["PNT_1248"] = default_button_axis("Radio ADF (Freq/Test)",                                 devices.RADIO, device_commands.RadioADFFreq, device_commands.RadioADFFreqPress, 12481, 1248,{0,1}, {0,1})
elements["PNT_1249"] = default_axis_limited("Radio ADF (Freq)",                                     devices.RADIO, device_commands.RadioADFFreqLarge,       1249, {0,1},0.15)
elements["PNT_1250"] = default_button_axis("Radio ADF",                                             devices.RADIO, device_commands.RadioADFModeSmall, device_commands.RadioADFModeSmallPress, 12501, 1250,{0,1}, {0,1})
elements["PNT_1251"] = multiposition_switch_limited("Radio ADF (Off/ANT/ADF/Tone)",                 devices.RADIO, device_commands.RadioADFModeLarge,       1251, 4, 1/3, false, 0, KNOBCLICK_MID_FWD)
elements["PNT_1252"] = default_button("Radio ADF Tune",                                             devices.RADIO, device_commands.RadioADFTune,            1252)
elements["PNT_1267"] = default_2_position_tumb("Radio ADF Select(A/B)",                             devices.RADIO, device_commands.RadioADFSel,             1267,TOGGLECLICK_MID_FWD)

-- ALARMS
elements["PNT_1268"] = default_button("Max Speed Test",                                             devices.ALARM, device_commands.MaxSpeedTest,            1268)
elements["PNT_1301"] = default_button("Warning Reset",                                              devices.ALARM, device_commands.WARNING_PRESS,            1301)
elements["PNT_1302"] = default_button("Caution Reset",                                              devices.ALARM, device_commands.CAUTION_PRESS,            1302)

-- NAV
elements["PNT_1910"] = default_button_axis("Interm. (Test/Brightness)",                             devices.LIGHTS, device_commands.IntermTest, device_commands.IntermBright, 19101, 1910,{0,1}, {0,1})
elements["PNT_1911"] = default_button_axis("Ext. (Test/Brightness)",                                devices.LIGHTS, device_commands.ExternalTest, device_commands.ExternalBright, 19111, 1911,{0,1}, {0,1})
elements["PNT_1912"] = default_button_axis("Airway (Test/Brightness)",                              devices.LIGHTS, device_commands.AirwayTest, device_commands.AirwayBright, 19121, 1912,{0,1}, {0,1})
elements["PNT_1253"] = default_2_position_tumb("Pictorial Nav Sync (Clockwise/Anti-Clockwise)",     devices.EXTANIM, device_commands.PictorialNavSinc,       1253,TOGGLECLICK_MID_FWD)
elements["PNT_1254"] = default_3_position_tumb("Pictorial Nav Coupling (Free/Coupled/Fast Coupling)",devices.EXTANIM, device_commands.PictorialNavCoup,       1254, nil,true,TOGGLECLICK_MID_FWD)

elements["PNT_1255"] = default_2_position_tumb("Sight (On/Off)",                                    devices.EXTANIM, device_commands.Sight,                  1255,TOGGLECLICK_MID_FWD)
elements["PNT_1256"] = default_axis_limited("Pedals Adjust",                                        devices.EXTANIM, device_commands.Pedals,                 1256, {0,1},0.15)


-- PARKING BRAKES
elements["PNT_1257"] = default_3_position_tumb("Parking Brakes",                                    devices.BRAKES, device_commands.EmerParkBrake,           1257, nil, true, TOGGLECLICK_MID_FWD)


-- LANDING GEAR
elements["PNT_1260"] = default_button_axis("Landing Gear Doors (Test/Brightness)",                  devices.GEAR, device_commands.LndGearDoorsTest, device_commands.LndGearDoorsBright, 12601, 1260,{0,1}, {0,1})
elements["PNT_1258"] = default_button_axis("Landing Gear Right (Test/Brightness)",                  devices.GEAR, device_commands.LndGearRightTest, device_commands.LndGearRightBright, 12581, 1258,{0,1}, {0,1})
elements["PNT_1259"] = default_button_axis("Landing Gear Left (Test/Brightness)",                   devices.GEAR, device_commands.LndGearLeftTest, device_commands.LndGearLeftBright, 12591, 1259,{0,1}, {0,1})
elements["PNT_1261"] = default_button_axis("Landing Gear Nose (Test/Brightness)",                   devices.GEAR, device_commands.LndGearNoseTest, device_commands.LndGearNoseBright, 12611, 1261,{0,1}, {0,1})
elements["PNT_1262"] = default_button("Landing Gear Emer Up",                                       devices.GEAR, device_commands.LndGearEmerUp,            1262)
elements["PNT_1263"] = default_3_position_tumb("Landing Gear (Up/Neutral/Down)",                    devices.GEAR, device_commands.LndGear,                  1263, nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1922"] = default_button("Beep Supress",                                               devices.GEAR, device_commands.LndGearBeep,              1922)

-- ELT
elements["PNT_1800"] = default_2_position_tumb("ELT (On/Arm)",                                      devices.EXTANIM, device_commands.EltOn,                 1800,TOGGLECLICK_MID_FWD)

-- CLOCK
elements["PNT_96"] = default_axis("Clock",                                                          devices.EXTANIM, device_commands.ClockRotate,           96, 0,-0.15, true, true)
elements["PNT_97"] = default_button("Clock Start/Reset",                                            devices.EXTANIM, device_commands.ClockStart,            97)

-- IAS
elements["PNT_1500"] = default_axis("IAS",                                                          devices.AVIONICS, device_commands.IASSet,               1500, 0,-0.15, true, true)

-- Accel
elements["PNT_98"] = default_button("Acceleration Set",                                             devices.AVIONICS, device_commands.AccelSet,            98)

-- ADI Backup
elements["PNT_66"] = default_button_axis("ADI Backup (Adjust)",                                     devices.AVIONICS, device_commands.ADIAdjustBkpPress, device_commands.ADIAdjustBkpRotate, 67, 66,{0,1}, {-1,1})
elements["PNT_1022"] = default_button_axis("ADI (Adjust)",                                          devices.AVIONICS, device_commands.ADIAdjustPress, device_commands.ADIAdjustRotate, 1022, 1021,{0,1}, {-1,1})

-- Altimeter
elements["PNT_62"] = default_axis("Altimeter (Adjust)",                                             devices.AVIONICS, device_commands.AltPressureKnob,    62, 0,-0.15, true, true)

-- HSI
elements["PNT_1044"] = default_axis("HSI Course (Adjust)",                                          devices.AVIONICS, device_commands.HSICourse,    1044, 0,-0.05, true, true)
elements["PNT_1045"] = default_axis("HSI Heading (Adjust)",                                         devices.AVIONICS, device_commands.HSIHeading,    1045, 0,-0.05, true, true)

-- EXTERNAL LIGHTS
elements["PNT_1918"] = default_button("Beep",                                                       devices.EXTLIGHTS, device_commands.Beep,            1918)
elements["PNT_1917"] = default_3_position_tumb("Taxi (On/Auto/Off)",                                devices.EXTLIGHTS, device_commands.ExtLightTaxi,   1917,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1916"] = default_2_position_tumb("Landing (On/Off)",                                  devices.EXTLIGHTS, device_commands.ExtLightLng,    1916,TOGGLECLICK_MID_FWD)
elements["PNT_1903"] = default_3_position_tumb("Beacon (On/Rear/Off)",                              devices.EXTLIGHTS, device_commands.ExtLightBeacon, 1903,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1902"] = default_2_position_tumb("Navigation (On/Off)",                               devices.EXTLIGHTS, device_commands.ExtLightNav,     1902,TOGGLECLICK_MID_FWD)
elements["PNT_1900"] = default_3_position_tumb("Formation (Brt/Dim/Off)",                           devices.EXTLIGHTS, device_commands.ExtLightNormal, 1900,nil,true,TOGGLECLICK_MID_FWD)

-- ENGINE
elements["PNT_1920"] = default_3_position_tumb("Shutoff Valve (On/Off/Guard)",                     devices.ENGINE,  device_commands.FuelHydBleed, 1920,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1919"] = default_3_position_tumb("Shutoff Valve (On/Off/Guard)",                     devices.ENGINE,  device_commands.FuelHydBleed, 1920,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1921"] = default_button("Fire Test (Test)",                                          devices.ENGINE, device_commands.FireTest,            1921)
elements["PNT_1930"] = default_3_position_tumb("Ignition (On Air/Normal/Off)",                     devices.ENGINE,  device_commands.EngineIgnition, 1930,nil,true,TOGGLECLICK_MID_FWD)
elements["PNT_1931"] = springloaded_3_pos_tumb("Start (Start/Normal/Interrupt",	    	           devices.ENGINE,	 device_commands.EngineStart,    1931, true)
elements["PNT_1915"] = default_3_position_tumb("Innertial Separation (Open/Close)",                 devices.ENGINE, device_commands.EngineInnSep,      1915, nil, true, TOGGLECLICK_MID_FWD)

-- THROTTLE
elements["PNT_80"] = springloaded_3_pos_tumb("Throttle",                                           devices.ENGINE,  device_commands.ThrottleClick,  911, true)
elements["PNT_48"] = multiposition_switch_limited("Flaps (Up/Desc/Land)",                          devices.FLAPS,   device_commands.flaps,       48, 3, 0.5, true, 0, KNOBCLICK_MID_FWD)

elements["PNT_1925"] = default_movable_axis("Friction",                                             devices.EXTANIM, device_commands.Friction,       1925, 0.0,0.1, true, false)

-- TRIMS
elements["PNT_1950"] = springloaded_3_pos_tumb("Aileron Emergency (Left/Stop/Right)",               devices.AVIONICS, device_commands.TrimEmerAil,    1950,true,TOGGLECLICK_MID_FWD)
elements["PNT_1951"] = springloaded_3_pos_tumb("Elevator Emergency (Down/Stop/Up)",                 devices.AVIONICS, device_commands.TrimEmerElev,   1951,true,TOGGLECLICK_MID_FWD)

-- MOC
elements["PNT_1923"] = default_2_position_tumb("MOC Guard (Off/Guard)",                             devices.AVIONICS, device_commands.MOCGuard,    1923,TOGGLECLICK_MID_FWD)
elements["PNT_1924"] = default_axis("MOC (Adjust)",                                                 devices.AVIONICS, device_commands.MOCAdjust,    1924, 0,0.05, false, false)

-- SEAT
elements["PNT_1926"] = springloaded_3_pos_tumb("Seat Adjust (Up/Stop/Down)",                        devices.EXTANIM, device_commands.SeatAdj,    1926,true,TOGGLECLICK_MID_FWD)

