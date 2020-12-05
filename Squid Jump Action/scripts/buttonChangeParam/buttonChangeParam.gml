// -4はnooneとして使うので使わないこと
function buttonChangeParam(_number, _x, _y, _alpha, _destroy, _drawEvent){
	
	//numberを特定
	var _findedNumber, _tempId
	var _findedId = noone;
	var _buttonQuantity = instance_number(oButton);
	for(var i=0; i<_buttonQuantity; i++){
		_tempId = instance_find(oButton, i)
		_findedNumber = _tempId.buttonNumber;
		if(_findedNumber = _number){
			_findedId = _tempId;
			break;
		}
	}
	
	if(_findedId != noone){
		if(_x != noone){
			_findedId.buttonScreenX = _x;
		}
		if(_y != noone){
			_findedId.buttonScreenY = _y;
		}
		if(_alpha != noone){
			_findedId.buttonAlpha = _alpha;
		}
		if(_destroy){
			instance_destroy(_findedId);
		}
		if(_drawEvent != noone){
			_findedId.buttonDrawEvent = _drawEvent;
		}
	}
}