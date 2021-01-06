// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function doRetry(){
	var _camera = oCamera.camera;
	var _s = oCamera.resScale;
	createFade(MAINROOM, 20, 20, 0, 2, 4, acFadeIn, 0, 
	camera_get_view_height(_camera)*_s, 0, camera_get_view_width(_camera)*_s, c_black);
}