
if(layer_sequence_is_finished(sequenceElement)){
	//シーケンス終わったら消す
	layer_sequence_destroy(sequenceElement);
	instance_destroy();
}

if(sequenceLengthDefault = noone){
	sequenceLengthDefault = layer_sequence_get_length(sequenceElement);
	sequenceLifeTime = sequenceLengthDefault;
}
else{
	sequenceLifeTime--;
}

if(useDrawGui){
	var _cameraWidth = camera_get_view_width(oCamera.camera);
	var _cameraHeight = camera_get_view_height(oCamera.camera);
	var _sqX = camera_get_view_x(oCamera.camera) ;
	var _sqY = camera_get_view_y(oCamera.camera);
	layer_sequence_x(sequenceElement, _sqX);
	layer_sequence_y(sequenceElement, _sqY);
}

/*if(!layer_sequence_exists("Effects", sequenceElement)){
	
	sequenceElement = layer_sequence_create("Effects", x, y, sqLevelUpEffect);
	layer_sequence_play(sequenceElement);
	
}
