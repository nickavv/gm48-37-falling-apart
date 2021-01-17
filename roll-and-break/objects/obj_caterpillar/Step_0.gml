if (sprite_index == spr_caterpillar_walk_r) {
	phy_speed_x = moveSpeed;
	var nextTile = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("Tiles_Ground")), x + (sprite_width/2), y);
	if (nextTile == 0) {
		image_index = 0.1;
		sprite_index = spr_caterpillar_turn_r;
	}
} else if (sprite_index == spr_caterpillar_walk_l) {
	phy_speed_x = -moveSpeed;
	var nextTile = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("Tiles_Ground")), x - (sprite_width/2), y);
	if (nextTile == 0) {
		image_index = 0.1;
		sprite_index = spr_caterpillar_turn_l;
	}
} else {
	phy_speed_x = 0;
}