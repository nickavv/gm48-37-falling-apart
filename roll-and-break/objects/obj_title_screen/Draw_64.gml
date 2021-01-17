var endSpotX = 650;
var endSpotY = 60;

var leftRatio = min(1, titleFrame/30);
draw_set_alpha(leftRatio);
draw_sprite(spr_logo_left, 0, lerp(SCREEN_W_HALF, endSpotX, leftRatio), endSpotY);

var rightRatio = clamp((titleFrame - 30)/30, 0, 1);
draw_set_alpha(rightRatio);
draw_sprite(spr_logo_right, 0, lerp(SCREEN_WIDTH, endSpotX, rightRatio), endSpotY);

draw_set_alpha(1);

if (titleFrame > 60) {
	draw_set_font(font_timer);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_text(SCREEN_W_HALF, 605, "PRESS A TO START");
	draw_set_color(c_white);
	draw_text(SCREEN_W_HALF, 600, "PRESS A TO START");
	draw_set_halign(fa_left);
}