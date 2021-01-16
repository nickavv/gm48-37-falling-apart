tileBreakTimers = array_create(room_width div tile_width);
for (var i = 0; i < array_length(tileBreakTimers); i++) {
	tileBreakTimers[i] = array_create(room_height div tile_height, -1);
}
tileBreakTime = 40;

// Standard tile layers
groundLayer = layer_tilemap_get_id(layer_get_id("Tiles_Ground"));
dirtLayer = layer_tilemap_get_id(layer_get_id("Tiles_Dirt"));

// Indicies of interesting tiles
stdGrass = 2;
stdDirt = 10;
leftCornerDirt = 5;
rightCornerDirt = 7;
darkDirt = 22;
brokenGrass = 38;
brokenDirt = 42;

function markTileAsBroken(tileX, tileY) {
	tileBreakTimers[tileX, tileY] = tileBreakTime;
	tilemap_set(groundLayer, brokenGrass, tileX, tileY);
}