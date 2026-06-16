local self_ID  = "Embraer EMB312_AT-27"

declare_plugin(self_ID,
{
installed 	 		= true,
dirName	  	 		= current_mod_path,
displayName  		= _("EMB312_AT-27"),
shortName	 		= "EMB312_AT-27",
state		 		= "installed",
version 	 		= "0.1.0",
developerName		= _("BR"),
info		 		= _("The Embraer EMB-312 Tucano is a turboprop basic and advanced training aircraft. It is used primarily for military pilot training, including basic flight instruction, aerobatics, navigation, and weapons training. The EMB-312 is known for its good maneuverability, low operating cost, reliability, and simple maintenance, making it ideal for large-scale pilot training programs. It can operate from relatively short and semi-prepared runways and has been adopted by several air forces around the world. Unlike the A-29 Super Tucano, the EMB-312 is not a dedicated combat aircraft, but some versions can carry light weapons for training or secondary roles."),
encyclopedia_path = current_mod_path..'/Encyclopedia',



Skins = 
	{
		{
			name	= "EMB312_AT-27",
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name	= _("EMB312_AT-27"),
			dir		= "Missions",
			CLSID	= "{AT27 missions}",
		},
	},	
Options =
    {
        {
            name		= _("EMB312_AT-27"),
			nameId		= "EMB312_AT-27",
			dir			= "Options",
			CLSID		= "{EMB312_AT-27 options}"
        },
    },		

	InputProfiles =
	{
		["EMB312_AT-27"]		= current_mod_path..'/Input/EMB312_AT-27',
		["EMB312_Shorts-Tucano-T1"]		= current_mod_path..'/Input/EMB312_Shorts-Tucano-T1',
		["EMB312_T-27"]		= current_mod_path..'/Input/EMB312_T-27',
		["EMB312_F"]		= current_mod_path..'/Input/EMB312_F',
 	},

	LogBook =
	{
		{
			name	= _("EMB312_AT-27"),
			type	= "EMB312_AT-27",
		},
		{
			name	= _("EMB312_Shorts-Tucano-T1"),
			type	= "EMB312_Shorts-Tucano-T1",
		},
		{
			name	= _("EMB312_T-27"),
			type	= "EMB312_T-27",
		},
		{
			name	= _("EMB312_F"),
			type	= "EMB312_F",
		},
	},

})

mount_vfs_texture_path  (current_mod_path ..  "/Textures/AT-27")
mount_vfs_texture_path  (current_mod_path ..  "/Cockpit/Texture")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_model_path    (current_mod_path ..  "/Cockpit/Shapes")
mount_vfs_liveries_path(current_mod_path .. "/Liveries")
mount_vfs_texture_path	(current_mod_path ..  "/Theme")
mount_vfs_sound_path (current_mod_path.."/Sounds/")

dofile(current_mod_path.."/Entry/Views.lua")
dofile(current_mod_path.."/Entry/loadout.lua")
dofile(current_mod_path.."/weapons/weapons.lua")
dofile(current_mod_path.."/Entry/EMB312_AT-27.lua")
dofile(current_mod_path.."/Entry/EMB312_Shorts-Tucano-T1.lua")
dofile(current_mod_path.."/Entry/EMB312_F.lua")
dofile(current_mod_path.."/Entry/EMB312_T-27.lua")

make_view_settings('EMB312_AT-27', ViewSettings, SnapViews)
make_view_settings('EMB312_T-27', ViewSettings, SnapViews)
make_view_settings('EMB312_F', ViewSettings, SnapViews)
make_view_settings('EMB312_Shorts-Tucano-T1', ViewSettings, SnapViews)

make_flyable('EMB312_AT-27', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")
make_flyable('EMB312_T-27', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")
make_flyable('EMB312_F', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")
make_flyable('EMB312_Shorts-Tucano-T1', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")

plugin_done()