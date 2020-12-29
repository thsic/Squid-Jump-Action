// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawTextOutline(_x, _y, _str, _colT, _colO, _olSize){
	
	draw_set_color(_colO);
	//アウトライン ごりおし
	draw_text(_x+_olSize, _y, string(_str));
	draw_text(_x-_olSize, _y, string(_str));
	draw_text(_x+_olSize, _y+_olSize, string(_str));
	draw_text(_x+_olSize, _y-_olSize, string(_str));
	draw_text(_x-_olSize, _y+_olSize, string(_str));
	draw_text(_x-_olSize, _y-_olSize, string(_str));
	draw_text(_x, _y+_olSize, string(_str));
	draw_text(_x, _y-_olSize, string(_str));
	
	//中心
	draw_set_color(_colT);
	draw_text(_x, _y, string(_str));
}