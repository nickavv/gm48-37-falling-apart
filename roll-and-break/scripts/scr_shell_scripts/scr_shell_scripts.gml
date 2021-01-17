function sh_goto_level(args) {
	var roomId = asset_get_index(args[1]);
	if (roomId == -1) {
		return "No room with that name exists!";
	}

	room_goto(roomId);
}
function meta_goto_level() {
	var rooms = [];
	var r = 0;
	while (room_exists(r)) {
		array_push(rooms,room_get_name(r));
		r += 1;
	}
	return {
		arguments: ["levelName"],
		suggestions: [rooms]
	}
}