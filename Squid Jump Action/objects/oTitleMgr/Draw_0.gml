
//市場後ろの背景
var _topSideColor = bgColor1;
var _downSideColor = bgColor2;

draw_rectangle_color(0, 0, room_width, room_height, 
_topSideColor, _topSideColor, _downSideColor, _downSideColor, false);



//bg
for(var i=0; i<ds_grid_height(bgObjParam); i++){
	if(bgObjParam[# TITLEBGPARAM.ENABLED, i]){
		var _sprite = bgObjParam[# TITLEBGPARAM.SPRITE, i];
		var _X = bgObjParam[# TITLEBGPARAM.X, i];
		var _Y = bgObjParam[# TITLEBGPARAM.Y, i];
		
		draw_sprite_ext(_sprite, 0, _X, _Y, 1, 1, 0, c_white, 1);

	}
}

var _logoX = room_width/2;
var _logoY = room_height*0.3 + sin(current_time/530) * 3;
var _dir = cos(current_time/1460) * 2;
draw_sprite_ext(sTitleLogo, 0, _logoX, _logoY, 1, 1, _dir, c_white, 1);
