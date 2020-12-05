
var _rectangleMoveTime = fadeInTotalTime - betweenFrame*rectangleQuantity;
var _rectangleHeight = (leftBottomY - leftTopY) / rectangleQuantity;
var _rectangleWidth = rightX - leftX;
var _x, _y, _width, _height, _rectangleMovePer, _channel;

draw_set_color(rectangleColor);

switch(fadeState){
case FADESTATE.FADEIN:
	for(var i=0; i<rectangleQuantity; i++){
	
		_x = leftX;
		_y = leftTopY + i*_rectangleHeight;
		_height = _rectangleHeight;
	
		//四角のwidthを計算
		_rectangleMovePer = (fadeInTime-betweenFrame*i) / (_rectangleMoveTime);
	
		//animcurveにいれる
		_channel = animcurve_get_channel(animCurve, 0);
	
		//widthにする
		_width = _rectangleWidth * animcurve_channel_evaluate(_channel, _rectangleMovePer);
		draw_rectangle(_x, _y, _x+_width, _y+_height, false);
	
	}
break
case FADESTATE.ROOMCHANGETIME:
	draw_rectangle(leftX, leftTopY, rightX, leftBottomY, false);
break
case FADESTATE.FADEOUT:
//ほぼfadeinとおなじ
	for(var i=0; i<rectangleQuantity; i++){
	
		_x = rightX;
		_y = leftTopY + i*_rectangleHeight;
		_height = _rectangleHeight;
	
		//四角のwidthを計算
		_rectangleMovePer = (fadeOutTime-betweenFrame*i) / (_rectangleMoveTime);
	
		//animcurveにいれる
		_channel = animcurve_get_channel(animCurve, 0);
	
		//widthにする
		_width = _rectangleWidth * (1-animcurve_channel_evaluate(_channel, _rectangleMovePer));
		draw_rectangle(_x-_width, _y, _x, _y+_height, false);
	
	}
break

}
