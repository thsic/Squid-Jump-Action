// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damageToPlayer(_damage){
	global.playerHp -= _damage;
	setBarrierCount();
	
	//スピードアップを落とす
	decreaseSpeedLevel(DECREASESPEEDLEVEL);
	
	//ダメージ食らった時にゲームスピード落ちるやつ
	//oGameMgr.damagedTime = DAMAGEDTIMEBASE;
	
	if(global.playerHp <= 0){
		gameoverScript();
	}
}