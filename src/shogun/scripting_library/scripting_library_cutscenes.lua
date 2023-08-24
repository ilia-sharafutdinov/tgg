
__Cutscene_List = {}

function Esc_Key_Pressed()
	--bm:out("Esc_Key_Pressed!!! Size of __Cutscene_List is " .. #__Cutscene_List);

	if #__Cutscene_List == 0 then
		return;
	end;
	
	for i = 1, #__Cutscene_List do
		if __Cutscene_List[i]:isactive() then
			__Cutscene_List[i]:skip();
			return;
		end;
	end;
end;


cutscene = {
	bm = nil,
	uc_playersarmy = nil,
	end_callback = nil,
	cutscene_length = 0,
	name = nil,
	skippable = false,
	restore_cam_on_end = false,
	subtitles = nil,
	action_list = nil,
	action_ptr = 1,
	is_debug = false,
	hide_debug_ui = false,
	is_running = false,
	start_time = 0,
	wait_offset = 0,
	advisor_wait = false,
	vo_wait = false,
	skip_cam = nil,
	skip_cam_target = nil,
	should_fade_out = false,
	skip_callback = nil,
	relative_mode = false,
	cumulative_time = 0,
	camera_smoother = nil,
	music = nil,
	music_fade_in = 0,
	music_fade_out = 0,
	cinematic_bars = false,
	suppress_unit_vo = false
}


function cutscene:new(bm, uc_playersarmy, end_callback, cutscene_length, name, skippable, restore_cam_on_end, skip_cam, skip_cam_target, should_fade_out, skip_callback)
	c = {};
	setmetatable(c, self);
	self.__tostring = function() return TYPE_CUTSCENE_MANAGER end;
	self.__index = self;
		
	c.bm = bm;
	c.uc_playersarmy = uc_playersarmy;
	c.end_callback = end_callback;
	c.cutscene_length = cutscene_length;
	c.name = name;
	c.skippable = skippable;
	c.restore_cam_on_end = restore_cam_on_end;
	c.action_list = {};
	c.action_ptr = 1;
	c.is_debug = false;
	c.hide_debug_ui = false;
	c.is_running = false;
	c.start_time = 0;
	c.wait_offset = 0;
	c.advisor_wait = false;
	c.vo_wait = false;
	c.relative_mode = false;
	c.cumulative_time = 0;
	c.camera_smoother = nil;
	c.music = nil;
	c.music_fade_in = 0;
	c.music_fade_out = 0;
	c.cinematic_bars = false;
	c.suppress_unit_vo = false;
	
	if skippable then
		c.skip_cam = skip_cam;
		c.skip_cam_target = skip_cam_target;
		c.should_fade_out = should_fade_out or false;
		c.skip_callback = skip_callback;
	end;
	
	table.insert(__Cutscene_List, c);
	
	return c;
end;


function cutscene:register_subtitles(subtitles)
	if is_subtitles(subtitles) then
		self.subtitles = subtitles;
	end;
end;


function cutscene:set_music(music_event, fade_in, fade_out)
	if self.is_running then
		self.bm:out(self.name .. " error : trying to set music on a running cutscene");
		return false;
	end;
	
	if not is_string(music_event) then
		self.bm:out(self.name .. " error : trying to set music but supplied event argument is not a string");
		return false;
	end;
	
	if is_nil(fade_in) then
		local fade_in = 0;
	end;
	
	if is_nil(fade_out) then
		local fade_out = 0;
	end;
	
	if not is_number(fade_in) then
		self.bm:out(self.name .. " error : trying to set music but supplied fade_in argument is not a number (or nil)");
		return false;
	end;
	
	if not is_number(fade_out) then
		self.bm:out(self.name .. " error : trying to set music but supplied fade_out argument is not a number (or nil)");
		return false;
	end;
	
	if self.is_debug then
		self.bm:out(self.name .. " setting music to " .. music_event .. " with a fade-in of " .. fade_in .. " and fade-out of " .. fade_out);
	end;
		
	self.music = music_event;
	self.music_fade_in = fade_in;
	self.music_fade_out = fade_out;
end;



function cutscene:suppress_unit_voices(new_value)
	if new_value == nil then
		new_value = true;
	end;
	
	if not is_bool(new_value) then
		self.bm:out(self.name .. " error : trying to suppress unit voices with a junk parameter");
		return false;
	end;
	
	if self.is_running then
		self.bm:out(self.name .. " error : trying to suppress unit voices on a running cutscene");
		return false;
	end;
	
	self.suppress_unit_vo = new_value;
end;


function cutscene:set_relative_mode()
	if #self.action_list > 0 then
		self.bm:out("Trying to set cutscene " .. self.name .. " to relative mode after already adding actions, you cannot do this!");
		return false;
	end;
	
	self.bm:out("Setting " .. self.name .. " to relative mode");
	self.relative_mode = true;
end;


function cutscene:set_debug(new_value)
	if new_value == nil then
		self.is_debug = true;
	else
		self.is_debug = new_value;
	end;
end;


function cutscene:set_cinematic_bars(new_value)
	if new_value == nil then
		new_value = true;
	end;
	
	if not is_bool(new_value) then
		self.bm:out(self.name .. " error : trying to set cinematic bars with a junk parameter");
		return false;
	end;
	
	if self.is_running then
		self.bm:out(self.name .. " error : trying to set cinematic bars on a running cutscene");
		return false;
	end;
	
	self.cinematic_bars = new_value;
end;


function cutscene:set_hide_debug_ui(new_value)
	if new_value == nil then
		self.hide_debug_ui = true;
	else
		self.hide_debug_ui = new_value;
	end;
end;


function cutscene:is_any_cutscene_running()
	if #__Cutscene_List == 0 then
		return false;
	end;
	
	for i = 1, #__Cutscene_List do
		if __Cutscene_List[i]:isactive() then
			return true;
		end;
	end;
	
	return false;
end;


function cutscene:start()
	if self:is_any_cutscene_running() then
		self.bm:out("Cannot start cutscene " .. self.name .. ", another cutscene is running!");
		return false;
	end;
	
	if not self.is_debug then
		self.bm:steal_input_focus();
		self.bm:camera():disable_functionality("CAMERA_ALL_FUNCTIONS");
	end;
	
	-- set camera mode to TW-cam
	self.bm:enable_cinematic_camera(true);
	
	-- set battle speed to normal
	self.bm:modify_battle_speed(1);
	
	self.bm:camera():disable_shake();
	
	if not self.is_debug or self.hide_debug_ui then	
		self.bm:enable_cinematic_ui(true, false, self.cinematic_bars);
		--self.bm:enable_cinematic_ui(true, false);		-- remove when Scott finds a solution to the menu bar being visible with cinematic bars
		self.bm:ui_component("radar_group"):set_visible(false);
		self.bm:ui_component("layout"):set_visible(false);
	end;
	
	self.bm:out("Starting cutscene " .. tostring(self.name));
	
	self.bm:camera():disable_anchor_to_army();
	
	self.bm:change_conflict_time_update_overridden(true);
	
	if self.subtitles then
		self.subtitles:set_alignment("bottom_centre");
		self.subtitles:begin("bottom_centre");
	end;
	
	if self.music then
		self.bm:stop_music(0);
		self.bm:set_music_auto_playback(false);	
		self.bm:play_music(self.music, self.music_fade_in);
		
		self:action(function() self.bm:stop_music(self.music_fade_out) end, self.cutscene_length - self.music_fade_out);
		self:action(function() self.bm:set_music_auto_playback(true) end, self.cutscene_length - self.music_fade_out);
	end;
	
	if self.suppress_unit_vo then
		self.bm:suppress_unit_voices(true);
	end;
		
	self.action_ptr = 1;
	
	-- a bit of hackery to force absolute timing when we queue up the end of the cutscene
	temp_relative_mode = self.relative_mode;
	self.relative_mode = false;
	
	self:action(function() self:wait_for_vo() end, self.cutscene_length);	
	self:action(function() self:wait_for_advisor() end, self.cutscene_length);
	self:action(function() self:finish() end, self.cutscene_length, true);
	
	self.relative_mode = temp_relative_mode;
	
	self.uc_playersarmy:take_control();
	self.is_running = true;
	self.start_time = timestamp_tick;
	
	if self.restore_cam_on_end then	
		self.skip_cam = self.bm:camera():position();
		self.skip_cam_target = self.bm:camera():target();
	end;
	
	if self.skippable then
		self.bm:steal_escape_key();
	end;
	
	self:process_next_action();
		
	return true;
end;


function cutscene:wait_for_advisor()
	self.advisor_wait = true;
end;


function cutscene:wait_for_vo()
	self.vo_wait = true;
end;


function cutscene:process_next_action()
	if not self.isactive then
		self.bm:out("Cutscene " .. name .. " tried to process an action while not active, the action didn't happen.");		
	
		return false;
	end;

	if self.action_ptr > #self.action_list then		
		return false;
	end;
		
	--action_time is the absolute time from the battle start that we reckon the next action should take place
	local action_time = self.start_time + self.action_list[self.action_ptr].delay + self.wait_offset;
		
	--if it's not time for the next action to be processed, then check again when it is
	if action_time > (timestamp_tick + time_increment_ms) then
		local next_time = self.action_list[self.action_ptr].delay + self.wait_offset - (timestamp_tick - self.start_time)
		self.bm:register_callback(function() self:process_next_action() end, next_time, self.name);
		
		return false;	
	end;
	
	--check if the advisor has finished (if we need to). If it's not finished, wait 500ms and try again
	if self.advisor_wait then
		if not self.bm:advice_finished() then
			self.wait_offset = self.wait_offset + 500;
			self.bm:register_callback(function() self:process_next_action() end, 500, self.name);
			
			return false;
		else
			self.advisor_wait = false;
		end;
	end;
	
	
	--check if subtitle vo has finished (if we need to). If it's not finished, wait 500ms and try again
	if self.vo_wait then
		--if false then
		if not self.bm:vo_finished() then
			self.wait_offset = self.wait_offset + 500;
			self.bm:register_callback(function() self:process_next_action() end, 500, self.name);
			
			return false;
		else
			self.vo_wait = false;
		end;
	end;
	
		
	--call the current action in the queue, and then speculatively try the next in the queue (unless this is the last action)
	
	if self.is_debug then
		self.bm:out(self.name .. " : processing action " .. self.action_ptr);
	end;
	
	if self.action_list[self.action_ptr].is_terminator then
		self.action_list[self.action_ptr].callback();
	else
		self.action_list[self.action_ptr].callback();
		self.action_ptr = self.action_ptr + 1;
		
		if self.skippable and self.is_running then
			self.bm:steal_escape_key();
		end;
		
		self:process_next_action();
	end;
	
	return true;
end;



function cutscene:action(new_callback, new_delay, new_is_terminator)
	if self.is_running then
		self.bm:out("Warning: trying to add an action to a running cutscene! You can't do this!");
		return false;
	end;
	if new_delay > self.cutscene_length then
		self.bm:out("Warning: trying to add an action past the end of a cutscene! You can't do this!");
		return false;
	end;
	
	new_is_terminator = new_is_terminator or false;
	
	if self.relative_mode then
		-- add action to list in relative timing mode
		self.cumulative_time = self.cumulative_time + new_delay;
		table.insert(self.action_list, {callback = new_callback, delay = self.cumulative_time, is_terminator = new_is_terminator});
		return true;
	else
		-- add action to list in absolute timing mode
		for i = 1, #self.action_list do
			if self.action_list[i].delay > new_delay then
				table.insert(self.action_list, i, {callback = new_callback, delay = new_delay, is_terminator = new_is_terminator});
				return true;
			end;
		end;
		
		table.insert(self.action_list, {callback = new_callback, delay = new_delay, is_terminator = new_is_terminator});
		return true;
	end;
	
	return false;
end;


function cutscene:isactive()
	return self.is_running;
end;


function cutscene:register_camera_smoother(new_camera_smoother)
	if not self.is_running then
		self.bm:out(self.name .. " error : attempting to register a camera smoother but the cutscene isn't running");
		
		return false;
	end;
	
	if not is_camerasmoother(new_camera_smoother) then
		self.bm:out(self.name .. " error : attempting to register a camera smoother, but the object supplied is not a camera smoother");
		
		return false;
	end;
	
	if self.camera_smoother then
		self.bm:out(self.name .. " warning : camera smoother is trying to register itself before the previous one has finished");
	end;
	
	self.camera_smoother = new_camera_smoother;
end;


function cutscene:unregister_camera_smoother(new_camera_smoother)
	if not self.is_running then
		self.bm:out(self.name .. " error : attempting to unregister a camera smoother but the cutscene isn't running");
		
		return false;
	end;
	
	if not is_camerasmoother(new_camera_smoother) then
		self.bm:out(self.name .. " error : attempting to unregister a camera smoother, but the object supplied is not a camera smoother");
		
		return false;
	end;
	
	if not self.camera_smoother then
		self.bm:out(self.name .. " warning : camera smoother is trying to unregister itself but no camera smoother is registered");
	end;
	
	self.camera_smoother = nil;
end;


function cutscene:skip()
	self.bm:remove_process(self.name);
		
	if self.should_fade_out then
		self.bm:camera():fade(true, 0.1);
	end;
	
	self.bm:register_callback(
		function()
			if self.music then
				self.bm:stop_music(0);
				self.bm:set_music_auto_playback(true);
			end;
	
			if self.skip_cam_target and self.skip_cam then
				self.bm:camera():move_to(self.skip_cam_target, self.skip_cam, 0, false, 0);
			end;
	
			self.bm:out("Skipping remainder of cutscene " .. tostring(self.name));
			if self.skip_callback then
				self.skip_callback();
			end;
		
			self:release();
		end,
		200
	);
end;


function cutscene:finish()
	if self.restore_cam_on_end then	
		self.bm:camera():move_to(self.skip_cam_target, self.skip_cam, 1, false, 0);
		
		bm:register_callback(function() self:release() end, 1000, self.name);
		
		return true;
	end;
		
	self:release();
end;


function cutscene:release()	
	if not self.is_debug then
		self.bm:camera():enable_functionality("CAMERA_ALL_FUNCTIONS");
		self.bm:release_input_focus();
	end;
	
	__camera_debug = true;
	
	-- Set camera mode back to default
	self.bm:register_callback(
								function()				
									if not self:is_any_cutscene_running() then
										self.bm:camera():enable_anchor_to_army();
										self.bm:enable_cinematic_camera(false)
									end;
								end, 
								100,
								"Cutscene_Camera_Anchor"
							);
	
	if not self.is_debug or self.hide_debug_ui then
		self.bm:enable_cinematic_ui(false, true, false);
		self.bm:ui_component("radar_group"):set_visible(true);
		self.bm:ui_component("layout"):set_visible(true);
	end;
	
	if self.camera_smoother then
		self.camera_smoother:stop();
	end;
	
	if self.suppress_unit_vo then
		self.bm:suppress_unit_voices(false);
	end;
	
	self.bm:camera():enable_shake();
	
	self.bm:change_conflict_time_update_overridden(false);
		
	self.is_running = false;
		
	self.bm:out("Ending cutscene " .. tostring(self.name));
	
	if self.wait_offset > 0 then
		self.bm:out("This cutscene was " .. self.wait_offset .. "ms longer than specified due to waiting for VO to complete.");
	end;
	
	self.uc_playersarmy:release_control();
	if self.skippable then	
		self.bm:release_escape_key();
	end;
	
	self.bm:close_advisor();
	if self.subtitles then
		self.subtitles:clear();
	end;
	
	
	self.end_callback();
end;









----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	CAMERA SMOOTHER
--
--	The Camera Smoother is used to create a smooth camera pan along a series of points. It considers the points that the camera and camera target take
--	along the camera pan to be two seperate b-splines, and interpolates additional points along those paths. Thus the camera pan won't pass exactly through the points
--	given, save for the first and last points.
--
--	The camera pans between two sequential given points in a constant time. To control this, the user is able to determine the points supplied and the total 
--	time of the pan.
--
--
--  PARAMETERS
--
--	camera_smoother:new(...)
--	
--	BATTLE_MANAGER a link to your battle manager object
--	STRING a name describing your patrol manager. This should be unique among camera smoother in your script, otherwise Bad Things Will Happen
--	NUMBER the total time in seconds that the camera pan should take
--	opt CUTSCENE the parent cutscene of this camera smoother, if the cutscene gets skipped while playing it will stop any child camera smoothers automatically
--
--  camera_smoother:set_tick_time(NUMBER value)
--
--  Call this to change how often the camera will update it's movement. The value is set in seconds. The default value is 0.2, which makes for 5 camera updates per second.
--
--  PARAMETERS
--  
--  NUMBER time in seconds between camera updates. Must obey 0.1 < t < cutscene_length
--
--
--  camera_smoother:add_point(VECTOR camera_position, VECTOR camera_target)
--
--  Adds a position to the camera smoother. Positions are added in order. A camera smoother must have at least two positions added before it is started.
--
--	PARAMETERS
--
--	VECTOR camera position
--	VECTOR camera target
--
--
--	camera_smoother:register_cutscene(CUTSCENE cutscene)
--
--	Registers a parent cutscene. Do this to have the cutscene automatically clean up running camera smoothers if the cutscene gets skipped.
--
--	PARAMETERS
--
--	CUTSCENE cutscene to register as parent
--
--
--	camera_smoother:start()
--
--	Starts the camera smoother. The camera will be cut to the start of the pan path and then pan smoothly along it until the end.
--
--	<no parameters>
--
--  camera_smoother:stop()
--
--  Stops the smoother
--  
--  <no parameters>
--
--
--  camera_smoother:set_debug(opt BOOLEAN value)
--
--  Sets this camera smoother into debug mode. Camera smoothers in debug mode print information about what they're doing to the console
--  
--  optional BOOLEAN value - debug on or off, defaults to true
--
--
--  camera_smoother:set_debug_all(opt BOOLEAN value)
--
--  Sets ALL camera smoothers into debug mode. Setting this to true on any camera smoother sets all smoothers to print debug information
--  
--  optional BOOLEAN value - debug on or off, defaults to true
--
--
--	camera_smoother:play_sequence(opt NUMBER start position, opt NUMBER interval time in seconds)
--
--	Sets the camera smoother to pan between it's supplied control points, to allow the scripter to re-align them more easily.
--
--	PARAMETERS
--
--	opt NUMBER the control point that the pan starts at, so as to not have to wait through 3/4 of the pan before getting to the offending point
--	opt NUMBER interval in seconds that the camera pauses at each point. Defaults to 5 seconds
-----------------------------------------------------------------------------------------------------------

--[[
	SAMPLE USAGE:
	
	cs_test = camera_smoother:new(
								bm,
								"cs_test",
								30
							);
							
	cs_test:set_debug();
	
	cs_test:add_point(v(237.5, 36.1, -25.6), v(214.6, 26.8, 49.8));
	cs_test:add_point(v(286.7, 32.1, -40.5), v(295.7, 10.4, 35.3));
	cs_test:add_point(v(270.4, 26.5, -83.5), v(284.2, 4.7, -8.4));
	cs_test:add_point(v(230.2, 21.7, -121.6), v(243.8, 7.4, -44.7));
	cs_test:add_point(v(171.7, 16.5, -168.7), v(208.7, 2.2, -99.9));
	cs_test:add_point(v(169.9, 16.5, -198.0), v(211.1, 2.2, -131.7));
	cs_test:add_point(v(215.8, 16.5, -227.1), v(231.8, 2.2, -150.7));
	cs_test:add_point(v(260.9, 13.5, -239.0), v(257.7, -0.2, -160.9));
	cs_test:add_point(v(285.1, 10.9, -245.7), v(247.7, -2.7, -177.0));
	cs_test:add_point(v(288.7, 10.9, -246.8), v(230.3, -5.9, -195.7));
	cs_test:add_point(v(285.2, 10.9, -246.2), v(208.2, -5.3, -235.5));
	cs_test:add_point(v(276.7, 9.8, -242.8), v(200.8, -10.3, -254.9));
	cs_test:add_point(v(270.1, 8.8, -240.3), v(202.8, -11.3, -277.3));
	cs_test:add_point(v(267.4, 8.1, -240.6), v(206.8, -12, -287.8));
	cs_test:add_point(v(266.5, 7.5, -240.9), v(208.6, -10.6, -292.1));
	cs_test:set_tick_time(0.15);	--optional
	
	cs_test:start();
	
]]


__camera_smoother_debug = false;

camera_smoother = {
	bm = nil,
	name = "",
	running_time = 0,
	cam_points = {},
	targ_points = {},
	is_debug = false,
	is_running = false,
	current_tick = 0;
	current_speed = 0;
	tick_time = 0.2;
	camera_tick_time = 0.25;
	time_per_point = 0;
	cutscene = nil;
	
}

function camera_smoother:new(new_bm, new_name, new_running_time, new_cutscene)
	--check parameters
	if not is_battlemanager(new_bm) then
		return false;
	end;
	
	if not is_string(new_name) then
		new_bm:out("Couldn't create Camera Smoother: no name given or name invalid");
		
		return false;
	end;
	
	if not is_number(new_running_time) or new_running_time <= 0 then
		new_bm:out("Couldn't create Camera Smoother " .. self.name .. ": no running time given or running time invalid");
		
		return false;
	end;
		
	cs = {};
	setmetatable(cs, self);
	self.__index = self;
	self.__tostring = function() return TYPE_CAMERA_SMOOTHER end;
		
	cs.bm = new_bm;
	cs.name = "Camera_Smoother_" .. new_name;
	cs.running_time = new_running_time;
	cs.cam_points = {};
	cs.targ_points = {};
	cs.is_debug = false;
	cs.is_running = false;
	cs.current_tick = 1;
	cs.tick_time = 0.2;
	cs.camera_tick_time = 0.25;
	cs.time_per_point = 0;
	cs.cutscene = nil;
	
	if new_cutscene then
		cs:register_cutscene(new_cutscene);
	end;
		
	return cs;
end;


function camera_smoother:set_debug(value)
	if self.is_running then
		self.bm:out(self.name .. " warning: trying to change debug state of a running camera smoother. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		self.is_debug = value;
	else
		self.is_debug = true;
	end;
end;


function camera_smoother:set_debug_all(value)
	if self.is_running then
		self.bm:out(self.name .. " warning: trying to change global debug state of a running camera smoother. This is undesirable, but doing it anyway.");
	end;

	if is_boolean(value) then
		__camera_smoother_debug = value;
	else
		__camera_smoother_debug = true;
	end;
end;


function camera_smoother:set_tick_time(value)
	if self.is_running then
		self.bm:out(self.name .. " error: trying to adjust the tick time on a running camera smoother.");
		
		return false;
	end;
	
	if not is_number(value) or value <= 0 then
		self.bm:out(self.name .. " error: tick time needs to be a number greater than zero.");
		
		return false;
	end;
	
	if value < 0.1 or value > self.running_time then
		self.bm:out(self.name .. " error: tick time needs to be greater than 0.1s and less than the length of the cutscene.");
		
		return false;
	end;
	
	if (value * 10) ~= math.floor(value * 10) then
		self.bm:out(self.name .. " warning: tick time cannot be to more than one decimal place, setting it to " .. math.floor(value * 10) / 10);
		
		self.tick_time = math.floor(value * 10) / 10;
		
		return true;
	end;

	self.tick_time = value;
end;


function camera_smoother:add_point(new_cam_point, new_targ_point)
	if not is_vector(new_cam_point) then
		self.bm:out(self.name .. " error: trying to add object " .. tostring(new_cam_point) .. " as a new camera point when it's not a vector");
		
		return false;
	end;
	
	if not is_vector(new_targ_point) then
		self.bm:out(self.name .. " error: trying to add object " .. tostring(new_targ_point) .. " as a new target point when it's not a vector");
		
		return false;
	end;
	
	if self.is_debug or __camera_smoother_debug then
		self.bm:out(self.name .. " : adding camera " .. Vector_To_String(new_cam_point) .. " with target " .. Vector_To_String(new_targ_point));
	end;
	
	table.insert(self.cam_points, new_cam_point);
	table.insert(self.targ_points, new_targ_point);
end;


function camera_smoother:register_cutscene(new_cutscene)
	if not is_cutscene(new_cutscene) then
		self.bm:out(self.name .. " warning : attempting to register with an object that is not a cutscene, ignoring");
		
		return false;
	end;
	
	self.cutscene = new_cutscene;
end;


function camera_smoother:start()
	if self.is_running then
		self.bm:out(self.name .. " error: trying to start a camera smoother that is already running");
		return false;
	end;

	if #self.cam_points < 2 then
		self.bm:out(self.name .. " error: trying to start a camera smoother that has less than four points added");
		return false;
	end;
	
	self.is_running = true;
		
	if self.cutscene then
		self.cutscene:register_camera_smoother(self);
	end;
		
	-- duplicate the start and end nodes for each spline
	table.insert(self.cam_points, 1, self.cam_points[1]);
	table.insert(self.targ_points, 1, self.targ_points[1]);
	
	table.insert(self.cam_points, self.cam_points[#self.cam_points]);
	table.insert(self.targ_points, self.targ_points[#self.targ_points]);
		
	--work out some constants
	self.camera_tick_time = self.tick_time * 1.5;
	self.time_per_point = self.running_time / (#self.cam_points - 3);
		
	self:show_next_camera();
end;


function camera_smoother:show_next_camera()
	
	if ((self.current_tick * self.tick_time) + self.tick_time) >= self.running_time then
		-- this is the last camera movement, let the camera slow down to a stop and then return
				
		local remaining_time = self.running_time - ((self.current_tick - 1) * self.tick_time)
				
		self.bm:camera():move_to(self:get_next_targ(), self:get_next_cam(), remaining_time);
		
		bm:register_callback(function() self:finish() end, remaining_time * 1000, self.name);
		return;
	end;

	-- first camera, cut the camera to the first point and then continue as normal
	if self.current_tick == 1 then
		self.bm:camera():move_to(self.targ_points[1], self.cam_points[1], 0);
	end;
	
	
	-- all cameras (save for the last)
	self.bm:camera():move_to(self:get_next_targ(), self:get_next_cam(), self.camera_tick_time, true);
	
	self.current_tick = self.current_tick + 1;
	
	bm:register_callback(function() self:show_next_camera() end, self.tick_time * 1000, self.name);
end;


function camera_smoother:finish()
	if self.is_debug or __camera_smoother_debug then
		self.bm:out(self.name .. " : finishing");
	end;
	
	self.is_running = false;
	
	if self.cutscene then
		self.cutscene:unregister_camera_smoother(self);
	end;
end;


function camera_smoother:stop()
	if not self.is_running then
		self.bm:out(self.name .. " error: trying to stop a camera smoother that isn't running");
		return false;
	end;
	
	if self.is_debug or __camera_smoother_debug then
		self.bm:out(self.name .. " : stopping");
	end;
	
	self.is_running = false;
	self.bm:remove_process(self.name);
	
	if self.cutscene then
		self.cutscene:unregister_camera_smoother(self);
	end;
end;


function camera_smoother:get_next_targ()
	return self:get_next_pos(self.targ_points);
end;


function camera_smoother:get_next_cam()
	return self:get_next_pos(self.cam_points);
end;


-- get the next interpolated point along the spline
function camera_smoother:get_next_pos(point_list)
	local point1, point2, point3, point4 = nil;
	local interval = 0;
	
	--work out which of the supplied points in the spline we have most recently passed
	
	local current_time = (self.current_tick - 1) * self.tick_time;
	local most_recent_point = math.floor(current_time / self.time_per_point) + 2;
	local time_since_point2 = 0;
		
	if most_recent_point > #point_list - 2 then	
		-- we are among the last three points on the spline
		point1 = point_list[#point_list - 3];
		point2 = point_list[#point_list - 2];
		point3 = point_list[#point_list - 1];
		point4 = point_list[#point_list];
		
		time_since_point2 = current_time - (self.time_per_point * (#point_list - 2));
	else
		--we are NOT among the last three points on the spline
		point1 = point_list[most_recent_point - 1];
		point2 = point_list[most_recent_point];
		point3 = point_list[most_recent_point + 1];
		point4 = point_list[most_recent_point + 2];
		
		time_since_point2 = current_time - (self.time_per_point * (most_recent_point - 2));
	end;
	
	--interval is a 0.0 - 1.0 value determining where we are between point2 and point3
	local interval = time_since_point2 / self.time_per_point;
			
	return self:get_spline_point(point1, point2, point3, point4, interval);
end;


-- function that actually does the maths, works out a position of an interpolated point
-- given four abstract vectors and an interval
function camera_smoother:get_spline_point(point1, point2, point3, point4, interval)
	local a = {};
	local b = {};
	local c = {};
		
	a[1] = (0 - point1:get_x() + (3 * point2:get_x()) - (3 * point3:get_x()) + point4:get_x()) / 6;
	a[2] = ((3 * point1:get_x()) - (6 * point2:get_x()) + (3 * point3:get_x())) / 6;
	a[3] = ((-3 * point1:get_x()) + (3 * point3:get_x())) / 6;
	a[4] = (point1:get_x() + (4 * point2:get_x()) + point3:get_x()) / 6;
	
	b[1] = (0 - point1:get_y() + (3 * point2:get_y()) - (3 * point3:get_y()) + point4:get_y()) / 6;
	b[2] = ((3 * point1:get_y()) - (6 * point2:get_y()) + (3 * point3:get_y())) / 6;
	b[3] = ((-3 * point1:get_y()) + (3 * point3:get_y())) / 6;
	b[4] = (point1:get_y() + (4 * point2:get_y()) + point3:get_y()) / 6;
	
	c[1] = (0 - point1:get_z() + (3 * point2:get_z()) - (3 * point3:get_z()) + point4:get_z()) / 6;
	c[2] = ((3 * point1:get_z()) - (6 * point2:get_z()) + (3 * point3:get_z())) / 6;
	c[3] = ((-3 * point1:get_z()) + (3 * point3:get_z())) / 6;
	c[4] = (point1:get_z() + (4 * point2:get_z()) + point3:get_z()) / 6;
	
	local return_x = a[4] + interval * (a[3] +  interval * (a[2] + interval * a[1]));
	local return_y = b[4] + interval * (b[3] +  interval * (b[2] + interval * b[1]));
	local return_z = c[4] + interval * (c[3] +  interval * (c[2] + interval * c[1]));
		
	local retval = v(return_x, return_y, return_z);
	
	return retval;
end;


function camera_smoother:start_debug(start_point, interval)
	self:play_sequence(start_point, interval);
end;


-- have the camera smoother play through it's points in sequence, for debugging purposes
function camera_smoother:play_sequence(start_point, interval)
	if not is_nil(start_point) then
		if not is_number(start_point) or start_point < 1 or start_point > #self.cam_points then
			bm:out(self.name .. " warning : trying to play through point sequence but supplied start position is invalid. Starting from first point.");
		
			start_point = 1;
		end;
	else
		start_point = 1;
	end;
	
	if not is_nil(interval) then
		if not is_number(interval) or interval < 1 then
			bm:out(self.name .. " warning : trying to play through point sequence but supplied interval time is invalid. Using 5 seconds.");
		
			interval = 5;
		end;
	else
		interval = self.running_time / (#self.cam_points - 1);
	end;
	
	bm:out(self.name .. " : starting playthrough of points, starting from point " .. start_point .. ". Moving every " .. interval .. "s");

	for i = start_point, #self.cam_points do
		self.bm:register_callback(
									function()
										self.bm:out(self.name .. " : moving camera to [" .. i .. "] - pos " .. Vector_To_String(self.cam_points[i]) .. " targ " .. Vector_To_String(self.targ_points[i]));		
										self.bm:camera():move_to(self.targ_points[i], self.cam_points[i], 1)
									end,
									(i - start_point) * (interval + 1) * 1000,
									self.name
								);
	end;
end;

function Show_Objectives(sn, text, ...)
	sn:end_subtitles()
--	sn:change_if_borders_drawn(false) 


	if arg.n == 1 then
		battle:show_objective(text)
	else
		sn:change_if_borders_drawn(false) 
		sn:set_text(text)
		sn:set_alignment("mid_centre")
		sn:begin("mid_centre")
		bm:register_callback(function() sn:change_if_borders_drawn(true) end, 4000, "End_Subtitles")	
		bm:register_callback(function() sn:end_subtitles() end, 4000, "End_Subtitles")	

	end
	
--	sn:set_alignment("mid_centre")
--	sn:begin("mid_centre")
		 
--	bm:register_callback(function() sn:change_if_borders_drawn(true) end, 4000, "End_Subtitles")	
--	bm:register_callback(function() sn:end_subtitles() end, 4000, "End_Subtitles")	
end