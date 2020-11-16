// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createRiseEffect(_x, _y, _height, _time, _text, _type){
	
	with(instance_create_layer(_x, _y, "Effects", oRiseNumberEffect)){
		riseHeight = _height;
		lifeTimeBase = _time;
		remainLifeTime = _time;
		text = _text;
		effectType = _type;
		
	}
	
}