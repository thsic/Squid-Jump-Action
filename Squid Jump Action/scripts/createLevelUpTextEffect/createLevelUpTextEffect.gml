// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createLevelUpTextEffect(_time, _level){
	with(instance_create_layer(0, 0, "UI", oLevelUpText)){
		time = _time;
		timeBase = _time;
		drawLevel = _level;
	}
}