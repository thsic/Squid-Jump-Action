


for(var i=0; i<ds_grid_height(bgObjParam); i++){
	if(bgObjParam[# BGOBJPARAM.ENABLED, i]){
		var _sprite = bgObjParam[# BGOBJPARAM.SPRITE, i];
		var _X = bgObjParam[# BGOBJPARAM.X, i];
		var _Y = bgObjParam[# BGOBJPARAM.Y, i];
		var _scale = bgObjParam[# BGOBJPARAM.SCALE, i];
		
		
		draw_sprite_ext(_sprite, 0, _X, _Y, _scale, _scale, 0, c_white, _scale);
		
		
		
	}
}
