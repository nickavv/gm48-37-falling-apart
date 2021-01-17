phaseFrame += 1;
if (phase == gamePhase.playing) {
	timeRemaining -= 1;
} else if (phase == gamePhase.results) {
	if (check_input(ord("A"), gp_face1, true)) {
		if (phaseFrame < 220) {
			// Skip to end of results
			phaseFrame = 220;
		} else {
			// Go to next level
			room_goto(obj_level_data.nextLevel);
		}
	}
}