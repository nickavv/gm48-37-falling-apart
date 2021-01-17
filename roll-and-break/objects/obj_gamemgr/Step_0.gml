phaseFrame += 1;
if (phase == gamePhase.playing) {
	timeRemaining -= 1;
} else if (phase == gamePhase.goal) {
	audio_stop_sound(music_level);	
} else if (phase == gamePhase.results) {
	if (check_input(ord("A"), gp_face1, true)) {
		if (phaseFrame < 220) {
			// Skip to end of results
			phaseFrame = 220;
		} else {
			// Record final level score into our totals
			array_push(levelScores, floor((timeRemaining / game_get_speed(gamespeed_fps)) * coinsCollected));
			// Go to next level
			room_goto(obj_level_data.nextLevel);
		}
	}
	if (check_input(ord("B"), gp_face2, true)) {
		// Restart current level
		room_restart();
	}
}