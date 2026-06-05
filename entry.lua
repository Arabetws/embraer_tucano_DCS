local self_ID  = "Embraer AT-27"

declare_plugin(self_ID,
{
installed 	 		= true,
dirName	  	 		= current_mod_path,
displayName  		= _("AT-27"),
shortName	 		= "AT-27",
state		 		= "installed",
version 	 		= "0.1.0",
developerName		= _("BR"),
info		 		= _("The Embraer EMB-312 Tucano is a turboprop basic and advanced training aircraft. It is used primarily for military pilot training, including basic flight instruction, aerobatics, navigation, and weapons training. The EMB-312 is known for its good maneuverability, low operating cost, reliability, and simple maintenance, making it ideal for large-scale pilot training programs. It can operate from relatively short and semi-prepared runways and has been adopted by several air forces around the world. Unlike the A-29 Super Tucano, the EMB-312 is not a dedicated combat aircraft, but some versions can carry light weapons for training or secondary roles."),
encyclopedia_path = current_mod_path..'/Encyclopedia',



Skins = 
	{
		{
			name	= "AT-27",
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name	= _("AT-27"),
			dir		= "Missions",
			CLSID	= "{AT27 missions}",
		},
	},	
Options =
    {
        {
            name		= _("AT-27"),
			nameId		= "AT-27",
			dir			= "Options",
			CLSID		= "{AT-27 options}"
        },
    },		

	InputProfiles =
	{
		["AT-27"]		= current_mod_path..'/Input/AT-27',
		["MK1"]		= current_mod_path..'/Input/MK1',
		["T-27"]		= current_mod_path..'/Input/T-27',
		["EMB-312F"]		= current_mod_path..'/Input/EMB-312F',
 	},

	LogBook =
	{
		{
			name	= _("AT-27"),
			type	= "AT-27",
		},
		{
			name	= _("MK1"),
			type	= "MK1",
		},
		{
			name	= _("T-27"),
			type	= "T-27",
		},
		{
			name	= _("EMB-312F"),
			type	= "EMB-312F",
		},
	},

})

mount_vfs_model_path    (current_mod_path.."/Cockpit/Shapes")
mount_vfs_texture_path  (current_mod_path ..  "/Textures/AT-27")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_liveries_path(current_mod_path .. "/Liveries")
mount_vfs_texture_path	(current_mod_path ..  "/Theme")
mount_vfs_sound_path (current_mod_path.."/Sounds/")

dofile(current_mod_path.."/Entry/Views.lua")
dofile(current_mod_path.."/Entry/loadout.lua")
dofile(current_mod_path.."/weapons/weapons.lua")
dofile(current_mod_path.."/Entry/AT-27.lua")
dofile(current_mod_path.."/Entry/MK1.lua")
dofile(current_mod_path.."/Entry/EMB312F.lua")
dofile(current_mod_path.."/Entry/T-27.lua")

make_view_settings('AT-27', ViewSettings, SnapViews)
make_view_settings('T-27', ViewSettings, SnapViews)
make_view_settings('EMB-312F', ViewSettings, SnapViews)
make_view_settings('MK1', ViewSettings, SnapViews)

make_flyable('AT-27', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")
make_flyable('T-27', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")
make_flyable('EMB-312F', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")
make_flyable('MK1', current_mod_path.."/Cockpit/Scripts/", nil , current_mod_path.."/Entry/comm.lua")

plugin_done()