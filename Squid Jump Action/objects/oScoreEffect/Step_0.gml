
effectTime++;

if(effectTime > effectTotalTime){
	instance_destroy();
	global.scoreSurfDrawing[surfaceNumber] = false;
}