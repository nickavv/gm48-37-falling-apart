if (check_input(ord("A"), gp_face1, true) || check_input(vk_space, gp_start, true)) {
	instance_create_depth(0, 0, 0, obj_gamemgr);
	room_goto(rm_level_1);
}

titleFrame += 1;