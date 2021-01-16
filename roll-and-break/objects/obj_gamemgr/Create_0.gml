display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT)

enum gamePhase {
	ready,
	playing,
	dying,
	goal
}
phase = gamePhase.ready;
lastPhase = phase;

phaseFrame = 0;