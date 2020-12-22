
function setEnemyGenerateSpan(){
	var _levelRatio = global.nowLevel / MAXLEVEL;
	var _channelJerryfish = animcurve_get_channel(acEnemyGenerateSpan, 0);
	var _channelInsideUrchin = animcurve_get_channel(acEnemyGenerateSpan, 1);
	var _channelOutsideUrchin = animcurve_get_channel(acEnemyGenerateSpan, 2);
	var _channelOctopus = animcurve_get_channel(acEnemyGenerateSpan, 3);
	var _channelShark= animcurve_get_channel(acEnemyGenerateSpan, 4);
	
	oEnemyGenerateMgr.jellyfishGenerateSpan = animcurve_channel_evaluate(_channelJerryfish, _levelRatio);
	oEnemyGenerateMgr.insideUrchinGenerateSpan = animcurve_channel_evaluate(_channelInsideUrchin, _levelRatio);
	oEnemyGenerateMgr.outsideUrchinGenerateSpan = animcurve_channel_evaluate(_channelOutsideUrchin, _levelRatio);
	oEnemyGenerateMgr.octopusGenerateSpan = animcurve_channel_evaluate(_channelOctopus, _levelRatio);
	oEnemyGenerateMgr.sharkGenerateSpan = animcurve_channel_evaluate(_channelShark, _levelRatio);
}