function echo(debugString) {
	var result = debugString;
	if (argument_count > 1) {
		for (var i = 1; i < argument_count; i++) {
			result = string_replace(result, "%s", string(argument[i]));
		}
	}
	show_debug_message(result);
}