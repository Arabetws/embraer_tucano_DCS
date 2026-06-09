local EMB312F = 'EMB-312F'

local armamentos_IN   = {}

local armamentosClean = { { CLSID = "<CLEAN>", arg_value = 1 } }
local armamentosTank  = { { CLSID = "{AT27_TANK}" }, }

for _, v in ipairs(armamentosTank) do 
	table.insert(armamentos_IN, v) 
end
for _, v in ipairs(armamentosClean) do
	table.insert(armamentos_IN, v); --table.insert(armamentos_OUT, v)
end	

EMB312FFM =  {
    Name                =   EMB312F,
    DisplayName         = _('EMB-312F Tucano (France)'),
    HumanCockpit        = true,
    HumanCockpitPath    = current_mod_path..'/Cockpit/',
    Picture             = current_mod_path..'/ImagesGui/AT-27.png',
    Rate                = 40,
    Shape               = EMB312F,
    WorldID             =  WSTYPE_PLACEHOLDER, 
    livery_entry        = EMB312F,

    propellorShapeType        = "3ARG_PROC_BLUR",
	propellorShapeName        = "EMB312_blade.FBX",
	propellorShapeBlurX       = 0.6,

	shape_table_data          =
	{
		{
			file        = EMB312F,
			life        = 18,
			vis         = 3,
			desrt       = 'su-25-oblomok',
			fire        = { 300, 2 },
			username    = EMB312F,
			index       = WSTYPE_PLACEHOLDER,
			classname   = "lLandPlane",
			positioning = "BYNORMAL",
			drawonmap   = true,
		},
		{
			name  = "su-25-oblomok";
			file  = "su-25-oblomok";
			fire  = { 240, 2};
		},
	},

	net_animation             = { 551, 552, 553, 554, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 140, 141, 142, 900, 901, 99, 400, 401, 402, 38, },
	mapclasskey               = "P0091000025",
	attribute                 = { wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Battleplanes", },
	-- Correção da Categoria para comportamento realista da IA
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Trainer", "Reconnaissance", },	

	-- Dados Físicos AT-27 (PT-6A)
	M_empty                   = 1860,    -- kg (Aumentado em ~50kg para refletir o reforço estrutural do 312F)
    M_nominal                 = 2600,    -- kg (Ajuste proporcional do peso nominal)
    M_max                     = 3175,    -- kg (MTOW permanece o mesmo)
	M_fuel_max                = 415, -- kg

	H_max                     = 8750, -- m

	average_fuel_consumption  = 0.055, -- kg/s

	CAS_min                   = 45,
	V_opt                     = 122, -- m/s
	V_take_off                = 38, -- m/s
	V_land                    = 34, -- m/s
	V_max_sea_level           = 127, -- m/s
	V_max_h                   = 125, -- m/s
	Vy_max                    = 11.3, -- m/s
	Mach_max                  = 0.45,
	Ny_min                    = -3.0,
	Ny_max                    = 6.0,
	Ny_max_e                  = 6.0,
	AOA_take_off              = 0.14,
	bank_angle_max            = 60,

	has_afteburner            = false,
	has_speedbrake            = true,    -- MODIFICADO: Ativa o suporte do motor físico para o Freio Aéreo ventral do EMB-312F

	nose_gear_pos             = { 2.976, -1.55, 0.0 },
	main_gear_pos             = { -0.122, -1.61, 1.816 },
	tand_gear_max             = 1,
	nose_gear_wheel_diameter  = 0.359,
	main_gear_wheel_diameter  = 0.579,

	wing_area                 = 19.4, -- m2
	wing_span                 = 11.14, -- m
	wing_type                 = 0,
	height                    = 3.40, -- m
	length                    = 9.86, -- m

	wing_tip_pos              = { 0.038, -0.032, 5.393 },
	range                     = 1916, -- km
	flaps_maneuver            = 0.5,

	RCS                       = 2.5,
	IR_emission_coeff         = 0.08,
	IR_emission_coeff_ab      = 0.0,

	brakeshute_name           = 0,
	is_tanker                 = false,
	air_refuel_receptacle_pos = { 0.0, 0.0, 0.0 },

	engines_count             = 1,
	engines_nozzles           =
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

	crew_size                 = 2,
	crew_members              =
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
			ejection_order          = 2,
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
			ejection_order          = 1,
			role                    = "instructor",
			role_display_name       = _("Instructor pilot"),
			g_suit                  = 1,
			bailout_arg             = -1,
		},
	},

	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Pylons                    =
	{
		pylon(1, 0, 0, 0, 0,
			{
				arg = 309,
				arg_value = 0.2,
				DisplayName = "2",
				use_full_connector_position = true,
				connector = "Pylon2",
			},
			armamentos_IN
		),
		pylon(2, 0, 0, 0, 0,
			{
				arg = 310,
				arg_value = 0.2,
				DisplayName = "3",
				use_full_connector_position = true,
				connector = "Pylon3",
			},
			armamentos_IN
		),
	},
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Tasks                     =
	{
		aircraft_task(CAS), aircraft_task(AFAC), aircraft_task(AFAC), aircraft_task(Reconnaissance),
    },
	DefaultTask               = aircraft_task(Reconnaissance),

	SFM_Data                  =
	{
		aerodynamics =
		{
			Cy0        = 0.10,
			Mzalfa     = 3.0,
			Mzalfadt   = 0.6,
			kjx        = 2.0,
			kjz        = 0.001,
			Czbe       = -0.012,
			cx_gear    = 0.050,
			cx_flap    = 0.12,
			cy_flap    = 0.50,
			cx_brk     = 0.08,

			table_data =
			{
				[1] = { 0.0, 0.055, 0.080, 0.050, 0.020, 0.20, 17.0, 1.60 },
				[2] = { 0.2, 0.055, 0.080, 0.050, 0.020, 0.60, 17.0, 1.40 },
				[3] = { 0.3, 0.060, 0.082, 0.055, 0.025, 0.80, 16.0, 1.35 },
				[4] = { 0.4, 0.070, 0.080, 0.060, 0.030, 0.90, 15.0, 1.30 },
				[5] = { 0.5, 0.085, 0.078, 0.070, 0.040, 0.85, 14.0, 1.20 },
				[6] = { 0.6, 0.110, 0.075, 0.085, 0.060, 0.75, 13.0, 1.10 },
				[7] = { 0.7, 0.150, 0.070, 0.100, 0.080, 0.60, 11.0, 1.00 },
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

			table_data =
            {
                -- [Index] = {Mach, Dry Thrust (N), Afterburner Thrust (N)}
                [1] =   {0.0,   15000.0,   15000.0}, -- Tração estática gerada pelo torque
                [2] =   {0.1,   13970.0,   13970.0},
                [3] =   {0.2,   6985.0,    6985.0},
                [4] =   {0.3,   4656.7,    4656.7},
                [5] =   {0.4,   3492.5,    3492.5},
                [6] =   {0.5,   2794.0,    2794.0},
                [7] =   {0.6,   2328.3,    2328.3},
                [8] =   {0.7,   1995.7,    1995.7},
                [9] =   {0.8,   1746.2,    1746.2},
                -- Valores acima de Mach 0.6/0.7 não são reais para o voo nivelado do EMB-312, 
                -- mas são exigidos pela engine para cálculo em mergulhos em VNE.
            }, -- end of table_data
		},
	},
	sounderName               = "Aircraft/Planes/AT-27",
}
add_aircraft(EMB312FFM)