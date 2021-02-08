// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setOtherItemGenerateCount(){
	var _levelPer = global.nowLevel/MAXLEVEL;
	var _channel = animcurve_get_channel(acOtherItemGenerateSpan, 0);
	var _generateSpan = animcurve_channel_evaluate(_channel, _levelPer);
	if(oGameMgr.otherItemThroughCount){
		//見逃し回数が多いとすぐ現れるように
		_generateSpan *= power(0.5, oGameMgr.otherItemThroughCount);
	}
	oGameMgr.otherItemGenerateCount = _generateSpan;
}