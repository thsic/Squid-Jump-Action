// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemGetBarrier(){
	
	if(global.playerHp < 2){
		//プレイヤーのhpが最大では無い場合のみ取得できる
		global.playerHp++;
		//バリアカウントを初期値に
		global.makeBarrierCount = oGameMgr.makeBarrierCountBase;
	}
	
}