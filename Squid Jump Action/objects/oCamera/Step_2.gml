
var _camX = camera_get_view_x(camera);
var _camY = camera_get_view_y(camera);

var _targetX = oPlayer.x - resWidth/2;
var _targetY = oPlayer.y - resHeight/2;

_targetX = clamp(_targetX, 0, room_width - resWidth);
_targetY = clamp(_targetY, 0, room_height - resHeight);

_camX = lerp(_camX, _targetX, cameraSmooth);
_camY = lerp(_camY, _targetY, cameraSmooth);

camera_set_view_pos(camera, _camX, _camY);
