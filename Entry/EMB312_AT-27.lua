local A27T            = 'EMB312_AT-27'

local armamentos_IN   = {}
local armamentos_OUT  = {}

local armamentosClean = { { CLSID = "<CLEAN>", arg_value = 1 } }
local armamentosTank  = { { CLSID = "{AT27_TANK}" }, }

local bombs_Rockts    = {
	{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" }, --MK81
	{ CLSID = "{MK-81SE}" },
	{ CLSID = "{LAU-33A}" },
	{ CLSID = "{BDU-33}" },
	{ CLSID = "M260_HYDRA" },
	{ CLSID = "M260_HYDRA_WP" },
	{ CLSID = "{LAU68_FFAR_WP156}" },
	{ CLSID = "{LAU68_FFAR_MK1HE}" },
	{ CLSID = "{LAU68_FFAR_MK5HEAT}" },
}

for _, v in ipairs(bombs_Rockts) do
	table.insert(armamentos_IN, v); table.insert(armamentos_OUT, v)
end
for _, v in ipairs(armamentosTank) do
	table.insert(armamentos_IN, v)
end
for _, v in ipairs(armamentosClean) do
	table.insert(armamentos_IN, v); table.insert(armamentos_OUT, v)
end

A27TFM = {
	Name                 = A27T,
	DisplayName          = _('Embraer EMB-312 Tucano (AT-27)'),
	HumanCockpit         = true,
	HumanCockpitPath     = current_mod_path .. '/Cockpit/',
	Picture              = current_mod_path .. '/ImagesGui/AT-27.png',
	Rate                 = 40,
	Shape                = A27T,
	WorldID              = WSTYPE_PLACEHOLDER,
	livery_entry         = A27T,

	propellorShapeType   = "3ARG_PROC_BLUR",
	propellorShapeName   = "EMB312_blade.FBX",
	--propellorShapeBlurX  = 0.6,

	shape_table_data     =
	{
		{
			file        = A27T,
			life        = 18,
			vis         = 3,
			desrt       = 'su-25-oblomok',
			fire        = { 300, 2 },
			username    = A27T,
			index       = WSTYPE_PLACEHOLDER,
			classname   = "lLandPlane",
			positioning = "BYNORMAL",
			drawonmap   = true,
		},
		{
			name = "su-25-oblomok",
			file = "su-25-oblomok",
			fire = { 240, 2 },
		},
	},

	net_animation        = {
		0, -- front gear
		-- 1, -- front gear suspension
		2, -- nose wheel steering
		3, -- main gear
		-- 4, -- main gear suspension
		5, -- main gear
		-- 6, -- main gear suspension
		9, -- right flap
		10, -- left flap
		11, -- right aileron
		12, -- left aileron
		15, -- right elevator
		16, -- left elevator
		17, -- rudder
		21, -- speadbreak
		38, -- canopy
		-- 39, -- pilots heads
		-- 49, -- nav lights
		50, -- pilots fron eject
		-- 51, -- landing lights
		-- 77, -- wheel rollAngle
		83, -- formation lights
		-- 99, -- front pilot up down
		101, -- wheel rolling
		102, -- wheel rolling
		103, -- wheel rolling
		-- 114, -- canopy
		190, -- nav light
		191, -- nav light
		192, -- strobe light
		193, -- landing light
		-- 198, -- beacon light
		200, -- beacon light
		201, -- beacon rotation
		208, -- taxi light
		209, -- search light
		308, -- pylons
		309, -- pylons
		310, -- pylons
		311, -- pylons
		312, -- pylons
		-- 337, -- back pilot head left right
		-- 399, -- back pilot head up down
		407, -- propellerer
		472, -- back pilot disapear
	},

	fires_pos            =
	{
		[1] = { -2.117, -0.9, 0 },
		[2] = { 0.500, 0.213, 0 },
		[3] = { 0.500, 0.213, -2.182 },
		[4] = { -0.82, 0.265, 2.774 },
		[5] = { -0.82, 0.265, -2.774 },
		[6] = { -0.82, 0.255, 2.7274 },
		[7] = { -0.82, 0.255, -2.7274 },
		[8] = { 0.5, -0.5, 2.7578 },
		[9] = { 0.5, -0.5, -2.578 },
		[10] = { 0.50, 0.084, 2.754 },
		[11] = { 0.50, 0.084, -2.7534 },
	},                         -- end of fires_pos

	detection_range_max  = 0,  --is the max range in kilometers that the radar can see something large (e.g. a bomber, tanker, AWACS, etc.).
	radar_can_see_ground = false, -- ground target identification capability, but this has not been verified

	CanopyGeometry       = {   -- campo de visão visual da IA da aeronave
		azimuth = { -160, 160 },
		elevation = { -45, 90 }
	},


	mapclasskey                              = "P0091000025",
	attribute                                = { wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Battleplanes", },
	-- Correção da Categoria para comportamento realista da IA
	Categories                               = { },

	-- Dados Físicos AT-27 (PT-6A)
	M_empty                                  = 1810, -- kg
	M_nominal                                = 2550, -- kg
	M_max                                    = 3175, -- kg
	M_fuel_max                               = 415, -- kg

	H_max                                    = 8750, -- m

	average_fuel_consumption                 = 0.055, -- kg/s

	CAS_min                                  = 45,
	V_opt                                    = 122, -- m/s
	V_take_off                               = 38, -- m/s
	V_land                                   = 34, -- m/s
	V_max_sea_level                          = 127, -- m/s
	V_max_h                                  = 125, -- m/s
	Vy_max                                   = 11.3, -- m/s
	Mach_max                                 = 0.45,
	Ny_min                                   = -3.0,
	Ny_max                                   = 6.0,
	Ny_max_e                                 = 6.0,
	AOA_take_off                             = 0.15,
	bank_angle_max                           = 60,

	has_afteburner                           = false,
	has_speedbrake                           = false,

	flaps_transmission = "Electrical",
	undercarriage_transmission = "Hydraulic",
	undercarriage_movement 		= 5,
	has_differential_stabilizer = false,

	nose_gear_pos                            = { 2.883, -1.55, 0.0 },
	main_gear_pos                            = { -0.122, -1.6, 1.748 },
	tand_gear_max                            = 0.5,
	nose_gear_wheel_diameter                 = 0.359,
	main_gear_wheel_diameter                 = 0.579,

	-----------------------------------------------------------------------
	----------------- SUSPENSION CODE BEGINS ------------------------------
	-----------------------------------------------------------------------

	-- TREM DE POUSO DO NARIZ (Nose Gear)
	-- {X (frente do CG), Y (altura), Z (centro)}
	nose_gear_amortizer_direct_stroke        = 0.0, -- Curso de compressão menor que um jato
	nose_gear_amortizer_reversal_stroke      = -0.10, -- Extensão quando sai do chão (up)
	nose_gear_amortizer_normal_weight_stroke = -0.05, -- Compressão em repouso (peso normal)
	--nose_gear_door_close_after_retract       = true, -- O T-27 fecha as portas do alojamento frontal

	-- TREM DE POUSO PRINCIPAL (Main Gear)
	-- {X (atrás do CG), Y (altura), Z (metade da bitola)}
	main_gear_amortizer_direct_stroke        = 0.0, -- Curso do amortecedor principal
	main_gear_amortizer_reversal_stroke      = -0.15, -- Extensão da perna ao decolar (up)
	main_gear_amortizer_normal_weight_stroke = -0.05, -- Posição da suspensão com avião parado
	--main_gear_door_close_after_retract       = false, -- As pernas principais ficam presas à carenagem externa
	-----------------------------------------------------------------------
	----------------- SUSPENSION CODE ENDS --------------------------------
	-----------------------------------------------------------------------

	wing_area                                = 19.4, -- m2
	wing_span                                = 11.14, -- m
	wing_type                                = 0,
	height                                   = 3.40, -- m
	length                                   = 9.86, -- m

	wing_tip_pos                             = { 0.038, -0.032, 5.393 },
	range                                    = 1916, -- km
	flaps_maneuver                           = 0.5,

	RCS                                      = 2.5,
	IR_emission_coeff                        = 0.08,
	IR_emission_coeff_ab                     = 0.0,

	brakeshute_name                          = 0,
	is_tanker                                = false,
	air_refuel_receptacle_pos                = { 0.0, 0.0, 0.0 },

	engines_count                            = 1,
	engines_nozzles                          =
	{
		[1] =
		{
			pos                 = { 2.636, -0.072, 0.5 }, -- nozzle coords
			elevation           = 0,
			diameter            = 1.023,
			exhaust_length_ab   = 3.794,
			exhaust_length_ab_K = 0.3,
			smokiness_level     = 0.001,
			--elevation   =  0, -- AFB cone elevation
			--diameter	 = 0*0.1, -- AFB cone diameter
			--exhaust_length_ab   = -3.0, -- lenght in m
			--exhaust_length_ab_K = 0.3, -- AB animation
			--engine_number  = 1, --both to first engine
		}, -- end of [1]
		[2] =
		{
			pos                 = { 2.636, -0.072, -0.5 }, -- nozzle coords
			elevation           = 0,
			diameter            = 1.023,
			exhaust_length_ab   = 3.794,
			exhaust_length_ab_K = 0.3,
			smokiness_level     = 0.001,
		}, -- end of [1]
	}, -- end of engines_nozzles

	crew_size                                = 2,
	crew_members                             =
	{
		[1] =
		{
			ejection_through_canopy = true,
			ejection_seat_name      = "pilot_f15_00_seat",
			pilot_name              = "pilot_f15_00",
			drop_canopy_name        = 0,
			drop_parachute_name     = "pilot_f15_parachute",
			pos                     = { 0.5, 0.1, 0.1 },
			canopy_pos              = { 2, 0.5, 0 },
			ejection_play_arg       = 50,
			pilot_body_arg          = 50,
			can_be_playable         = true,
			canopy_args             = { 38, 0.8 },
			ejection_added_speed    = { -4.5, 15, 0.4 },
			ejection_order          = 1,
			role                    = "pilot",
			role_display_name       = _("Pilot"),
			g_suit                  = 1,
			bailout_arg             = -1,
		},
		[2] =
		{
			ejection_through_canopy = true,
			ejection_seat_name      = "pilot_f15_00_seat",
			pilot_name              = "pilot_f15_00",
			drop_canopy_name        = 0,
			drop_parachute_name     = "pilot_f15_parachute",
			pos                     = { -0.8, 0.3, 0.1 },
			canopy_pos              = { 2, 0.5, 0 },
			ejection_added_speed    = { -4, 14.5, -0.4 },
			ejection_play_arg       = 472,
			can_be_playable         = false,
			canopy_args             = { 38, 0.8 },
			pilot_body_arg          = 472,
			ejection_order          = 2,
			role                    = "instructor",
			role_display_name       = _("Instructor pilot"),
			g_suit                  = 1,
			bailout_arg             = -1,
		},
	},

	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Pylons                                   =
	{
		pylon(1, 0, 0, 0, 0,
			{
				arg = 308,
				arg_value = 0.2,
				DisplayName = "1",
				use_full_connector_position = true,
				connector = "Pylon1",
			},
			armamentos_OUT
		),
		pylon(2, 0, 0, 0, 0,
			{
				arg = 309,
				arg_value = 0.2,
				DisplayName = "2",
				use_full_connector_position = true,
				connector = "Pylon2",
			},
			armamentos_IN
		),
		pylon(3, 0, 0, 0, 0,
			{
				arg = 310,
				arg_value = 0.2,
				DisplayName = "3",
				use_full_connector_position = true,
				connector = "Pylon3",
			},
			armamentos_IN
		),
		pylon(4, 0, 0, 0, 0,
			{
				arg = 311,
				arg_value = 0.2,
				DisplayName = "4",
				use_full_connector_position = true,
				connector = "Pylon4",
			},
			armamentos_OUT
		),
	},
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Tasks                                    =
	{
		aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(AFAC),
		aircraft_task(Escort),
		aircraft_task(Reconnaissance),
		aircraft_task(RunwayAttack),
		aircraft_task(AFAC),
	},
	DefaultTask                              = aircraft_task(CAS),

	SFM_Data                                 =
	{
		aerodynamics =
		{
			Cy0        = 0.18,
			Mzalfa     = 4.5,
			Mzalfadt   = 0.8,
			kjx        = 2.25,
			kjz        = 0.001,
			Czbe       = -0.012,

			cx_gear    = 0.0268,
			cx_flap    = 0.140,
			cy_flap    = 0.620,
			cx_brk     = 0.120,

			table_data =
			{
				[1] = { 0.0, 0.055, 0.080, 0.050, 0.020, 0.20, 17.0, 1.60 },
				[2] = { 0.2, 0.055, 0.080, 0.050, 0.020, 0.60, 17.0, 1.40 },
				[3] = { 0.3, 0.060, 0.082, 0.055, 0.025, 0.80, 16.0, 1.35 },
				[4] = { 0.4, 0.070, 0.080, 0.060, 0.030, 0.90, 15.0, 1.30 },
				[5] = { 0.5, 0.085, 0.078, 0.070, 0.040, 0.85, 14.0, 1.20 },
				[6] = { 0.6, 0.110, 0.075, 0.085, 0.060, 0.75, 13.0, 1.00 },
				[7] = { 0.7, 0.150, 0.070, 0.100, 0.080, 0.60, 11.0, 0.70 },
			},
		},
		engine =
		{
			typeng                = 3, -- turboprop
			Nmg                   = 64,
			MinRUD                = 0,
			MaxRUD                = 1,
			MaksRUD               = 1,
			ForsRUD               = 1,
			hMaxEng               = 8.7,
			dcx_eng               = 0.015,
			cemax                 = 0.70,
			cefor                 = 0.70,
			dpdh_m                = 3800,
			dpdh_f                = 3800,

			D_prop                = 2.36,

			Startup_Ignition_Time = 32.0,
			Shutdown_Duration     = 15.0,
			prop_locations        = { { 3.131, -0.082, 0.0 }, },
			prop_blades_count     = 3,
			prop_pitch_min        = 15.0,
			prop_pitch_max        = 87.0,
			prop_pitch_feather    = 87.0,
			Nominal_RPM           = 2200,

			table_data            =
			{
				-- [Index] = {Mach, Dry Thrust (N), Afterburner Thrust (N)}
				[1] = { 0.0, 15000.0, 15000.0 }, -- Tração estática gerada pelo torque
				[2] = { 0.1, 13970.0, 13970.0 },
				[3] = { 0.2, 6985.0, 6985.0 },
				[4] = { 0.3, 4656.7, 4656.7 },
				[5] = { 0.4, 3492.5, 3492.5 },
				[6] = { 0.5, 2794.0, 2794.0 },
				[7] = { 0.6, 2328.3, 2328.3 },
				[8] = { 0.7, 1995.7, 1995.7 },
				[9] = { 0.8, 1746.2, 1746.2 },
				-- Valores acima de Mach 0.6/0.7 não são reais para o voo nivelado do EMB-312,
				-- mas são exigidos pela engine para cálculo em mergulhos em VNE.
			}, -- end of table_data
		},
	},
	sounderName                              = "Aircraft/Planes/AT-27",

	AddPropAircraft                          = {
		{
			id = "SoloFlight",
			control = 'checkbox',
			label = _('Solo Flight'),
			defValue = false,
			weightWhenOn = -80,
			arg = 472,
			argTbl = { [true] = 0.5, [false] = 0 }
		},
		{
			id = "hudAT",
			control = 'checkbox',
			label = _('HUD'),
			defValue = true,
			weightWhenOn = -1,
			arg = 1000,
			argTbl = { [true] = 1, [false] = 0.0 }
		},
		--[[{ id = "PilotHelmet" , control = 'comboList', label = _('Pilot helmet customization'),
          values = {{id =  0, dispName = _("helmet 1")},
                    {id =  1, dispName = _("helmet 2")},
                    {id =  2, dispName = _("helmet 3")},
                    {id =  3, dispName = _("helmet 4")}},
          defValue  = 1,
          wCtrl     = 150,
          arg = 810, -- O número do seu argumento no modelo externo
          argTbl = {
              [0]  = 0.0, 
              [1]  = 0.2, 
              [2] = 0.4, 
              [3] = 0.3  
          }
        },
		{ id = "InstructorHelmet" , control = 'comboList', label = _('Instructor helmet customization'),
          values = {{id =  0, dispName = _("helmet 1")},
                    {id =  1, dispName = _("helmet 2")},
                    {id =  2, dispName = _("helmet 3")},
                    {id =  3, dispName = _("helmet 4")}},
          defValue  = 1,
          wCtrl     = 150,
          arg = 814, -- O número do seu argumento no modelo externo
          argTbl = {
              [0]  = 0.0, 
              [1]  = 0.2, 
              [2] = 0.4, 
              [3] = 0.3 
          }
        },]]--
	},
}
add_aircraft(A27TFM)
