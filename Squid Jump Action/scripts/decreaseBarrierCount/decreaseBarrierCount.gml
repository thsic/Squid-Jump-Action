
function decreaseBarrierCount(_decrease){
	
	//プレイヤーのhpが少ない時しか減少しない
	if(global.playerHp < 2){
		global.makeBarrierCount -= _decrease;
		createRiseEffect(oPlayer.x, oPlayer.y-32, 70, 40, global.makeBarrierCount, 0);
	}
	
}