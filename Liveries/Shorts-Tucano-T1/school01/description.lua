livery = {
	{ "AT27",         DIFFUSE,               "at-27_fuselage",           false },
	{ "AT27",         NORMAL_MAP,            "shorts_fuselage_nm",       true },
	{ "AT27",         ROUGHNESS_METALLIC,    "shorts_Fuselage_RoughMet", true },

	{ "AT27_GLASS",   DIFFUSE,               "shorts_glass",             true },
	{ "AT27_GLASS",   NORMAL_MAP,            "shorts_Glass_Nrm",         true },
	{ "AT27_GLASS",   ROUGHNESS_METALLIC,    "shorts_Glass_RoughMet",    true },

	{ "AT27_PILOT",   DIFFUSE,               "RAF_Pilot_AL",             true },

	{ "AT27PARTS",    DIFFUSE,               "a29b_parts",               true },
	{ "AT27PARTS",    NORMAL_MAP,            "a29b_parts_b",             true },
	{ "AT27PARTS",    ROUGHNESS_METALLIC,    "a29b_parts_RoughMet",      true },

	{ "AT27BANO2",    DIFFUSE,               "bano_lights",              true },
	{ "AT27BANO2",    ROUGHNESS_METALLIC,    "BANO_LIGHTS_RoughMet",     true },

	{ "AT27BANO",     DIFFUSE,               "at-27_bano",               true },
	{ "AT27BANO",     ROUGHNESS_METALLIC,    "AT-27_BANO_RoughMet",      true },

	{ "MascM",        DIFFUSE,               "capmasks",                 true },
	{ "MascM",        NORMAL_MAP,            "capmasks_nm",              true },
	{ "MascM",        ROUGHNESS_METALLIC,    "capmasks_RoughMet",        true },


	{ "Helmet_glass", DIFFUSE,               "cap_viseira",              true },
	{ "Helmet_glass", ROUGHNESS_METALLIC,    "cap_Viseira_RoughMet",     true },

	{ "CAP01",        DIFFUSE,               "cappilot01",               false },
	{ "CAP01",        NORMAL_MAP,            "cappilot01_nm",            true },

	{ "GALLET",       DIFFUSE,               "gallet",                   true },
	{ "GALLET",       NORMAL_MAP,            "gallet_nm",                true },
	{ "GALLET",       ROUGHNESS_METALLIC,    "gallet_RoughMet",          true },

	{ "CAP02",        DIFFUSE,               "cappilot02",               true },
	{ "CAP02",        NORMAL_MAP,            "cappilot02_nm",            true },
	{ "CAP02",        ROUGHNESS_METALLIC,    "cappilot02_RoughMet",      true },

	{ "AT27SEAT",     DIFFUSE,               "at-27_seat",               true },
	{ "AT27SEAT",     NORMAL_MAP,            "at-27_seat_nm",            true },
	{ "AT27SEAT",     ROUGHNESS_METALLIC,    "at-27_seat_RoughMet",      true },

	{ "GUENAU",       DIFFUSE,               "gue_map",                  true },
	{ "GUENAU",       NORMAL_MAP,            "gue_map_nm",               true },
	{ "GUENAU",       ROUGHNESS_METALLIC,    "gue_map_RoughMet",         true },

	{ "AT27_PILOT",   NORMAL_MAP,            "pilot_al_nm",              true },
	{ "AT27_PILOT",   ROUGHNESS_METALLIC,    "pilot_al_RoughMet",        true },

	{ "AT27_PARTS",   DIFFUSE,               "at-27_parts",              true },
	{ "AT27_PARTS",   NORMAL_MAP,            "at-27_parts_nm",           true },
	{ "AT27_PARTS",   ROUGHNESS_METALLIC,    "at-27_parts_RoughMet",     true },

	{ "RAF_MK",       DIFFUSE,               "raf_helmet",               true },
	{ "RAF_MK",       NORMAL_MAP,            "raf_helmet_nm",            true },
}

name = "Shorts Tucano RAF"
countries = {}
custom_args =
{
	-- Front pilot
	[810] = 1, -- Pilot helmet
	[811] = 0, -- Helmet visor 0-close, 1-open
	[812] = 0, -- Front helmet visor 0-close, 1-open
	[813] = 0, -- G-suit
	-- Rear Pilot
	[814] = 1, -- Pilot helmet
	[815] = 0, -- Helmet visor 0-close, 1-open
	[816] = 0, -- Front helmet visor 0-close, 1-open
	[817] = 0, -- G-suit

	[1000] = 0, -- Hud: 1, Base HUD: 0.5, No Hud: 0

	[820] = 0, -- Antennas
	[821] = 0, -- Down antenna
	[822] = 0, -- Down antenna
	[823] = 0, -- Top canopy antenna
	[824] = 0, -- Small antenna
	[825] = 0, -- Internal canopy support
	[826] = 1, -- 0: Tucano, 1: Tucano shorts
	[827] = 1, -- Air brake
}
