dofile(LockOn_Options.script_path.."dump.lua")
--package.cpath 			= package.cpath..";".. LockOn_Options.script_path.. "..\\..\\bin\\?.dll"
--local avwr = require('avSimplestRadio')   -- loads the DLL



dofile(LockOn_Options.script_path.."dump.lua")
dump("_G",_G)
dump("_G",getmetatable(_G))


dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")


render_target		 = 0 -- mfd0  
used_render_mask	 = LockOn_Options.script_path.."../IndicationTextures/gunCameraNoise.bmp"
indicator_type       = indicator_types.COMMON
page_subsets    	 = {LockOn_Options.script_path.."Camera/page.lua"}
pages 				 = {{1}}
init_pageID     	 = 1


camera = 
{
	pos		  = {4.0,0.45,0},
	elevation = math.rad(-0.4),
	fov 	  = 2 * math.atan(0.5 * 36/100)--FED-100 100 mm , film 35mm 24x36
}

update_screenspace_diplacement(36/24,false,0)
options_source 			  = "MiG-15bis"
dedicated_viewport_arcade = dedicated_viewport
options={
	plugins = {
		gunCamera = 2,
	}
}

-- dofile(LockOn_Options.script_path.."devices.lua")
-- dofile(LockOn_Options.script_path.."command_defs.lua")

-- print_message_to_user("avADI")

-- deviationBars = 5
-- attWarnFlag = false
-- T_Pitch = 10
-- T_Bank = 10

-- function update()
--     print_message_to_user("avADI")
-- end


-- -- avADI
-- pitch = {
--     valmin = math.rad(0),
--     valmax = math.rad(360), 
-- }

-- pitch = {
--     isLagElement = false, 
--     T1 = 0.3, 
--     T2 = 0.0, 
--     wmax = 0.0,
--     momentCoeff = 0.0,
--     bias = {
--         {
--             valmin = math.rad(0),
--             valmax = math.rad(360), 
--             bias = math.rad(1)
--         }
--     },
--     angles = {
--         {
--             val = 0.0,
--             angle = 0.0,
--         }
--     }
-- }


-- need_to_be_closed = false

