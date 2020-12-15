
function createItem(_object, _inCamera){
	var _sprWidth = sprite_get_width(object_get_sprite(_object));
	var _sprHeight = sprite_get_height(object_get_sprite(_object));
	var _cameraY = camera_get_view_y(oCamera.camera);
	var _cameraHeight = camera_get_view_height(oCamera.camera);
	
	if(_inCamera){
		var _y = irandom_range(_cameraY, _cameraY+_cameraHeight)
	}
	else{
		var _hoge = GROUNDPOS - _cameraHeight - _sprHeight;//カメラ外の範囲の高さ (正確には_sprHeight/2 + _sprHeihgt/2)
		var _hogehoge = irandom(_hoge);//カメラ外の範囲からランダムに一つ決定
		
		if(_hogehoge < _cameraY){
			//生成する場所がカメラより上の場合
			var _y = _hogehoge + _sprHeight/2;
		}
		else{
			//生成する場所がカメラより下
			var _y = _cameraY + _cameraHeight + _hogehoge;
		}
	}
	instance_create_layer(room_width+_sprWidth, _y, "GameObjects", _object);
	
}