--------------------------------------------------------------------------
---------------------- CAMERA SETUP --------------------------------------
--------------------------------------------------------------------------
--camera = battle:camera() -- global
camera:disable_functionality("CAMERA_ALL_FUNCTIONS")

-- Start of game position
POS_Intro_Camera_01 = battle_vector:new()
POS_Intro_Camera_01_Targ = battle_vector:new()
POS_Intro_Camera_01:set(282.3, 19.6, 144.3)
POS_Intro_Camera_01_Targ:set(422, 2.9, 483.8)
POS_Intro_Camera_02 = battle_vector:new()
POS_Intro_Camera_02_Targ = battle_vector:new()
POS_Intro_Camera_02:set(351.2, 15.5, 290.6)
POS_Intro_Camera_02_Targ:set(401.4, 0.7, 654.3)
---------------------------------------------------------------------------------------------------------------------
--CAM 1 - START LOOKING AT SUN, PAN TO VISTA
POS_1a = battle_vector:new()
POS_1a:set(202.5, 52.1, 439.3)
POS_1a_Targ = battle_vector:new()
POS_1a_Targ:set(172.2, 320.1, 688.9)

POS_1b = battle_vector:new()
POS_1b:set(194.7, 32.8, 424.9)
POS_1b_Targ = battle_vector:new()
POS_1b_Targ:set(56.9, 16.1, 765.2)
---------------------------------------------------------------------------------------------------------------------
--CAM 2 - FLOAT THROUGH TREES, PULL FOCUS TO CASTLE
POS_2a = battle_vector:new()
POS_2a:set(203.4, 32.9, 398.1)
POS_2a_Targ = battle_vector:new()
POS_2a_Targ:set(472.7, 61.6, 646.6)

POS_2b = battle_vector:new()
POS_2b:set(210.9, 32.9, 405.0)
POS_2b_Targ = battle_vector:new()
POS_2b_Targ:set(480.2, 61.6, 653.5)
-------------------------------------------------
--CAM 3 - PAN BACK TO BOATS
POS_3a = battle_vector:new()
POS_3a:set(124.4, 10.6, 172.1)
POS_3a_Targ = battle_vector:new()
POS_3a_Targ:set(337.3, 45.0, 469.7)

POS_3b = battle_vector:new()
POS_3b:set(111.3, 14.9, 147.5)
POS_3b_Targ = battle_vector:new()
POS_3b_Targ:set(453.2, -14.4, 279.2)
-------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------------
--	Fly Over


camera:fade(true, 0)
camera:change_height_range(0.5, 100) --MAKE SURE THIS IS SET BACK TO NORMAL AT THE END OF THE CUTSCENE

Cutscene_Intro = cutscene:new(bm, 
                        friendly_controller_men, 
                        function() StartGame() end, 
                        30000, 
                        "Cutscene_Intro", 
                        true, 
                        false,
                        POS_Intro_Camera_01,
                        POS_Intro_Camera_01_Targ,
						true,
						function() Skip_Cutscene() end
                  );
          
Cutscene_Intro:set_debug(true)
--Cutscene_Intro:set_hide_debug_ui(true)

--------------------------------------------------------------------------------------------------------------------------------
--	Intro Cutscene & General's Speech
--------------------------------------------------------------------------------------------------------------------------------
--	Fly Over

Cutscene_Intro:action(function() battle:enable_cinematic_ui(true, false) end, 0)
--Start Params
--Cutscene_Intro:action(function() camera:change_depth_of_field(0, 8, 3, 1) end, 0) --Set DOF

--------------------------------------------------------------------------------------------------------------------------------
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 1000, 800, 2) end, 0) --Set DOF
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 0)  --Fade in 

Cutscene_Intro:action(function() camera:move_to(POS_1a_Targ, POS_1a, 0, true, 20) end, 0) --Move to camera + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(10, 20, 40, 1) end, 1000) --Animate DOF
Cutscene_Intro:action(function() camera:move_to(POS_1b_Targ, POS_1b, 13, false, 30) end, 0) --Move to camera + FOV

Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 11500)  --Fade out 
--------------------------------------------------------------------------------------------------------------------------------
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 20, 40, 1) end, 12000) --Animate DOF
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 12000)  --Fade in

Cutscene_Intro:action(function() camera:move_to(POS_2a_Targ, POS_2a, 0, true, 20) end, 12000) --Move to camera + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(5, 1000, 500, 1) end, 13000) --Animate DOF
Cutscene_Intro:action(function() camera:move_to(POS_2b_Targ, POS_2b, 8, true, 25) end, 12000) --Move to camera + FOV

Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 19500)  --Fade out 
--------------------------------------------------------------------------------------------------------------------------------
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 1000, 500, 1) end, 20000) --Set DOF
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 20000)  --Fade in


Cutscene_Intro:action(function() camera:move_to(POS_3a_Targ, POS_3a, 0, true, 15) end, 20000) --Move to camera + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(8, 80, 120, 0.6) end, 21000) --Animate DOF
Cutscene_Intro:action(function() camera:move_to(POS_3b_Targ, POS_3b, 10, false, 30) end, 20000) --Move to camera + FOV

Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 29500)  --Fade out
Cutscene_Intro:action(function() camera:change_height_range(-1.0, -1.0) end, 29500)  --Fade out


--------------------------------------------------------------------------------------------------------------------------------


Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_01_Targ, POS_Intro_Camera_01, 0, false, 0) end, 30000) --Go back to start pos + FOV
Cutscene_Intro:action(function() battle:enable_cinematic_ui(false, true) end, 29500)
Cutscene_Intro:action(function() camera:enable_functionality("CAMERA_ALL_FUNCTIONS") end, 29500)
Cutscene_Intro:action(function() camera:change_depth_of_field(0) end, 20000) --Reset DOF



function Skip_Cutscene()
	camera:change_height_range(-1.0, -1.0)
	battle:enable_cinematic_ui(false, true)
	camera:enable_functionality("CAMERA_ALL_FUNCTIONS")
	camera:change_depth_of_field(0)
end

-------------------------------------------------------------------------------------------