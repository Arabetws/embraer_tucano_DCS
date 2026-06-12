livery = {
	{ "AT27",         DIFFUSE,               "at-27_fuselage",              false },
	{ "AT27",         NORMAL_MAP,            "at-27_fuselage_nm",           true },
	{ "AT27",         ROUGHNESS_METALLIC,    "EDA_AT-27_Fuselage_RoughMet", true },

	{ "AT27PARTS",    DIFFUSE,               "EDA_A_a29b_parts",            true },
	{ "AT27PARTS",    NORMAL_MAP,            "a29b_parts_b",                true },
	{ "AT27PARTS",    ROUGHNESS_METALLIC,    "a29b_parts_RoughMet",         true },

	{ "AT27BANO2",    DIFFUSE,               "bano_lights",                 true },
	{ "AT27BANO2",    ROUGHNESS_METALLIC,    "BANO_LIGHTS_RoughMet",        true },

	{ "AT27BANO",     DIFFUSE,               "at-27_bano",                  true },
	{ "AT27BANO",     ROUGHNESS_METALLIC,    "AT-27_BANO_RoughMet",         true },

	{ "MascM",        DIFFUSE,               "capmasks",                    true },
	{ "MascM",        NORMAL_MAP,            "capmasks_nm",                 true },
	{ "MascM",        ROUGHNESS_METALLIC,    "capmasks_RoughMet",           true },


	{ "Helmet_glass", DIFFUSE,               "EDA_N_cap_Viseira",           true },
	{ "Helmet_glass", ROUGHNESS_METALLIC,    "cap_Viseira_RoughMet",        true },

	{ "CAP01",        DIFFUSE,               "EDA_N_capPilot01",            true },
	{ "CAP01",        NORMAL_MAP,            "cappilot01_nm",               true },

	{ "AT27_GLASS",   DIFFUSE,               "at-27_glass",                 true },
	{ "AT27_GLASS",   NORMAL_MAP,            "AT-27_Glass_Nrm",             true },
	{ "AT27_GLASS",   ROUGHNESS_METALLIC,    "AT-27_Glass_RoughMet",        true },

	{ "GALLET",       DIFFUSE,               "gallet",                      true },
	{ "GALLET",       NORMAL_MAP,            "gallet_nm",                   true },
	{ "GALLET",       ROUGHNESS_METALLIC,    "gallet_RoughMet",             true },

	{ "CAP02",        DIFFUSE,               "EDA_N_capPilot02",            true },
	{ "CAP02",        NORMAL_MAP,            "cappilot02_nm",               true },
	{ "CAP02",        ROUGHNESS_METALLIC,    "cappilot02_RoughMet",         true },

	{ "AT27SEAT",     DIFFUSE,               "at-27_seat",                  true },
	{ "AT27SEAT",     NORMAL_MAP,            "at-27_seat_nm",               true },
	{ "AT27SEAT",     ROUGHNESS_METALLIC,    "at-27_seat_RoughMet",         true },

	{ "GUENAU",       DIFFUSE,               "gue_map",                     true },
	{ "GUENAU",       NORMAL_MAP,            "gue_map_nm",                  true },
	{ "GUENAU",       ROUGHNESS_METALLIC,    "gue_map_RoughMet",            true },

	{ "AT27_PILOT",   DIFFUSE,               "EDA_V_Pilot_AL",              true },
	{ "AT27_PILOT",   NORMAL_MAP,            "pilot_al_nm",                 true },
	{ "AT27_PILOT",   ROUGHNESS_METALLIC,    "pilot_al_RoughMet",           true },

	{ "AT27_PARTS",   DIFFUSE,               "at-27_parts",                 true },
	{ "AT27_PARTS",   NORMAL_MAP,            "at-27_parts_nm",              true },
	{ "AT27_PARTS",   ROUGHNESS_METALLIC,    "at-27_parts_RoughMet",        true },
}

name = "T-27 04 Air Demonstration Squadron (EDA) 2001-2012"
countries = {}
custom_args =
{
	-- Front pilot
	[810] = 0.4, -- Pilot helmet
	[811] = 0, -- Helmet visor 0-close, 1-open
	[812] = 0, -- Front helmet visor 0-close, 1-open
	[813] = 1, -- 0: colete, 1: no colete
	-- Rear Pilot
	[814] = 0.4, -- Pilot helmet
	[815] = 0, -- Helmet visor 0-close, 1-open
	[816] = 0, -- Front helmet visor 0-close, 1-open
	[817] = 1, -- 0: colete, 1: no colete

	[1000] = 0, -- Hud: 1, Base HUD: 0.5, No Hud: 0

	[820] = 0, -- Antennas
	[821] = 1, -- Down antenna
	[822] = 1, -- Down antenna
	[823] = 1, -- Top canopy antenna
	[824] = 0, -- Small antenna
	[825] = 0, -- Internal canopy support
	[826] = 0, -- 0: Tucano, 1: Tucano shorts
	[827] = 0, -- Air brake
}
