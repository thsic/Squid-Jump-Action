
//多分色んなゲームで使える
fadeInTime = 0;
fadeOutTime = 0;
roomChangeTime = 0;

betweenFrame = 2;
fadeInTotalTime = 30;
fadeOutTotalTime = 30;
roomChangeTotalTime = 5;
rectangleQuantity = 4;

leftTopY = 0;
leftBottomY = 0;
leftX = 0;
rightX = 0;

animCurve = acFadeIn;
rectangleColor = c_black

gotoRoom = noone;
global.drawingFade = true

fadeState = FADESTATE.FADEIN;

enum FADESTATE{
	FADEIN,
	ROOMCHANGETIME,
	FADEOUT,
}
