display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT)

enum gamePhase {
	ready,
	playing,
	dying,
	goal,
	results
}
phase = gamePhase.ready;
lastPhase = phase;

phaseFrame = 0;

coinsCollected = 0;
timeRemaining = 0;

levelScores = [];

function drawGameHud() {
	for (var i = 0; i < 3; i++) {
		var coinIcon = spr_ui_coin_got;
		if (coinsCollected < i + 1) {
			coinIcon = spr_ui_coin_slot;
		}
		draw_sprite(coinIcon, 0, 24 + (96 * i), 24);
	}
	
	draw_sprite(spr_ui_stopwatch, 0, SCREEN_WIDTH - 144, 24);
	draw_set_font(font_timer);
	draw_set_color(make_color_rgb(41,35,53));
	if (timeRemaining < 300) {
		draw_set_color(make_color_rgb(134, 43, 43));
	}
	draw_set_halign(fa_center);
	draw_text_transformed(SCREEN_WIDTH - 76, 52, 
			string_format(timeRemaining / game_get_speed(gamespeed_fps), 2, 1),
			1, 1, -18);
	draw_set_halign(fa_left);
}