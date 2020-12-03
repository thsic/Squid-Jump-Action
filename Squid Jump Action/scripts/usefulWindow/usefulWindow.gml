function usefulWindow(_spritePath, _windowNumber, _winX, _winY, _width, _height, _sprScale, _sprAlpha) {
	/*ウディタの万能ウィンドウっぽいやつ
	-------------注意-------------
	3の倍数のスプライトでないとバグるかも 
	drawイベントの中に置きましょう
	surfaceを使っている
	createイベントで先に "global.usefulwindow_surface[0] = noone" と書いておく必要がある
	要らなくなったら "surface_free(global.usefulwindow_surface[0])" と書いておく
	------------------------------*/
	/*_windowNumberメモ
	0 gameoverWindow
	*/


	if(!surface_exists(global.usefulwindow_surface[_windowNumber]))//surfaceが作られていないなら作る
	{
		//仮のsurface作成(ここから抜き取ってウィンドウを描画する)
		var _tempSurface = surface_create(sprite_get_width(_spritePath)*_sprScale,sprite_get_height(_spritePath)*_sprScale)
		global.usefulwindow_surface[_windowNumber] = surface_create(_width,_height)//ウィンドウを描画するsurface
		surface_set_target(_tempSurface);//仮セット
		draw_clear_alpha(c_black, 0);//黒塗りで初期化 とりあえずなので表示が変だったら抜け
		draw_sprite_ext(_spritePath,0,0,0,_sprScale,_sprScale,0,c_white,_sprAlpha)//仮の方にウィンドウ描画
		surface_reset_target()//仮タイム終了
	
		var _spriteWidthDiv3 = sprite_get_width(_spritePath)/3*_sprScale//スプライトのwidthを3で割った値
		var _spriteHeightDiv3 = sprite_get_height(_spritePath)/3*_sprScale//スプライトのheightを3で割った値
	
		surface_set_target(global.usefulwindow_surface[_windowNumber])//ウィンドウの方セット
		//順番に左上、右上、左下、右下
		draw_surface_part(_tempSurface,0,0,_spriteWidthDiv3,_spriteHeightDiv3,0,0)//左上
		draw_surface_part(_tempSurface,_spriteWidthDiv3*2,0,_spriteWidthDiv3,_spriteHeightDiv3,_width-_spriteWidthDiv3,0)//右上
		draw_surface_part(_tempSurface,0,_spriteHeightDiv3*2,_spriteWidthDiv3,_spriteHeightDiv3,0,_height-_spriteHeightDiv3)//左下
		draw_surface_part(_tempSurface,_spriteWidthDiv3*2,_spriteHeightDiv3*2,_spriteWidthDiv3,_spriteHeightDiv3,_width-_spriteWidthDiv3,_height-_spriteHeightDiv3)//右下
		//順番に中央上、中央下、中央左、中央右
		draw_surface_part_ext(_tempSurface,_spriteWidthDiv3,0,_spriteWidthDiv3,_spriteHeightDiv3,_spriteWidthDiv3,0,(_width-_spriteWidthDiv3*2)/_spriteWidthDiv3,1,c_white,1)//最後のscaleのやつはwindowのでかさを求めてそこから角の分のdiv3*2を除いてそれをscale=1の時の値で割って完璧な長さにする
		draw_surface_part_ext(_tempSurface,_spriteWidthDiv3,_spriteHeightDiv3*2,_spriteWidthDiv3,_spriteHeightDiv3,_spriteWidthDiv3,_height-_spriteHeightDiv3,(_width-_spriteWidthDiv3*2)/_spriteWidthDiv3,1,c_white,1)
		draw_surface_part_ext(_tempSurface,0,_spriteHeightDiv3,_spriteWidthDiv3,_spriteHeightDiv3,0,_spriteHeightDiv3,1,(_height-_spriteHeightDiv3*2)/_spriteHeightDiv3,c_white,1)
		draw_surface_part_ext(_tempSurface,_spriteWidthDiv3*2,_spriteHeightDiv3,_spriteWidthDiv3,_spriteHeightDiv3,_width-_spriteWidthDiv3,_spriteHeightDiv3,1,(_height-_spriteHeightDiv3*2)/_spriteHeightDiv3,c_white,1)
		//中央
		draw_surface_part_ext(_tempSurface,_spriteWidthDiv3,_spriteHeightDiv3,_spriteWidthDiv3,_spriteHeightDiv3,_spriteWidthDiv3,_spriteHeightDiv3,(_width-_spriteWidthDiv3*2)/_spriteWidthDiv3,(_height-_spriteHeightDiv3*2)/_spriteHeightDiv3,c_white,1)//ながい
	
		surface_reset_target()//開放
		surface_free(_tempSurface)//仮の方はもう使わないので破棄
		draw_surface(global.usefulwindow_surface[_windowNumber],_winX,_winY);
	}
	else//既に作られているなら
	{
		draw_surface(global.usefulwindow_surface[_windowNumber],_winX,_winY);
	}
}