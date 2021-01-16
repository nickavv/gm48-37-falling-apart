tilemap_clear(dirtLayer, 0);
for (var cellX = 0; cellX < (room_width div tile_width); cellX ++) {
	for (var cellY = 0; cellY < (room_height div tile_height); cellY ++) {
		// Automatically draw in the dirt tiles based on the arrangement of grass tiles
		var grassTile = tilemap_get(groundLayer, cellX, cellY);
		if (grassTile == stdGrass) {
			var dirtTile = stdDirt;
			if (tilemap_get(groundLayer, cellX, cellY + 1) == 0 &&
				tilemap_get(groundLayer, cellX, cellY + 2) == stdGrass) {
				dirtTile = darkDirt;	
			} else if (tilemap_get(groundLayer, cellX + 1, cellY + 1) == stdGrass) {
				dirtTile = leftCornerDirt;
			} else if (tilemap_get(groundLayer, cellX - 1, cellY + 1) == stdGrass) {
				dirtTile = rightCornerDirt;
			}
			tilemap_set(dirtLayer, dirtTile, cellX, cellY + 1);
		} else if (grassTile == brokenGrass) {
			tilemap_set(dirtLayer, brokenDirt, cellX, cellY + 1);
		}
		
		// Handle tile-break timer stuff
		if (tileBreakTimers[cellX, cellY] != -1) {
			tileBreakTimers[cellX, cellY] -= 1;
			if (tileBreakTimers[cellX, cellY] == 0) {
				tilemap_set(groundLayer, 0, cellX, cellY);
			}
		}
	}
}