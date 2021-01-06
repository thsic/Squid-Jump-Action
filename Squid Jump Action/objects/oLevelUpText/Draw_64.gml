
draw_set_color(c_white);
draw_set_alpha(alpha);
draw_set_font(foYasa24);
if(drawLevel mod 5 == 0){
	var _col = $68e731;
}
else{
	var _col = $eead6b;
}
var _col2 = $4b4c3d;
var _col2 = merge_color($6c6255, $695149, sin(current_time/50)/2+0.5);

//draw_text(xPos, 50, drawString);
drawTextOutline(xPos, 50, drawString, _col, _col2, 2);

drawSetDefault();
