// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addDashCount(_dashCount){
	if(_dashCount > 0){
		
		oPlayer.remainDashCount += _dashCount;
		oPlayer.remainDashCount = clamp(oPlayer.remainDashCount, 0, oPlayer.dashCountBase)
	}
}