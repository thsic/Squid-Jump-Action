// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function isInRange(_min, _max, _var){
	var _result = false;
	if(_min <= _var and _var <= _max){
		_result = true;
	}
	return _result
}