// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createFade(_rm, _fdInTime, _fdOutTime, _rmChangeTime, _betweenFrame, _recQuantity, _anim, _ty, _by, _lx, _rx, _col){
	with(instance_create_layer(0, 0, "Fade", oFade)){
		
		gotoRoom = _rm;
		fadeInTotalTime = _fdInTime;
		fadeOutTotalTime = _fdOutTime;
		betweenFrame = _betweenFrame;
		rectangleQuantity = _recQuantity;
		animCurve = _anim;
		leftTopY = _ty;
		leftBottomY = _by;
		leftX = _lx;
		rightX = _rx;
		roomChangeTotalTime = _rmChangeTime;
		rectangleColor = _col
		
	}
}