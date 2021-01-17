if (phase == gamePhase.ready) {
	var msgY = SCREEN_H_HALF;
	if (phaseFrame < 20) {
		msgY = lerp(-150, SCREEN_H_HALF, phaseFrame/20);
	} else if (phaseFrame > 70) {
		msgY = lerp(SCREEN_H_HALF, SCREEN_HEIGHT + 150, (phaseFrame - 70)/30);
	}
	if (phaseFrame == 20) {
		audio_play_sound(sound_vo_ready, 1, false);
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
		msgY = lerp(SCREEN_H_HALF, SCREEN_HEIGHT + 150, (phaseFrame - 90)/30);
	}
	if (phaseFrame == 20) {
		audio_play_sound(sound_vo_goal, 1, false);
	}
	draw_sprite(spr_ui_goal, 0, SCREEN_W_HALF, msgY);
} else if (phase = gamePhase.dying) {
	var msgAY = SCREEN_H_HALF;
	var msgBY = SCREEN_H_HALF;
	// Too
	if (phaseFrame < 30) {
		msgAY = lerp(-150, SCREEN_H_HALF, phaseFrame/30);
	} else if (phaseFrame > 90) {
		msgAY = lerp(SCREEN_H_HALF, SCREEN_HEIGHT + 150, (phaseFrame - 90)/60);
	}
	draw_sprite(spr_ui_go_too, 0, SCREEN_WIDTH * 0.33, msgAY);
	// Bad
	var mPhaseFrame = max(0, phaseFrame - 40);
	if (mPhaseFrame < 30) {
		msgBY = lerp(-150, SCREEN_H_HALF, mPhaseFrame/30);
	} else if (phaseFrame > 90) {
		msgBY = lerp(SCREEN_H_HALF, SCREEN_HEIGHT + 150, (phaseFrame - 90)/60);
	}
	draw_sprite(spr_ui_go_bad, 0, SCREEN_WIDTH * 0.66, msgBY);
	
	if (phaseFrame == 20) {
		audio_play_sound(sound_vo_fall, 1, false);
	}
	
	if (phaseFrame > 220) {
		phase = gamePhase.ready;
		room_restart();
	}
}