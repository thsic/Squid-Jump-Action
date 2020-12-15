// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function decreaseSpeedLevel(_decreaseLevel){
	global.speedLevel -= _decreaseLevel;
	if(global.speedLevel < 1){
		global.speedLevel = 1;
	}
}