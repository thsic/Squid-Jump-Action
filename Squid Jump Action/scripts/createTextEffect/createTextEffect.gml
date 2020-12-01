// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createTextEffect(_x, _y, _sequenceId, _sequenceType, _useDrawGui, _text, _color, _font){
	
	var _sequenceElement = noone;
	
	switch(_sequenceType){
	case 0:
		//レベルアップ時の
		_sequenceElement = levelUpSequenceElement;
	break
	case 1:
	
	break
	case 2:
	
	break
	}
	
	//シーケンス生成
	if(!layer_sequence_exists("Effects", _sequenceElement)){
		var _sequenceElement = layer_sequence_create("Effects", _x, _y, sqLevelUpEffect);
		layer_sequence_play(_sequenceElement);
		
		//インスタンス生成
		var _baseInst = instance_create_layer(_x, _y, "Effects", oTextEffect);
		with(_baseInst){
			useDrawGui = _useDrawGui;
			text = _text;
			color = _color;
			font = _font;
			sequenceElement = _sequenceElement;
			
		}
		
		var _seqInst = layer_sequence_get_instance(_sequenceElement);
		sequence_instance_override_object(_seqInst, oTextEffect, _baseInst);
	}
	
	switch(_sequenceType){
	case 0:
		levelUpSequenceElement = _sequenceElement;
	break
	case 1:
	
	break
	case 2:
	
	break
	}

}