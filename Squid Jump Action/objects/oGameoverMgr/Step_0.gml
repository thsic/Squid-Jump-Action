
gameoverTime++;

var _cameraW = camera_get_view_width(oCamera.camera);
var _cameraH = camera_get_view_height(oCamera.camera);

if(gameoverTime = 150){
	var _buttonY = _cameraH*0.8;
	var _titleButtonX = _cameraW*0.3;
	var _retryButtonX = _cameraW*0.7;
	
	createButton(sRetryButton, _titleButtonX, _buttonY, backToTitle);
	createButton(sRetryButton, _retryButtonX, _buttonY, doRetry);
	
}
