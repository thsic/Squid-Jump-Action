
function drawSea(){
	
	draw_set_alpha(0.2);
	draw_set_color(c_aqua);
	draw_rectangle(0, SEALEVEL, room_width, room_height, false)
	drawSetDefault();
	
}

function drawSeaLevel(){
	
	/*if(oPlayer.y > SEALEVEL){
		var _sealevelSprite = sSealevel;
	}
	else{
		var _sealevelSprite = sSealevel;
	}
	
	var _spriteWidth = sprite_get_width(_sealevelSprite);
	var _playerDepthRatio = (oPlayer.y-SEALEVEL) / 256;
	var _spriteQuantity = ceil(room_height/_spriteWidth);
	for(var i=0; i<_spriteQuantity; i++){
		var _spriteX = i * _spriteWidth;
		draw_sprite_ext(_sealevelSprite, 0, _spriteX, SEALEVEL, 1, clamp(_playerDepthRatio, 0, 1), 0, c_white, 0.4);
	}*/
}




