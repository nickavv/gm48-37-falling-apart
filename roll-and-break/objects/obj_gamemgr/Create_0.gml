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

connectedGamepads = [];
xAxisHeld = false;
yAxisHeld = false;

coinsCollected = 0;

function drawGameHud() {
	for (var i = 0; i < 3; i++) {
		var coinIcon = spr_ui_coin_got;
		if (coinsCollected < i + 1) {
			coinIcon = spr_ui_coin_slot;
		}
		draw_sprite(coinIcon, 0, 24 + (96 * i), 24);
	}
}