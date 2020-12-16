
function createItem(_object, _inCamera){
	var _sprWidth = sprite_get_width(object_get_sprite(_object));
	var _sprHeight = sprite_get_height(object_get_sprite(_object));
	var _cameraY = camera_get_view_y(oCamera.camera);
	var _cameraHeight = camera_get_view_height(oCamera.camera);
	
	if(_inCamera){
		if(_cameraY+_cameraHeight > GROUNDPOS){
			var _y = irandom_range(_cameraY+_sprHeight/2, GROUNDPOS-_sprHeight/2);//地面より下には生成しない
		}
		else{
			var _y = irandom_range(_cameraY+_sprHeight/2, _cameraY+_cameraHeight-_sprHeight/2);
		}
		
	}
	else{
		var _hoge = GROUNDPOS - _cameraHeight - _sprHeight;//カメラ外の範囲の高さ (正確には_sprHeight/2 + _sprHeihgt/2)
		var _hogehoge = irandom(_hoge);//カメラ外の範囲からランダムに一つ決定
		
		if(_hogehoge < _cameraY+_sprHeight/2){
			//生成する場所がカメラより上の場合
			var _y = _hogehoge + _sprHeight/2;
		}
		else{
			//生成する場所がカメラより下
			var _y = _cameraHeight + _hogehoge + _sprHeight/2;
		}
	}
	instance_create_layer(room_width+_sprWidth, _y, "Items", _object);
	
}