//仮スピード
function decreaseTempSpeedLevel(_decreaseLevel){
	global.tempSpeedLevel -= _decreaseLevel;
	if(global.tempSpeedLevel <= 0){
		global.tempSpeedLevel = 0;
	}
	
}