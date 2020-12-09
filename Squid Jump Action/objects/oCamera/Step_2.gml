
if(instance_exists(oPlayer)){
	var _camX = camera_get_view_x(camera);
	var _camY = camera_get_view_y(camera);

	var _targetX = oPlayer.x - resWidth/resScale/2;
	var _targetY = oPlayer.y - resHeight/resScale/2;
	
	if(oPlayer.chargeingDash){
		_targetX += lengthdir_x(oPlayer.dashSpeed*6, oPlayer.dashDirection);
		_targetY += lengthdir_y(oPlayer.dashSpeed*6, oPlayer.dashDirection);
	}

	_targetX = clamp(_targetX, 0, room_width - resWidth/resScale);
	_targetY = clamp(_targetY, 0, room_height - resHeight/resScale);

	_camX = lerp(_camX, _targetX, cameraSmooth);
	_camY = lerp(_camY, _targetY, cameraSmooth);

	camera_set_view_pos(camera, _camX, _camY);
	
}
else{
	camera_set_view_pos(camera, 0, 0);
}