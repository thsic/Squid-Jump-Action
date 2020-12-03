// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function isInPlace(_x1, _y1, _x2, _y2, _targetX, _targetY){
	if(_x1 <= _targetX and _targetX <= _x2 and _y1 <= _targetY and _targetY <= _y2){
		return true
	}
	else{
		return false
	}
}

