if (sprite_index == spr_caterpillar_turn_l || sprite_index == spr_caterpillar_turn_r) {
	facingRight = !facingRight;
	sprite_index = facingRight ? spr_caterpillar_walk_r : spr_caterpillar_walk_l;
}