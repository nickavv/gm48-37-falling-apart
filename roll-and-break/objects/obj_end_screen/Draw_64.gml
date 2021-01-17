draw_set_alpha(min(1, endFrame/30));
draw_sprite(spr_results_end_bg, 0, 0, 0);

draw_set_font(font_results);
draw_set_halign(fa_center);
var runningTotal = 0;
for (var i = 0; i < array_length(levelScores); i++) {
	draw_text(SCREEN_W_HALF + 224, 160 + (40 * i), "Level " + string(i + 1) + ": " + string(levelScores[i]));
	runningTotal += levelScores[i];
}

draw_text(SCREEN_W_HALF + 224, 500, "Total Score");
draw_set_font(font_timer);
draw_text(SCREEN_W_HALF + 224, 540, string(runningTotal));


draw_text(SCREEN_W_HALF + 224, 640, "PRESS A TO REPLAY");
draw_set_halign(fa_left);

draw_set_alpha(1);