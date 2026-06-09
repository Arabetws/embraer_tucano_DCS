local SHORTST = 'Shorts-Tucano-T1'

SHORTSTFM =  {
    Name                =   SHORTST,
    DisplayName         = _('Shorts Tucano T.Mk1'),
    HumanCockpit        = true,
    HumanCockpitPath    = current_mod_path..'/Cockpit/',
    Picture             = current_mod_path..'/ImagesGui/ShortsT1.png',
    Rate                = 40,
    Shape               = SHORTST,
    WorldID             =  WSTYPE_PLACEHOLDER, 
    livery_entry        = SHORTST,

    propellorShapeType        = "3ARG_PROC_BLUR",
	propellorShapeName        = "EMB312_blade.FBX",
	propellorShapeBlurX       = 0.6,

	shape_table_data          =
	{
		{
			file        = SHORTST,
			life        = 18,
			vis         = 3,
			desrt       = 'su-25-oblomok',
			fire        = { 300, 2 },
			username    = SHORTST,
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
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Trainer", "Reconnaissance"},	

	-- Dados Físicos Shorts Tucano T1 (Garrett TPE331-12B)
    M_empty                   = 2017,    -- kg (Aeronave consideravelmente mais pesada que o T-27)
    M_nominal                 = 2700,    -- kg (Ajuste proporcional do peso nominal com combustível e 2 pilotos)
    M_max                     = 3275,    -- kg (MTOW do Shorts é maior, chegando a 7,220 lbs)
    M_fuel_max                = 415,     -- kg

    H_max                     = 10365,   -- m (Teto de serviço elevado para 34.000 pés devido ao motor mais potente)

    average_fuel_consumption  = 0.080,   -- kg/s (O Garrett 1.100 SHP tem um consumo maior que o PT6)

    CAS_min                   = 40,      -- m/s (Velocidade de estol ligeiramente ajustada)
    V_opt                     = 113,     -- m/s (Velocidade de cruzeiro ~407 km/h ou 220 knots)
    V_take_off                = 38,      -- m/s
    V_land                    = 32,      -- m/s 
    V_max_sea_level           = 141,     -- m/s (Velocidade máxima aumentada para ~507 km/h ou 274 knots)
    V_max_h                   = 141,     -- m/s
    Vy_max                    = 17.8,    -- m/s (Taxa de subida absurdamente maior: 3.510 ft/min no Shorts vs 2.200 ft/min no Embraer)
    Mach_max                  = 0.52,    -- Limite de Mach estrutural aumentado
    
    -- Envelope G (A RAF exigiu reforços que aumentaram a tolerância G)
    Ny_min                    = -3.6,
    Ny_max                    = 7.0,
    Ny_max_e                  = 7.0,
    
    AOA_take_off              = 0.14,
    bank_angle_max            = 60,

    has_afteburner            = false,
    has_speedbrake            = true,    -- Mantido: O Shorts Tucano também utiliza o freio aéreo ventral

    nose_gear_pos             = { 2.976, -1.55, 0.0 },
    main_gear_pos             = { -0.122, -1.61, 1.816 },
    tand_gear_max             = 1,
    nose_gear_wheel_diameter  = 0.359,
    main_gear_wheel_diameter  = 0.579,

    wing_area                 = 19.4,    -- m2
    wing_span                 = 11.14,   -- m (Mantido para não quebrar a colisão do seu modelo 3D)
    wing_type                 = 0,
    height                    = 3.40,    -- m
    length                    = 9.86,    -- m

    wing_tip_pos              = { 0.038, -0.032, 5.393 },
    range                     = 1665,    -- km (Alcance ligeiramente reduzido devido ao maior consumo do motor)
    flaps_maneuver            = 0.5,

    RCS                       = 2.5,
    IR_emission_coeff         = 0.09,    -- Aumentado marginalmente (motor mais quente/potente)
    IR_emission_coeff_ab      = 0.0,

    brakeshute_name           = 0,
    is_tanker                 = false,
    air_refuel_receptacle_pos = { 0.0, 0.0, 0.0 },

	engines_count             = 1,
	engines_nozzles           =
	{
		[1] =
		{
			pos                 = { 1.262, -0.84, 0.331 }, -- nozzle coords
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
			pos                 = { 1.262, -0.84, -0.331 }, -- nozzle coords
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
            cx_brk     = 0.12,   -- Mantido a 0.12 para o freio aéreo (Speedbrake) ser efetivo

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
            Nmg                   = 90,
            MinRUD                = 0,
            MaxRUD                = 1,
            MaksRUD               = 1,
            ForsRUD               = 1,
            
            hMaxEng               = 10.3,  -- MODIFICADO: Teto do motor Garrett elevado para ~34.000 pés
            dcx_eng               = 0.015,
            cemax                 = 0.70,
            cefor                 = 0.70,
            dpdh_m                = 3800,
            dpdh_f                = 3800,

            D_prop                = 2.39,  -- MODIFICADO: Diâmetro ligeiramente maior da hélice do Shorts Tucano

            -- O Garrett TPE331 é de acoplamento direto (Direct Drive), o tempo de start difere ligeiramente do PT6, mas 32s é um bom valor simulado
            Startup_Ignition_Time = 24.0,
			Shutdown_Duration     = 8.0,
            prop_locations        = { { 3.131, -0.082, 0.0 }, },
            
            prop_blades_count     = 4,     -- MODIFICADO: O Shorts Tucano usa hélice de 4 pás
            
            prop_pitch_min        = 15.0,
            prop_pitch_max        = 87.0,
            prop_pitch_feather    = 87.0,
            Nominal_RPM           = 2000,  -- MODIFICADO: A RPM nominal da hélice no Garrett geralmente é fixada próxima a 2000 RPM em voo

            -- Curva de Empuxo (Thrust in Newtons) ajustada para o motor Garrett 1.100 SHP
            table_data =
            {
                -- [Index] = {Mach, Dry Thrust (N), Afterburner Thrust (N)}
                [1] =   {0.0,   22000.0,   22000.0}, -- Tração estática (aprox. p/ 1100 SHP)
                [2] =   {0.1,   20489.3,   20489.3},
                [3] =   {0.2,   10244.6,   10244.6},
                [4] =   {0.3,   6829.8,    6829.8},
                [5] =   {0.4,   5122.3,    5122.3},
                [6] =   {0.5,   4097.9,    4097.9},
                [7] =   {0.6,   3414.9,    3414.9},
                [8] =   {0.7,   2927.0,    2927.0},
                [9] =   {0.8,   2561.2,    2561.2},
            }, -- end of table_data
        },
    },
	sounderName               = "Aircraft/Planes/AT-27",
}
add_aircraft(SHORTSTFM)