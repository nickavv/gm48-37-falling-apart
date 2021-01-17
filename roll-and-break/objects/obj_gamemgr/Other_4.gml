/// @description New Room Stuff

// Singleton, don't let other instances of me exist
if (instance_number(object_index) > 1) {
	instance_destroy();
} else {
	obj_shell.depth = 0;
	phase = gamePhase.ready;
	lastPhase = phase;
	phaseFrame = 0;
	coinsCollected = 0;
	timeRemaining = obj_level_data.parSeconds * game_get_speed(gamespeed_fps);
	if (!audio_is_playing(music_level)) {
		audio_play_sound(music_level, 1, true);
	}
}