// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gainTempSpeed(_gainSpeed){
	//加算
	global.tempSpeedLevel += _gainSpeed;
	
	//上限設定
	if(global.speedLevel + global.tempSpeedLevel >= TEMPSPEEDMAX){
		global.tempSpeedLevel = TEMPSPEEDMAX-global.speedLevel;
	}
}