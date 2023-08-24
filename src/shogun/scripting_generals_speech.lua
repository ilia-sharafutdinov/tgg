--------------------------------------------------------------------------
---------------------- CAMERA SETUP --------------------------------------
--------------------------------------------------------------------------
camera = battle:camera() -- global
camera:disable_functionality("CAMERA_ALL_FUNCTIONS")

weather_interface = battle:weather() 
weather_interface:enable_random_lightning(false) 

subtitles_Japanese = battle:subtitles()

subtitles_Japanese:clear()
subtitles_Japanese:push_back_subtitle_entry(0, 6700, "Warriors of the Chosokabe! We face a fierce enemy so I will have no glory-hunting today! Do not waste time collecting heads from your foes.")
subtitles_Japanese:push_back_subtitle_entry(8300, 17100, "When the time comes, be resolute. Cut your way into the enemy ranks, then strike all around! Do not consider their numbers. They do not matter.")
subtitles_Japanese:push_back_subtitle_entry(18200, 27900, "Here armour will not always save you. Do not trust in armour. On this battlefield, moving quickly and engaging the enemy closely are more important.")
subtitles_Japanese:push_back_subtitle_entry(29000, 35800, "And at the last, do not huddle together for supposed safety! That is not the act of a warrior, only a coward. And I do not lead cowards!")
subtitles_Japanese:push_back_subtitle_entry(37300, 42300, "May our glory live for a thousand years! At them!")

function End_The_Subtitles()
	subtitles_Japanese:end_subtitles()
end

function Show_Subtitles()
	subtitles_Japanese:set_alignment("bottom_centre")
	subtitles_Japanese:begin("bottom_centre")
end

SFX_Gen_Speech_Japanese = battle_sound_effect:new()
SFX_Gen_Speech_Japanese:load("placeholder/Tim_E3_Placeholder_stw2_japanese.mp3")

POSITION_SFX = battle_vector:new()
POSITION_SFX:set(52.6, 33.5, -59.8)

function Play_Sound()
	SFX_Gen_Speech_Japanese:play3D(POSITION_SFX)
end

------------------------------------------------------------------------------------------------------------------------------

SFX_Cheering = battle_sound_effect:new()
SFX_Cheering:load("placeholder/STW2_HYB_HUMAN_Samurai_Cheer_01_v1.00_MXD.wav")

SFX_Cheering2 = battle_sound_effect:new()
SFX_Cheering2:load("placeholder/STW2_HYB_HUMAN_Samurai_Cheer_02_v1.00_MXD.wav")

SFX_Cheering3 = battle_sound_effect:new()
SFX_Cheering3:load("placeholder/STW2_HYB_HUMAN_Samurai_Cheer_03_v1.00_MXD.wav")


POS_SFX_Cheering = battle_vector:new()
POS_SFX_Cheering:set(96.9, 26.8, 150.1)

function Play_Cheering_Sound()
	SFX_Cheering:play3D(POS_SFX_Cheering)
end

function Play_Cheering_Sound2()
	SFX_Cheering2:play3D(POS_SFX_Cheering)
end

function Play_Cheering_Sound3()
	SFX_Cheering3:play3D(POS_SFX_Cheering)
end

-------------------------------------------------------------------------------------------------------------------------------
-- Lightning Vectors
POS_Lightning_RFlank_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_RFlank_Strike:set(2000, 1500, -800) --\/\/\/\/\/\/\/\Lightning
POS_Lightning_LFlank_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_LFlank_Strike:set(-2000, 1500, -800) --\/\/\/\/\/\/\/\Lightning
POS_Lightning_Rear_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_Rear_Strike:set(0, 1200, -3400) --\/\/\/\/\/\/\/\Lightning
POS_Lightning_Castle_Sheet = battle_vector:new() --^^^^^^^^^^^^^^^Sheet
POS_Lightning_Castle_Sheet:set(1800, -200, 1600) --^^^^^^^^^^^^^^^Sheet


-------------------------------------------------------------------------------------------------------------------------------
-- Start of game position
POS_Intro_Camera_01 = battle_vector:new()
POS_Intro_Camera_01_Targ = battle_vector:new()

POS_Intro_Camera_01:set(32.7, 85.3, -23.3)
POS_Intro_Camera_01_Targ:set(102.0, 48.6, 52.7)
-------------------------------------------------------------------------------------------------------------------------------
--	Fly Over

--Close up on men marching 
POS_Intro_Camera_00a = battle_vector:new()
POS_Intro_Camera_00a:set(152.1, 22.5, 188.2)
POS_Intro_Camera_00a_Targ = battle_vector:new()
POS_Intro_Camera_00a_Targ:set(142.1, 22.8, 62.8)


POS_Intro_Camera_00b = battle_vector:new()
POS_Intro_Camera_00b:set(152.1, 22.5, 188.2)
POS_Intro_Camera_00b_Targ = battle_vector:new()
POS_Intro_Camera_00b_Targ:set(182.3, 21.8, 64.9)
-------------------------------------------------------
--Pan from men marching to castle 


POS_Intro_Camera_01a = battle_vector:new()
POS_Intro_Camera_01a:set(157.8, 22.9, 178.9)
POS_Intro_Camera_01a_Targ = battle_vector:new()
POS_Intro_Camera_01a_Targ:set(259.1, 11.9, 217.7)

POS_Intro_Camera_01b = battle_vector:new()
POS_Intro_Camera_01b:set(157.8, 23.0, 178.9)
POS_Intro_Camera_01b_Targ = battle_vector:new()
POS_Intro_Camera_01b_Targ:set(229.8, 30.7, 260.5)
-------------------------------------------------------
--Close-up on castle 
POS_Intro_Camera_02a = battle_vector:new()
POS_Intro_Camera_02a:set(777.9, 39.9, 533.3)
POS_Intro_Camera_02a_Targ = battle_vector:new()
POS_Intro_Camera_02a_Targ:set(725.1, 51.9, 594.6)

POS_Intro_Camera_02b = battle_vector:new()
POS_Intro_Camera_02b:set(777.9, 39.9, 533.3)
POS_Intro_Camera_02b_Targ = battle_vector:new()
POS_Intro_Camera_02b_Targ:set(732.3, 56.3, 599.2)

POS_Lightning_01_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_01_Strike:set(-2000, 1500, 3400) --\/\/\/\/\/\/\/\Lightning

POS_Lightning_02_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_02_Strike:set(-1600, 1200, 3400) --\/\/\/\/\/\/\/\Lightning

-------------------------------------------------------
--At tower, pull focus from tower to Takeda army
POS_Intro_Camera_03a = battle_vector:new()
POS_Intro_Camera_03a:set(654.1, 118.9, 823.2)
POS_Intro_Camera_03a_Targ = battle_vector:new()
POS_Intro_Camera_03a_Targ:set(610.9, 101.9, 755.8)

POS_Intro_Camera_03b = battle_vector:new()
POS_Intro_Camera_03b:set(652.0, 124.8, 824.4)
POS_Intro_Camera_03b_Targ = battle_vector:new()
POS_Intro_Camera_03b_Targ:set(608.8, 107.8, 757.0)
-------------------------------------------------------
--At army, pan from castle to Takeda army 
POS_Intro_Camera_04a = battle_vector:new()
POS_Intro_Camera_04a:set(330.0, 15.9, 361.1)
POS_Intro_Camera_04a_Targ = battle_vector:new()
POS_Intro_Camera_04a_Targ:set(406.9, 33.6, 459.2)

POS_Intro_Camera_04b = battle_vector:new()
POS_Intro_Camera_04b:set(330.0, 14.7, 361.1)
POS_Intro_Camera_04b_Targ = battle_vector:new()
POS_Intro_Camera_04b_Targ:set(412.1, 14.0, 456.5)
-------------------------------------------------------
--Long shot of castle to Chosokabe army, general runs to the head of the army 
POS_Intro_Camera_05a = battle_vector:new()
POS_Intro_Camera_05a:set(82.1, 33.8, 35.8)
POS_Intro_Camera_05a_Targ = battle_vector:new()
POS_Intro_Camera_05a_Targ:set(129.7, 36.3, 102.3)

POS_Intro_Camera_05b = battle_vector:new()
POS_Intro_Camera_05b:set(82.1, 34.8, 35.8)
POS_Intro_Camera_05b_Targ = battle_vector:new()
POS_Intro_Camera_05b_Targ:set(132.1, 36.1, 100.6)

POS_Lightning_03_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_03_Strike:set(2000, 1000, 3400) --\/\/\/\/\/\/\/\Lightning

-------------------------------------------------------------------------------------------------------------------------------
--	General's Speech
--General closeup 1
POS_Gen_01a = battle_vector:new()
POS_Gen_01a:set(120.2, 24.1, 169.5)
POS_Gen_01a_Targ = battle_vector:new()
POS_Gen_01a_Targ:set(201.5, 31.3, 242.2)

POS_Gen_01b = battle_vector:new()
POS_Gen_01b:set(120.3, 24.1, 169.4)
POS_Gen_01b_Targ = battle_vector:new()
POS_Gen_01b_Targ:set(197.6, 31.3, 246.3)

POS_Lightning_Gen_Sheet = battle_vector:new() --^^^^^^^^^^^^^^^Sheet
POS_Lightning_Gen_Sheet:set(2000, -200, 1600) --^^^^^^^^^^^^^^^Sheet
-------------------------------------------------------------------------------------------------------------------------------
--Pan up from General, view troops
POS_Gen_02a = battle_vector:new()
POS_Gen_02a:set(117.4, 26.7, 180.5)
POS_Gen_02a_Targ = battle_vector:new()
POS_Gen_02a_Targ:set(166.7, 13.1, 115.1)

POS_Gen_02b = battle_vector:new()
POS_Gen_02b:set(117.4, 28.2, 180.5)
POS_Gen_02b_Targ = battle_vector:new()
POS_Gen_02b_Targ:set(123.1, 12.5, 99.1)

POS_Lightning_04_Strike = battle_vector:new() --\/\/\/\/\/\/\/\Lightning
POS_Lightning_04_Strike:set(2000, 1200, -800) --\/\/\/\/\/\/\/\Lightning
 
-------------------------------------------------------------------------------------------------------------------------------
--General closeup 2, rear panning behind him

POS_Gen_03a = battle_vector:new()
POS_Gen_03a:set(120.9, 23.8, 175.9)
POS_Gen_03a_Targ = battle_vector:new()
POS_Gen_03a_Targ:set(122.4, 37.3, 67.5)

POS_Gen_03b = battle_vector:new()
POS_Gen_03b:set(121.1, 23.8, 175.9)
POS_Gen_03b_Targ = battle_vector:new()
POS_Gen_03b_Targ:set(116.3, 37.3, 67.6)
-------------------------------------------------------------------------------------------------------------------------------
--Troops closeup 2, panning in front of them
POS_Gen_04a = battle_vector:new()
POS_Gen_04a:set(258.1, 22.8, 117.1)
POS_Gen_04a_Targ = battle_vector:new()
POS_Gen_04a_Targ:set(281.8, 15.0, 37.9)

POS_Gen_04b = battle_vector:new()
POS_Gen_04b:set(255.8, 22.8, 117.9)
POS_Gen_04b_Targ = battle_vector:new()
POS_Gen_04b_Targ:set(279.5, 15.0, 38.7)

POS_Lightning_Cav_Sheet = battle_vector:new() --^^^^^^^^^^^^^^^Sheet
POS_Lightning_Cav_Sheet:set(2000, -200, 0) --^^^^^^^^^^^^^^^Sheet
-------------------------------------------------------------------------------------------------------------------------------
--General closeup 3, rotate round front
POS_Gen_05a = battle_vector:new()
POS_Gen_05a:set(125.1, 29.3, 116.9)
POS_Gen_05a_Targ = battle_vector:new()
POS_Gen_05a_Targ:set(132.2, 29.3, 8.1)

POS_Gen_05b = battle_vector:new()
POS_Gen_05b:set(123.8, 29.3, 117.8)
POS_Gen_05b_Targ = battle_vector:new()
POS_Gen_05b_Targ:set(131.0, 29.3, 9.0)
-------------------------------------------------------------------------------------------------------------------------------
--Troops closeup 3, pan along behind them and cheer
POS_Gen_06a = battle_vector:new()
POS_Gen_06a:set(96.8, 28.0, 140.2)
POS_Gen_06a_Targ = battle_vector:new()
POS_Gen_06a_Targ:set(155.9, 16.4, 197.4)

POS_Gen_06b = battle_vector:new()
POS_Gen_06b:set(99.0, 28.1, 139.4)
POS_Gen_06b_Targ = battle_vector:new()
POS_Gen_06b_Targ:set(156.1, 13.9, 198.2)

-------------------------------------------------------------------------------------------------------------------------------

--===========================================

camera:fade(true, 0)
camera:change_height_range(0.5, 100) --MAKE SURE THIS IS SET BACK TO NORMAL AT THE END OF THE CUTSCENE

Cutscene_Intro = cutscene:new(bm, 
                        controller_chosokabe, 
--                      function() Cutscene_Restart() end, 
                        function() StartGame() end, 
                        86000, 
                        "Cutscene_Intro", 
                        true, 
                        false,
                        POS_Intro_Camera_01,
                        POS_Intro_Camera_01_Targ,
						true,
						function() Skip_Cutscene() end
                  );
          
Cutscene_Intro:set_debug(true)
Cutscene_Intro:set_hide_debug_ui(true)

--------------------------------------------------------------------------------------------------------------------------------
--	Intro Cutscene & General's Speech
--------------------------------------------------------------------------------------------------------------------------------
--	Fly Over


Cutscene_Intro:action(function() battle:enable_cinematic_ui(true, false) end, 0)


--Close up on men marching - 8 Seconds
--Start Params
Cutscene_Intro:action(function() Move_Samurai() end, 0) --Set the samurai at the front walking
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 5, 3, 1) end, 0) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_00a_Targ, POS_Intro_Camera_00a, 0, true, 10) end, 0) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 2) end, 0)  --Fade in 
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 3000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 3500) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_00b_Targ, POS_Intro_Camera_00b, 8, true, 10) end, 0) --Animate camera position + FOV
Cutscene_Intro:action(function() camera:fade(true, 1) end, 7000) --Fade out

--Pan from men marching to castle - 10 Seconds
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 20, 30, 1) end, 8000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_01a_Targ, POS_Intro_Camera_01a, 0, true, 15) end, 8000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 1) end, 8000) --Fade in 
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_01b_Targ, POS_Intro_Camera_01b, 10, false, 12) end, 8000) --Animate camera position + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(1, 800, 300, 1) end, 11500) --Animate DOF

Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 14500) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 15000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_sheet(POS_Lightning_Castle_Sheet) end, 15500) --Sheet ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Cutscene_Intro:action(function() camera:fade(true, 1) end, 17000) --Fade out

--Close-up on castle - 6 Seconds
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 100, 50, 1) end, 18000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_02a_Targ, POS_Intro_Camera_02a, 0, true, 13) end, 18000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 1) end, 18000) --Fade in 
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_02b_Targ, POS_Intro_Camera_02b, 6, true, 13) end, 18000) --Animate camera position + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(5, 300, 100, 1) end, 19000) --Animate DOF
Cutscene_Intro:action(function() Move_General() end, 20000) -- Teleport the General to the front
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_01_Strike) end, 21000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_02_Strike) end, 21700) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() camera:fade(true, 1) end, 23000) --Fade out



--At tower, pull focus from tower to Takeda army - 5 Seconds
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 50, 50, 1) end, 24000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_03a_Targ, POS_Intro_Camera_03a, 0, true, 22) end, 24000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 1) end, 24000) --Fade in
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 26000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 27500) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 28000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_03b_Targ, POS_Intro_Camera_03b, 5, true, 22) end, 24000) --Animate camera position + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(0.75, 500, 200, 1) end, 26000) --Animate DOF
Cutscene_Intro:action(function() camera:fade(true, 1) end, 28000) --Fade out

--At army, pan from casle to Takeda army - 5 Seconds
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 500, 50, 1) end, 29000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_04a_Targ, POS_Intro_Camera_04a, 0, true, 15) end, 29000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 1) end, 29000) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_04b_Targ, POS_Intro_Camera_04b, 5, false, 25) end, 29000) --Animate camera position + FOV
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 31000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 31700) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() Move_Cavalry() end, 30000) --Set the cavalry walking to the front
Cutscene_Intro:action(function() camera:change_depth_of_field(0.5, 8, 15, 1) end, 31000) --Animate DOF
Cutscene_Intro:action(function() camera:fade(true, 1) end, 33000) --Fade out

--Long shot of castle to Chosokabe army, general runs to the head of the army - 6 Seconds
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 1200, 300, 1) end, 34000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_05a_Targ, POS_Intro_Camera_05a, 0, true, 14) end, 34000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 1) end, 34000) --Fade in
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_03_Strike) end, 37000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_05b_Targ, POS_Intro_Camera_05b, 6, true, 17) end, 34000) --Animate camera position + FOV
Cutscene_Intro:action(function() camera:change_depth_of_field(1, 20, 40, 1) end, 36500) --Animate DOF
Cutscene_Intro:action(function() camera:fade(true, 1) end, 39000) --Fade out
Cutscene_Intro:action(function() Teleport_Units(false) end, 40000) --Teleport all out of position units back to their proper positions

---GENERALS SPEECH BEGINS----------------------------------------------------------------------------------------------------------------------

--General closeup 1
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 2, 2, 1) end, 40000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Gen_01a_Targ, POS_Gen_01a, 0, true, 16) end, 40000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 40000) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Gen_01b_Targ, POS_Gen_01b, 8, true, 16) end, 40000) --Animate camera position + FOV
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 41000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_Rear_Strike) end, 42300) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 42600) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 45000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_sheet(POS_Lightning_Gen_Sheet) end, 42600) --Sheet ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Cutscene_Intro:action(function() Play_Sound() end, 41000) --Play Generals Speech
Cutscene_Intro:action(function() Show_Subtitles() end, 41000) --Show subtitles
Cutscene_Intro:action(function() ctrl_Chosokabe_General_Motochika:start_celebrating() end, 41000) --The general starts animating during his speech
Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 47500) --Fade out

--Pan up from General, view troops
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 15, 10, 1) end, 48000) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Gen_02a_Targ, POS_Gen_02a, 0, true, 50) end, 48000) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 48000) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Gen_02b_Targ, POS_Gen_02b, 10.1, true, 50) end, 48000) --Animate camera position + FOV
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 52600) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_03_Strike) end, 53000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() camera:change_depth_of_field(1, 80, 80, 1) end, 53000) --Animate DOF
Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 57600) --Fade out

--General closeup behind
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(1, 60, 40, 1) end, 58100) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Gen_03a_Targ, POS_Gen_03a, 0, true, 30) end, 58100) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 58100) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Gen_03b_Targ, POS_Gen_03b, 5.7, true, 25) end, 58100) --Animate camera position + FOV
Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 63300) --Fade out

--Troops closeup 2, pan along front
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 5, 15, 1) end, 63800) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Gen_04a_Targ, POS_Gen_04a, 0, true, 30) end, 63800) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 63800) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Gen_04b_Targ, POS_Gen_04b, 5.7, true, 25) end, 63800) --Animate camera position + FOV
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 65000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_Rear_Strike) end, 67000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 67300) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
--Cutscene_Intro:action(function() camera:change_depth_of_field(2, 200, 100, 1) end, 63800) --Animate DOF
Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 69000) --Fade out

--General closeup 3, pan over cavalry
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 5, 8, 1) end, 69500) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Gen_05a_Targ, POS_Gen_05a, 0, true, 30) end, 69500) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 69500) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Gen_05b_Targ, POS_Gen_05b, 6.8, true, 30) end, 69500) --Animate camera position + FOV
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_Rear_Strike) end, 72500) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 74000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_sheet(POS_Lightning_Cav_Sheet) end, 73800) --Sheet ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 75800) --Fade out

--Troops closeup 3, pan along behind them
--Start Params
Cutscene_Intro:action(function() camera:change_depth_of_field(0, 45, 10, 1) end, 76300) --Set DOF
Cutscene_Intro:action(function() camera:move_to(POS_Gen_06a_Targ, POS_Gen_06a, 0, true, 20) end, 76300) --Set start pos + FOV
--Animations
Cutscene_Intro:action(function() camera:fade(false, 0.5) end, 76300) --Fade in
Cutscene_Intro:action(function() camera:move_to(POS_Gen_06b_Targ, POS_Gen_06b, 9.7, true, 20) end, 76300) --Animate camera position + FOV

Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 82000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_Rear_Strike) end, 82600) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_LFlank_Strike) end, 83000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_RFlank_Strike) end, 83500) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Cutscene_Intro:action(function() weather_interface:trigger_lightning_strike(POS_Lightning_Rear_Strike) end, 84000) --Lightning /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

Cutscene_Intro:action(function() camera:change_depth_of_field(0.7, 5, 10, 1) end, 80800) --Animate DOF
Cutscene_Intro:action(function() camera:fade(true, 0.5) end, 85500) --Fade out

--CHEERING
Cutscene_Intro:action(function() Start_Celebrating_Now_Units() end, 81500) --Start the men cheering
Cutscene_Intro:action(function() Play_Cheering_Sound() end, 81500) --Start the men cheering
Cutscene_Intro:action(function() Play_Cheering_Sound2() end, 82500) --Start the men cheering
Cutscene_Intro:action(function() Play_Cheering_Sound3() end, 83500) --Start the men cheering

Cutscene_Intro:action(function() Teleport_Units_End() end, 86000) --Move the general back to his start position
Cutscene_Intro:action(function() Stop_Celebrating_Now_Units() end, 86000) --Stop the men cheering
Cutscene_Intro:action(function() camera:move_to(POS_Intro_Camera_01_Targ, POS_Intro_Camera_01, 0, false, 0) end, 86000) --Cam cut to the start position
Cutscene_Intro:action(function() camera:change_height_range(-1.0, -1.0) end, 86000) --Reset camera clamp distances
Cutscene_Intro:action(function() battle:enable_cinematic_ui(false, true) end, 86000) --Turn cinematic UI off

Cutscene_Intro:action(function() camera:enable_functionality("CAMERA_ALL_FUNCTIONS") end, 86000) --Turn the camera controls back on
Cutscene_Intro:action(function() weather_interface:enable_random_lightning(true) end, 86000) --Turn random lightning back on
--Cutscene_Intro:action(function() camera:fade(false, 2) end, 86000) --Fade in
Cutscene_Intro:action(function() camera:change_depth_of_field(0) end, 86000) --Reset DOF


function Cutscene_Restart()
	Cutscene_Intro:start();
end;

function Skip_Cutscene()
	camera:change_height_range(-1.0, -1.0)
	Teleport_Units_End()
	Stop_Celebrating_Now_Units()
	subtitles_Japanese:end_subtitles()
	
	battle:enable_cinematic_ui(false, true)
	camera:enable_functionality("CAMERA_ALL_FUNCTIONS")
	weather_interface:enable_random_lightning(true)
	camera:change_depth_of_field(0)
	
end

-------------------------------------------------------------------------------------------

--Pos2_General_Motochika = battle_vector:new()
Pos2_Chosokabe_Katana_Cav_5 = battle_vector:new()
--Pos2_Chosokabe_Samurai_3 = battle_vector:new()
Pos2_Chosokabe_Samurai_4 = battle_vector:new()

--Pos2_General_Motochika:set(124.0, 22.0, 171.7)
Pos2_Chosokabe_Katana_Cav_5:set(191.1, 20.5, 175.5)
--Pos2_Chosokabe_Samurai_3:set(197.1, 15.1, 287.0)
Pos2_Chosokabe_Samurai_4:set(243.6, 13.5, 265.2)

function Move_Samurai()
	-- goto_location_angle_width(Vector location, Number angle_degrees, Number width, [optional] move_fast)

	--T_Chosokabe_Samurai_3.Controller_Name:goto_location_angle_width(Pos2_Chosokabe_Samurai_3, 32.66, 47.79, Walk)
	T_Chosokabe_Samurai_4.Controller_Name:goto_location_angle_width(Pos2_Chosokabe_Samurai_4, 37.24, 48.63, Walk)
end

function Move_General()
	--Teleport(T_Chosokabe_Samurai_3)
	Teleport(T_Chosokabe_Samurai_4)
	--T_General_Motochika.Controller_Name:teleport_to_location(Pos2_General_Motochika, 210.94, 22.22)
end

function Move_Cavalry()
	T_Chosokabe_Katana_Cav_5.Controller_Name:goto_location_angle_width(Pos2_Chosokabe_Katana_Cav_5, 210.94, 22.22, Run)
end

function Start_Celebrating_Now_Units()
	ctrl_Chosokabe_Katana_Cav_1:start_celebrating()
	ctrl_Chosokabe_Katana_Cav_2:start_celebrating()
	ctrl_Chosokabe_Katana_Cav_3:start_celebrating()
	ctrl_Chosokabe_Katana_Cav_4:start_celebrating()
	ctrl_Chosokabe_Katana_Cav_5:start_celebrating()
	ctrl_Chosokabe_Samurai_1:start_celebrating()
	ctrl_Chosokabe_Samurai_2:start_celebrating()
	ctrl_Chosokabe_Samurai_3:start_celebrating()
	ctrl_Chosokabe_Samurai_4:start_celebrating()
	ctrl_Chosokabe_Yari_Ashigaru_1:start_celebrating()
	ctrl_Chosokabe_Yari_Ashigaru_2:start_celebrating()
	ctrl_Chosokabe_Yari_Ashigaru_3:start_celebrating()
	ctrl_Chosokabe_Yari_Ashigaru_4:start_celebrating()
	ctrl_Chosokabe_Yari_Ashigaru_5:start_celebrating()
	ctrl_Chosokabe_Bow_Ashigaru_1:start_celebrating()
	ctrl_Chosokabe_Bow_Ashigaru_2:start_celebrating()
	ctrl_Chosokabe_Bow_Ashigaru_3:start_celebrating()
	ctrl_Chosokabe_Bow_Ashigaru_4:start_celebrating()
	ctrl_Chosokabe_Bow_Ashigaru_5:start_celebrating()
end

function Stop_Celebrating_Now_Units()
	ctrl_Chosokabe_General_Motochika:halt()
	ctrl_Chosokabe_Katana_Cav_1:halt()
	ctrl_Chosokabe_Katana_Cav_2:halt()
	ctrl_Chosokabe_Katana_Cav_3:halt()
	ctrl_Chosokabe_Katana_Cav_4:halt()
	ctrl_Chosokabe_Katana_Cav_5:halt()
	ctrl_Chosokabe_Samurai_1:halt()
	ctrl_Chosokabe_Samurai_2:halt()
	ctrl_Chosokabe_Samurai_3:halt()
	ctrl_Chosokabe_Samurai_4:halt()
	ctrl_Chosokabe_Yari_Ashigaru_1:halt()
	ctrl_Chosokabe_Yari_Ashigaru_2:halt()
	ctrl_Chosokabe_Yari_Ashigaru_3:halt()
	ctrl_Chosokabe_Yari_Ashigaru_4:halt()
	ctrl_Chosokabe_Yari_Ashigaru_5:halt()
	ctrl_Chosokabe_Bow_Ashigaru_1:halt()
	ctrl_Chosokabe_Bow_Ashigaru_2:halt()
	ctrl_Chosokabe_Bow_Ashigaru_3:halt()
	ctrl_Chosokabe_Bow_Ashigaru_4:halt()
	ctrl_Chosokabe_Bow_Ashigaru_5:halt()
end

function Teleport_Units(value)
	if (value == true) then
		Teleport(T_General_Motochika)
	else
	-- do nothing
	end
	Teleport(T_Chosokabe_Katana_Cav_2)
	Teleport(T_Chosokabe_Katana_Cav_3)
	Teleport(T_Chosokabe_Katana_Cav_4)
	Teleport(T_Chosokabe_Katana_Cav_5)
	--Teleport(T_Chosokabe_Samurai_3)
	Teleport(T_Chosokabe_Samurai_4)
	Teleport(T_Chosokabe_Bow_Ashigaru_1)
	Teleport(T_Chosokabe_Bow_Ashigaru_2)
end


function Teleport_Units_End()
	Teleport(T_General_Motochika)
	Teleport_End(T_Chosokabe_Katana_Cav_2)
	Teleport(T_Chosokabe_Katana_Cav_3)
	Teleport_End(T_Chosokabe_Katana_Cav_4)
	Teleport_End(T_Chosokabe_Katana_Cav_5)
	--Teleport(T_Chosokabe_Samurai_3)
	Teleport(T_Chosokabe_Samurai_4)
	Teleport(T_Chosokabe_Bow_Ashigaru_1)
	Teleport(T_Chosokabe_Bow_Ashigaru_2)
end

function Teleport(T_Name)
	T_Name.Controller_Name:teleport_to_location(T_Name.Location, T_Name.Orientation, T_Name.Width)
end

function Teleport_End(T_Name)
	T_Name.Location = T_Name.Location2
	T_Name.Orientation = T_Name.Orientation2
	T_Name.Width = T_Name.Width2
	T_Name.Controller_Name:teleport_to_location(T_Name.Location, T_Name.Orientation, T_Name.Width)
end