// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setPlayerInvinsibleTime(_time){
	
	var _time2 = _time / power(2, oPlayer.invinsibleCount);//[ベースの無敵時間 / 無敵時間発生回数の累乗]
	if(!oPlayer.invinsibleEnable){
		//無敵時間になってない状態から無敵時間になる
		oPlayer.invinsibleTime = _time
		oPlayer.invinsibleEnable = true;
		oPlayer.invinsibleCount++;
	}
	else if(oPlayer.invinsibleTime < _time2){
		//[ベースの無敵時間 / 無敵時間発生回数の累乗] と 現在の無敵時間を比較して、
		//現在の無敵時間の方が短い場合に[ベース無敵時間 / 無敵時間発生回数累乗]の値を無敵時間として設定する
		oPlayer.invinsibleTime = _time2;
		oPlayer.invinsibleCount++;
	}
}