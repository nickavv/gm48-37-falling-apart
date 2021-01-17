endFrame = 0;
levelScores = [];
array_copy(levelScores, 0, obj_gamemgr.levelScores, 0, array_length(obj_gamemgr.levelScores));
instance_destroy(obj_gamemgr);
audio_stop_all();