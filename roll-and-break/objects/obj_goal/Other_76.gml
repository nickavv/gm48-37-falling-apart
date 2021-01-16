switch (event_data[? "message"]) {
	case "broke": sprite_index = spr_goal_broke;
				  obj_roland.state = rolandState.goal;
				  break;
}