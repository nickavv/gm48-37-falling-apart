if (phase == gamePhase.ready) {
	var msgY = SCREEN_H_HALF;
	if (phaseFrame < 20) {
		msgY = lerp(-150, SCREEN_H_HALF, phaseFrame/20);
	} else if (phaseFrame > 70) {
		msgY = lerp(SCREEN_H_HALF, SCREEN_HEIGHT + 150, (phaseFrame - 70)/90);
	}
	draw_sprite(spr_ui_ready, 0, SCREEN_W_HALF, msgY);
	if (phaseFrame > 90) {
		phase = gamePhase.playing;
	}
} else if (phase == gamePhase.goal) {
	var msgY = SCREEN_H_HALF;
	if (phaseFrame < 40) {
		msgY = lerp(-150, SCREEN_H_HALF, phaseFrame/40);
	} else if (phaseFrame > 90) {
		msgY = lerp(SCREEN_H_HALF, SCREEN_HEIGHT + 150, (phaseFrame - 90)/120);
	}
	draw_sprite(spr_ui_goal, 0, SCREEN_W_HALF, msgY);
}