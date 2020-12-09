//起動時
random_set_seed(date_current_datetime());
randomize();

instance_create_layer(0, 0, "Instances", oCamera);

if(debug_mode){
	instance_create_layer(0, 0, "Instances", oDebugMgr);
}

global.drawingFade = false;

room_goto(FIRSTROOM);

