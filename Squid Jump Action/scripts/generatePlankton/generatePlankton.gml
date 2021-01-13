// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generatePlankton(_levelPoint, _x, _y){
	
	var _planktonLevelPointBase = 3;
	var _planktonNumber = floor(_levelPoint/_planktonLevelPointBase);
	var _lastPlanktonLevelPoint = _levelPoint mod _planktonLevelPointBase + _planktonLevelPointBase;
	var _leaveSpeed = 1;
	
	for(var i=0; i<_planktonNumber; i++){
		var _dir = irandom(360);
		var _leaveTime = irandom_range(20, 40);
		var _leaveSpeed = random_range(0.6, 1.5);
		with(instance_create_layer(_x, _y, "GameObjects", oPlankton)){
			leaveToPlayerTime = _leaveTime;
			leaveToPlayerTimeBase = _leaveTime;
			leaveEnable = true;
			leaveDirection = _dir;
			leaveSpeedBase = _leaveSpeed;
			
			if(i=0){
				levelPoint = _lastPlanktonLevelPoint//一体だけレベルポイントがちょっと多い 端数
			}
		}
	}
}