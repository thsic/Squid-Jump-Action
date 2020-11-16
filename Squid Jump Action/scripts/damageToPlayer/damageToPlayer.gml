// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damageToPlayer(_damage){
	global.playerHp -= _damage;
	setBarrierCount();
	
	if(global.playerHp <= 0){
		gameoverScript();
	}
}