// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createButton(_sprite, _x, _y, _script, _number, _drawEvent){
	
	//中心座標を左上座標に直す
	var _xx = _x - sprite_get_width(_sprite)/2;
	var _yy = _y - sprite_get_height(_sprite)/2;
	
	//ボタン生成
	with(instance_create_layer(_xx, _yy, "UI", oButton)){
		buttonSprite = _sprite;
		buttonScript = _script;
		buttonScreenX = _xx;
		buttonScreenY = _yy;
		buttonNumber = _number;
		buttonDrawEvent = _drawEvent;
	}
}