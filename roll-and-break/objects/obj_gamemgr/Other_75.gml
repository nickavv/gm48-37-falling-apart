switch(async_load[? "event_type"]) {
	case "gamepad discovered":
		var newId = async_load[? "pad_index"];
		if (gamepad_is_connected(newId)) {
			echo ("Connected controller: %s", gamepad_get_description(newId));
			connectedGamepads[array_length(connectedGamepads)] = newId;
		}
		break;
}