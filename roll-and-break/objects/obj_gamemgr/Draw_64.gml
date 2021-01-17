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
	
	if (phaseFrame > 160) {
		phase = gamePhase.results;
	}
} else if (phase == gamePhase.dying) {
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
} else if (phase == gamePhase.results) {
	draw_set_alpha(min(1, phaseFrame/30));
	draw_sprite(spr_result_screen_bg, 0, 0, 0);
	
	if (phaseFrame >= 60) {
		for (var i = 0; i < 3; i++) {
			if (phaseFrame >= (60 + (20 * i))) {
				var coinIcon = spr_ui_coin_got;
				var sfx = sound_coin;
				if (coinsCollected < i + 1) {
					coinIcon = spr_ui_coin_slot;
					sfx = sound_whiff;
				}
				if (phaseFrame == (60 + (20 * i))) {
					audio_play_sound(sfx, 1, false);
				}
				draw_sprite(coinIcon, 0, SCREEN_W_HALF - 140 + (96 * i), SCREEN_H_HALF - 170);
			}
		}
	}
	
	if (phaseFrame == 120 && coinsCollected == 3) {
		audio_play_sound(sound_vo_great, 1, false);
	}
	
	if (phaseFrame > 140) {
		var mPhaseFrame = phaseFrame - 140;
		draw_set_font(font_results);
		draw_set_color(c_white);
		draw_text(300, 390, "Time Remaining: ");
		var displayTime = min(mPhaseFrame * 30, timeRemaining);
		draw_text(560, 390, string_format(displayTime / game_get_speed(gamespeed_fps), 2, 1));
	}
	
	if (phaseFrame > 200) {
		var totalScore = floor((timeRemaining / game_get_speed(gamespeed_fps)) * coinsCollected);
		draw_text(300, 440, "Level Score: " + string(totalScore));
	}
	
	if (phaseFrame > 220) {
		draw_set_halign(fa_center);
		draw_set_font(font_timer);
		draw_text(SCREEN_W_HALF, 600, "PRESS A TO CONTINUE");
		draw_text(SCREEN_W_HALF, 640, "PRESS B TO RETRY");
		draw_set_halign(fa_left);
	}
} else if (phase == gamePhase.playing) {
	drawGameHud();
}