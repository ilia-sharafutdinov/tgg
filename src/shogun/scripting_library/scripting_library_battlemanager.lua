
----------------------------------------------------------------------------------------------------------
-- **************************************************************************************************** --
----------------------------------------------------------------------------------------------------------
--
--	BATTLE MANAGER
--
--	A wrapper for registering timers and printing messages. Battle Manager won't wet the bed when you try and unregister a timer that you've already unregistered. 
--	It also allows you to easily toggle all debug messages on and off and adds timestamps to messages.
--
--	In addition, you can use the battle manager to place a watch on a unit. This allows you to easily say "run function A, B seconds after unit C reaches position D".
--	This should allow us to script waypoints and "do this when you reach this position" functions easily.
--
--	PARAMETERS:
--	On Creation:     bm = battle_manager:new(battle, true);
------------------
--	BATTLE object.
--	BOOLEAN determining whether debug messages should be output or not output.
--
--
--  General Watch:  bm:watch(function() return Town_Hall:health() < 50 end, 5000, function() Town_Hall_Has_Been_Destroyed() end, "Town Hall Watch");
------------------
--  BOOLEAN EXPRESSION to watch
--  NUMBER delay in ms before triggering (a non-zero value here means this gets added to the callback queue)
--  FUNCTION/CODE to call - this parameter has to be in the format: function() code_to_execute end -- see example script below
--  optional ID of your watch - this can be any data type, a descriptive string would be ideal. Supplying an id allows you to cancel the watch before it fires (see example below)
--
--
--  Register Callback:  bm:register_callback(function() Call_Me_In_Ten_Seconds() end, 10000, "Example Callback");
------------------
--  FUNCTION/CODE to call - this parameter has to be in the format: function() code_to_execute end -- see example script below
--  NUMBER delay in ms before triggering (a non-zero value here means this gets added to the callback queue)
--  optional ID of your watch - this can be any data type, a descriptive string would be ideal. Supplying an id allows you to cancel the watch before it fires (see example below)
--
--
--  Cancelling Watch/Callbacks:  bm:remove_process("Example Callback");
------------------
--  ID of the watch to cancel

----------------------------------------------------------------------------------------------------------

my_battle_manager = 0;

battle_manager = {
	timer_list = {},
	battle = 0,
	debug_text = false,
	watch_list = {},
	callback_list = {},
	phase_change_callback_list = {},
	advisor_list = {},
	should_close_queue_advice = true,
	advice_is_playing = false,
	advisor_force_playing = false,
	battle_phase_change_handler_registered = false,
	--to delete
	deployment_end_callback = 0,
	deployment_phase_callback = 0,
	is_naval_battle = false,
	player_victory_callback = nil,
	player_defeat_callback = nil,
	debug_angles = false,
	load_balancing = false,
	watch_timer_running = false
}
timestamp_tick = 0;

function battle_manager:new(b, debug_text)
	if my_battle_manager ~= 0 then
		my_battle_manager:out("Warning, cannot create more than one battle manager!");
		return my_battle_manager;
	end;
	if not b then
		b = empire_battle:new();
		b:out("No battle object supplied to battle_manager - creating one, but this may die a horrible death and should really be fixed.");
	end;
	
	bm = {};
	setmetatable(bm, self);
	self.__index = self;
	self.__tostring = function() return TYPE_BATTLE_MANAGER end;
	self.__type = function() return TYPE_BATTLE_MANAGER end;
	
	bm.battle = b;
	debug_text = debug_text or false;
	bm.debug_text = debug_text;
	if debug_text then
		bm:register_repeating_timer("battle_manager_tick_increment_counter", 100);
	end;
	
	bm.watch_list = {};
	
	my_battle_manager = bm;
	return bm;
end;


function battle_manager:set_load_balancing(value)
	if not is_boolean(value) then 
		value = true;
	end;

	self.load_balancing = value;
end;


function battle_manager:set_naval(value)
	self.is_naval_battle = value;
end;


function battle_manager:is_naval()
	return self.is_naval_battle;
end;


function battle_manager:alliances()
	return self.battle:alliances();
end;


function battle_manager:buildings()
	return self.battle:buildings();
end;


function battle_manager:add_ping_icon(...)
	return self.battle:add_ping_icon(...);
end;


function battle_manager:remove_ping_icon(...)
	return self.battle:remove_ping_icon(...);
end;



function battle_manager:unlock_achievement(key)
	if not is_string(key) then
		self:out("unlock_achievement() called but invalid achievement was passed!");
		
		return false;
	end;

	-- generic achievements
	if key == "ACHIEVEMENT_B_TOBA_FUSHIMI_2" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_TOBA_FUSHIMI_2 :: A Journey Begins :: Play a Fall of the Samurai historical battle"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_TOBA_FUSHIMI_2");
		
	elseif key == "ACHIEVEMENT_B_HAKODATE_WON" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_HAKODATE_WON :: Journey's End :: Complete all Fall of the Samurai historical battles"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_HAKODATE_WON");
		
	elseif key == "ACHIEVEMENT_B_HAKODATE_2" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_HAKODATE_2 :: Legendary Samurai :: Allow Saigo Takamori's unit to register more than 150 kills in a single battle"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_HAKODATE_2");
	
	-- battle-specific achievements
	elseif key == "ACHIEVEMENT_B_TOBA_FUSHIMI_1" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_TOBA_FUSHIMI_1 :: Not On My Watch :: Chase down and rout an enemy unit after it almost escapes the battlefield of Toba-Fushimi"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_TOBA_FUSHIMI_1");

	elseif key == "ACHIEVEMENT_B_OSAKA_1" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_OSAKA_1 :: D'oh-saka! :: Complete the Battle of Osaka after both bridges get blown up by the defenders"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_OSAKA_1");
	
	elseif key == "ACHIEVEMENT_B_UENO_1" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_UENO_1 :: A Blow to the Temple :: Complete the Battle of Ueno without capturing any of the key temple buildings"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_UENO_1");
		
	elseif key == "ACHIEVEMENT_B_AIZU_1" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_AIZU_1 :: Wrecking Ball :: Complete the Battle of Aizu after provoking all four hidden armies to be active on the field at once"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_AIZU_1");
			
	elseif key == "ACHIEVEMENT_B_MIYAKO_BAY_1" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_MIYAKO_BAY_1 :: The Iron Lady :: Complete the Battle of Miyako Bay with the Kotetsu having taken less than 25% damage"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_MIYAKO_BAY_1");	
		
	elseif key == "ACHIEVEMENT_B_HAKODATE_1" then
		self:out("\tUNLOCKING ACHIEVEMENT :: ACHIEVEMENT_B_HAKODATE_1 :: Attack Denied :: Complete the battle of Hakodate without any Imperial units being routed"); 
		return self.battle:unlock_achievement("ACHIEVEMENT_B_HAKODATE_1");
	else
		self:out("unlock_achievement() called but supplied key is not a historic battle achievement!");
	end;
end;


function battle_manager:show_objective(text, duration, fade)
	return self.battle:show_objective(text, duration, fade);
end;


function battle_manager:play_music(event, fade_in)
	return self.battle:play_music(event, fade_in);
end;


function battle_manager:stop_music(fade_out)
	return self.battle:stop_music(fade_out);
end;


function battle_manager:set_music_auto_playback(value)
	return self.battle:set_music_auto_playback(value);
end;


function battle_manager:modify_battle_speed(value)
	return self.battle:modify_battle_speed(value);
end;


function battle_manager:restore_battle_speed(value)
	return self.battle:restore_battle_speed(value);
end;


function battle_manager:suppress_unit_voices(value)
	return self.battle:suppress_unit_voices(value);
end;


function battle_manager:change_conflict_time_update_overridden(value)
	return self.battle:change_conflict_time_update_overridden(value);
end;


function battle_manager:register_victory_countdown_callback(callback)
	self:register_phase_change_callback("VictoryCountdown", callback);
end;


function battle_manager:register_results_callbacks(player_victory_callback, player_defeat_callback)
	self.battle:register_command_handler("Battle_Manager_Battle_Results");
	
	self.player_victory_callback = player_victory_callback;
	self.player_defeat_callback = player_defeat_callback;
end;


function battle_manager:process_results(result)
	if result then
		self:out("The Player has won the battle!");
		if self.player_victory_callback then
			self.player_victory_callback();
		else
			self:out("  No victory callback was present? If you're not seeing outro advice and you expected to then something broke.");
		end;
	else
		self:out("The Player has lost the battle!");
		if self.player_defeat_callback then
			self.player_defeat_callback();
		else
			self:out("  No defeat callback was present? If you're not seeing outro advice and you expected to then something broke.");
		end;
	end;
end;


function Battle_Manager_Battle_Results(event)
	if event:get_name() == "Battle Results" then
		my_battle_manager:process_results(event:get_bool1());
	end;
end;


function battle_manager:register_phase_change_callback(new_event, new_callback)
	if not is_string(new_event) then
		self:out("battle_manager:register_phase_change_callback() error : event given that is not a string!");
		
		return false;
	end;

	if not is_function(new_callback) then
		self:out("battle_manager:register_phase_change_callback() error : callback given that is not a function!");
		
		return false;
	end;
	
	local new_phase_change_callback = {
										event = new_event,
										callback = new_callback
									};

	table.insert(self.phase_change_callback_list, new_phase_change_callback);
		
	if not self.battle_phase_change_handler_registered then		
		self:register_battle_phase_handler("battle_manager_phase_change");
		self.battle_phase_change_handler_registered = true;
	end;
end;


function battle_manager:setup_battle(new_deployment_end_callback)
	
	self:suspend_contextual_advice(true);
	self.battle:steal_input_focus();
	
	self:register_phase_change_callback("Deployed", function() self:end_deployment() end);
	self:register_phase_change_callback("Deployed", new_deployment_end_callback);
	
	self:register_phase_change_callback("Complete", function() self:suspend_contextual_advice(false) end);
end;


function battle_manager_phase_change(event)
	my_battle_manager:out("\t\tEvent triggered :: " .. event:get_name());

	for i = 1, #my_battle_manager.phase_change_callback_list do	
		if my_battle_manager.phase_change_callback_list[i].event == event:get_name() then
			my_battle_manager.phase_change_callback_list[i].callback();
		end;
	end;
end;


function battle_manager:deployment_phase_callback()
	return self.deployment_phase_callback;
end;


function battle_manager:end_deployment()
	self.battle:ui_component("radar_group"):set_visible(true);
	self.battle:ui_component("menu_bar"):set_visible(true);
	self.battle:ui_component("layout"):set_visible(true);
	self.battle:camera():enable_functionality("CAMERA_ALL_FUNCTIONS");
	
	self.battle:release_input_focus();
end;


function battle_manager:register_battle_phase_handler(callback)
	self.battle:register_battle_phase_handler(callback);
end;


function battle_manager:unregister_battle_phase_handler()
	self.battle:unregister_battle_phase_handler();
end;


function battle_manager:suspend_contextual_advice(param)
	self.battle:suspend_contextual_advice(param)
end;

	
function battle_manager:register_singleshot_timer(name, t)
	if not self.timer_list[name] then
		self.battle:register_singleshot_timer(name, t);
		self.timer_list[name] = true;
		self:register_callback(function() self:remove_timer(name) end, t);
	end;
end;

function battle_manager:register_repeating_timer(name, t)
	if not self.timer_list[name] then
		self.battle:register_repeating_timer(name, t);
		self.timer_list[name] = true;
	end;
end;

function battle_manager:unregister_timer(name)
	if self.timer_list[name] then
		self.battle:unregister_timer(name);
		self:remove_timer(name);
	end;
end;

function battle_manager:remove_timer(name)
	self.timer_list[name] = false;
end;

function battle_manager:out(msg)
	if self.debug_text then
		self.battle:out("<" .. tostring(timestamp_tick) .. "ms> " .. msg);
	end;
end;

function battle_manager:show_advisor_message(localisation_key, default_message)
	self.battle:show_advisor_message(localisation_key, default_message);
end;

function battle_manager:ui_component(param)
	return self.battle:ui_component(param);
end;

function battle_manager:advice_finished()
	return self.battle:advice_finished();
end;

function battle_manager:vo_finished()
	return self.battle:vo_finished();
end;

function battle_manager:camera()
	return self.battle:camera();
end;

function battle_manager:enable_cinematic_ui(param1, param2, param3)
	return self.battle:enable_cinematic_ui(param1, param2, param3);
end;

function battle_manager:enable_cinematic_camera(param)
	return self.battle:enable_cinematic_camera(param);
end;

function battle_manager:steal_escape_key()
	self.battle:release_escape_key();

	return self.battle:steal_escape_key();
end;

function battle_manager:release_escape_key()
	return self.battle:release_escape_key();
end;

function battle_manager:modify_battle_speed(speed)
	return self.battle:modify_battle_speed(speed);
end;

function battle_manager:restore_battle_speed()
	return self.battle:restore_battle_speed();
end;

function battle_manager:change_victory_countdown_limit(t)
	return self.battle:change_victory_countdown_limit(t);
end;

function battle_manager:close_advisor()
	return self.battle:close_advisor();
end;

function battle_manager:steal_input_focus()
	return self.battle:steal_input_focus();
end;

function battle_manager:release_input_focus()
	return self.battle:release_input_focus();
end;

function battle_manager_tick_increment_counter()
	timestamp_tick = timestamp_tick + time_increment_ms;
end;

function battle_manager:remove_process(entryname_to_remove)
	if entryname_to_remove == "" then
		return false;
	end;

	local have_removed_entry = false;
	local i = 1;
	local j = #self.watch_list;
		
	if #self.watch_list ~= 0 then
		while i <= j do
			if self.watch_list[i].entryname == entryname_to_remove then
				table.remove(self.watch_list, i);
				have_removed_entry = true;
				j = j - 1;
			else
				i = i + 1;
			end;
		end;
	end;
	
	i = 1;
	j = #self.callback_list;
		
	if #self.callback_list ~= 0 then
		i = 1;
		j = #self.callback_list;

		while i <= j do			
			if self.callback_list[i].entryname == entryname_to_remove then			
				table.remove(self.callback_list, i);
				have_removed_entry = true;
				j = j - 1;
			else
				i = i + 1;
			end;
		end;
	end;
			
	return have_removed_entry;
end;

CONST_WATCH_INTERVAL = 2000;

function battle_manager:watch(new_condition, new_time_offset, new_callback, new_entryname)
	new_entryname = new_entryname or "";
	self.watch_list[#self.watch_list + 1] = {condition = new_condition, time_offset = new_time_offset, callback = new_callback, entryname = new_entryname, last_check = 0};
	
	if #self.watch_list == 1 then
		self:register_repeating_timer("battle_manager_tick_watch_counter", CONST_WATCH_INTERVAL);
		self.watch_timer_running = true;
	end;
end;


function battle_manager_tick_watch_counter()
	my_battle_manager:tick_watch_counter();
end;


function battle_manager:tick_watch_counter()
	if #self.watch_list == 0 then
		return false;
	end;
	
	if not self.load_balancing then
		-- old non-load-balancing script
		local i = 1;
		local j = #self.watch_list;
		my_callback = 0;
	
		while i <= j do
			if self.watch_list[i].condition() then
				if self.watch_list[i].time_offset == 0 then
					my_callback = self.watch_list[i].callback;
					table.remove(self.watch_list, i);
					my_callback();
					self:tick_watch_counter(); -- rescan the whole list
				
					return false;
				else
					self:register_callback(self.watch_list[i].callback, self.watch_list[i].time_offset, self.watch_list[i].entryname);
					table.remove(self.watch_list, i);
					j = j - 1;
				end;
			else
				i = i + 1;
			end;
		end;
	else
		-- load-balancing script
		
		-- stop the regular watch timer if it's running
		if self.watch_timer_running then
			self.watch_timer_running = false;
			self:unregister_timer("battle_manager_tick_watch_counter");
		end;
		
		-- work out how many watch entries to scan this tick
		local watch_entries_per_tick = math.ceil(#self.watch_list / (CONST_WATCH_INTERVAL / 100));
				
		local next_watch = false;
		
		for i = 1, watch_entries_per_tick do
			-- find watch entry with lowest last_check value
			next_watch = self:get_next_watch_entry();
			
			if next_watch then
				-- check it
				self:check_watch_entry(next_watch);				
			end;			
		end;
		
		self:register_callback(function() self:tick_watch_counter() end, 100);
	end;
	
end;


function battle_manager:get_next_watch_entry()
	if #self.watch_list == 0 then
		return false;
	end;

	local next_watch = 0;
	local lowest_check = timestamp_tick + 100;
	
	for i = 1, #self.watch_list do
		if self.watch_list[i].last_check < lowest_check then
			next_watch = i;
			lowest_check = self.watch_list[i].last_check;
		end;
	end;
	
	return next_watch;
end;


function battle_manager:check_watch_entry(value)
	self.watch_list[value].last_check = timestamp_tick;
		
	local retval = self.watch_list[value].condition();
	
	if retval then
		if self.watch_list[value].time_offset == 0 then
			my_callback = self.watch_list[value].callback;
			table.remove(self.watch_list, value);
			my_callback();
		else
			self:register_callback(self.watch_list[value].callback, self.watch_list[value].time_offset, self.watch_list[value].entryname);
			table.remove(self.watch_list, i);
		end;
	end;
	
	return retval;
end;


function battle_manager:print_watch_list()
	if #self.watch_list == 0 then
		self:out("Watch list is empty");
		return;
	end;
	self.battle:out("Watch list now looks like:");
	for i = 1, #self.watch_list do
		self:out(i .. ":  " .. tostring(self.watch_list[i].entryname));
	end;
end;


function battle_manager:print_callback_list()
	if #self.callback_list == 0 then
		self:out("Callback list is empty");
		return;
	end;
	self.battle:out("Callback list now looks like:");
	for i = 1, #self.callback_list do
		self:out(i .. ":  " .. tostring(self.callback_list[i].entryname) .. " will be called at " .. self.callback_list[i].calltime .. "ms");
	end;
end;


function battle_manager:register_repeat_callback(new_callback, new_time_offset, new_entryname)
	self:register_callback(new_callback, new_time_offset, new_entryname);
	self:register_callback(function() self:register_repeat_callback(new_callback, new_time_offset, new_entryname) end, new_time_offset, new_entryname);
end;


function battle_manager:register_callback(new_callback, new_time_offset, new_entryname)
	if not new_callback or not new_time_offset then
		return false;
	end;

	new_entryname = new_entryname or "";
	local new_calltime = new_time_offset + timestamp_tick;
	
	if #self.callback_list == 0 then
		table.insert(self.callback_list, 1, {callback = new_callback, calltime = new_calltime, entryname = new_entryname});
		
		self:unregister_timer("battle_manager_tick_callback", true);
		self:register_singleshot_timer("battle_manager_tick_callback", new_time_offset);
	else
		for i = 1, #self.callback_list do
			if self.callback_list[i].calltime > new_calltime then			
				table.insert(self.callback_list, i, {callback = new_callback, calltime = new_calltime, entryname = new_entryname});
				if i == 1 then
					self:unregister_timer("battle_manager_tick_callback", true);
					self:register_singleshot_timer("battle_manager_tick_callback", new_time_offset, true);
				end;
				break;
			end;
			if i == #self.callback_list then
				table.insert(self.callback_list, #self.callback_list + 1, {callback = new_callback, calltime = new_calltime, entryname = new_entryname});
				break;
			end;
		end;
	end;
end;


function battle_manager_tick_callback()
	my_battle_manager:tick_callback();
end;


function battle_manager:tick_callback()
	my_callback = false;

	while true do
		if #self.callback_list == 0 then
			break;
		end;
		if self.callback_list[1].calltime < timestamp_tick + 50 then
			my_callback = self.callback_list[1].callback;
			table.remove(self.callback_list, 1);
			my_callback();
		else
			break;
		end;
	end;

	bm:unregister_timer("battle_manager_tick_callback", true);
	if #self.callback_list > 0 then
		self:register_repeating_timer("battle_manager_tick_callback", self.callback_list[1].calltime - timestamp_tick, true);
	end;
end;


function battle_manager:dont_close_queue_advice()
	self.should_close_queue_advice = false;
end;


function battle_manager:queue_advisor(new_advisor_string, new_duration, new_is_debug)
	if not is_string(new_advisor_string) then
		self:out("ERROR :: queue_advisor called with non-string parameter (" .. tostring(new_advisor_string) .. "), cannot queue this!");
	end;
	
	if not is_number(new_duration) then
		new_duration = 0;
	end;
	
	new_is_debug = new_is_debug or false;

	local advisor_entry = {advisor_string = new_advisor_string, duration = new_duration, is_debug = new_is_debug};

	table.insert(self.advisor_list, advisor_entry);

	if not self.advice_is_playing then
		self:play_next_advice();
	end;
end;


function battle_manager:play_next_advice()
	if not self:advice_finished() then
		return false;
	end;
	
	if #self.advisor_list == 0 then
		if self.should_close_queue_advice then
			self:close_advisor();
		end;
		
		self.advice_is_playing = false;
		return false;
	end;
	
	self.advice_is_playing = true;
	
	-- play first bit of advice in the list
	if self.advisor_list[1].is_debug then
		self:show_advisor_message("", self.advisor_list[1].advisor_string);
	else
		self:show_advisor_message(self.advisor_list[1].advisor_string, "");
	end;
	
	if self.advisor_list[1].duration > 0 then
		self.advisor_force_playing = true;		
		self:register_callback(function() self.advisor_force_playing = false end, self.advisor_list[1].duration, "battle_manager_advisor_queue");
	end;
	
	-- remove first element in the table now that it's being played
	table.remove(self.advisor_list, 1);
	
	bm:register_callback(function() self:watch_advice_queue() end, 500, "battle_manager_advisor_queue");
end;


function battle_manager:watch_advice_queue()	
	-- if the current bit of advice has finished playing then wait a bit and try to play the next, else re-check in 500ms
	if self:advice_finished() and not self.advisor_force_playing then
		self:register_callback(function() self:play_next_advice() end, 2000, "battle_manager_advisor_queue");
	else
		self:register_callback(function() self:watch_advice_queue() end, 500, "battle_manager_advisor_queue");
	end;
end;


-- cancels any running or subsequent advice that may be queued
function battle_manager:stop_advisor_queue()
	self:close_advisor();
	self:remove_process("battle_manager_advisor_queue");
	self.advisor_queue = {};
	self.advice_is_playing = false;
	self.advisor_force_playing = false;
end;


--**	SAMPLE USAGE:
--**
--**	--create our battle and battle_manager objects

--**	battle = empire_battle:new();
--**	bm = battle_manager:new(battle, true);    --debug messages are on

--**	--register some timers

--**	battle:register_repeating_timer("Test_01", 3000);
--**	battle:register_repeating_timer("Test_01", 3000);     -- oops, this will fail if you try it with the standard battle object!

--**	bm:register_repeating_timer("Test_02", 3000);
--**	bm:register_repeating_timer("Test_02", 3000);         -- this won't fail

--**	Test_01_Counter = 0;

--**	function Test_01
--**      battle:out("Here's a message, no-one knows when it happened though");
--**      Test_01_Counter = Test_01_Counter + 1;
--**      if Test_01_Counter > 2 then
--**            battle:unregister_timer("Test_01");
--**            battle:unregister_timer("Test_01");       -- oops, this will fail again
--**      end;
--**	end;

--**	Test_02_Counter = 0;

--**	function Test_02
--**      bm:out("Here's a message, we know when it happened because it's timestamped!");
--**      Test_02_Counter = Test_02_Counter + 1;
--**      if Test_02_Counter > 2 then
--**            bm:unregister_timer("Test_02");
--**            bm:unregister_timer("Test_02");           -- this won't fail
--**      end;
--**	end;

--**	SAMPLE USAGE OUTPUT:
--**
--**	<0ms> Registering Timer Test_02
--**	Here's a message, no-one knows when it happened though
--**	<3000ms> Here's a message, we know when it happened because it's timestamped!
--**	Here's a message, no-one knows when it happened though
--**	<6000ms> Here's a message, we know when it happened because it's timestamped!
--**	Here's a message, no-one knows when it happened though
--**	<9000ms> Here's a message, we know when it happened because it's timestamped!
--**	Here's a message, no-one knows when it happened though
--**	<12000ms> Here's a message, we know when it happened because it's timestamped!

-----------------------------------------------
-----------------------------------------------

--**	SAMPLE WATCH USAGE:
--**
--**	--create our battle and battle_manager objects

--**	battle = empire_battle:new();
--**	bm = battle_manager:new(battle, true);

--**	-- GENERIC WATCH
--**
--**	bm:watch(function() return Unit_France_Artillery:position():distance(POS_East_Bridge_French_Side) < 10 end, 15000, function() Make_French_Artillery_Fire() end);
--**
--**	function Make_French_Artillery_Fire()
--**		--make the artillery do interesting stuff
--**	end;
--**
--**	-- The above script makes the battle manager watch the unit Unit_France_Artillery_01 (parameter #1).
--**	-- 15000ms (parameter #4) after the unit comes within 10m (parameter #3) of POS_East_Bridge_French_Side (parameter #2),
--**	-- the function "Make_French_Artillery_Fire()" is called. Notice the slightly wierd formatting of the final parameter -
--**	-- the name of your function must be given between "function()" and "end".
--**	-- The above call will make the French Artillery fire 15 seconds after it reaches the end of the bridge - enough time for it to stop
--**	-- and get itself oriented (hopefully)
--**
--**	-- parameters are: expression to watch, delay before triggering, code to call, optional name
--**
--**	-- Watch() can be used to monitor ANY boolean condition that
--**	-- might change throughout the battle - is this unit within range of that unit, has this building taken damage, is this unit routing etc. Rather than having to write a function
--**	-- for each of these and individually register them the conditions can be passed to the battle manager to watch.
--**
--**	-- the format of the first parameter can be a bit confusing, however. It needs to be of the form --- function() return Boolean_Expression end --- where Boolean_Expression can
--**	-- be evaluated to be true or false, either a boolean value (BOOL_Has_Prussian_Army_Crossed_Bridge) or expression (Town_Hall:health() < 50)


-----------------------------------------------
-----------------------------------------------

--**	SAMPLE WATCH CANCELLING:
--**
--**	-- if you register a watch with the optional name parameter:
--**
--**	bm:watch(function() return East_Bridge:health() < 25 end, 2000, function() Divert_AI_Flank_Attack() end, "Bridge Health Monitor");
--**
--**	-- you can cancel it later, before it fires:
--**
--**	bm:remove_process("Bridge Health Monitor");
--**
--**	-- this will remove any watch or callback that have yet to fire