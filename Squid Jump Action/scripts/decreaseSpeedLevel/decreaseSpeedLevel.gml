
function decreaseSpeedLevel(_decreaseLevel){
	global.speedLevel -= _decreaseLevel;
	if(global.speedLevel < 1){
		global.speedLevel = 1;
	}
	
}