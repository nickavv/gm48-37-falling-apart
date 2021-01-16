switch (event_data[? "message"]) {
	case "start_rolling": state = rolandState.rolling; 
						  // Apply a force downward to get the ball rolling
				     	  physics_apply_local_force(0, 0, 0, 3 * rollForce);
						  break;
}