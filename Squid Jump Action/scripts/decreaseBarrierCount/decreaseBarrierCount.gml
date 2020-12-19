
function decreaseBarrierCount(_decrease){
	
	//プレイヤーのhpが少ない時しか減少しない
	if(global.playerHp < 2 and _decrease >= 0){
		
		for(var i=0; i<_decrease; i++){
			
			if(global.makeBarrierCount > 0){//0の時は減少しない
				global.makeBarrierCount -= 1;
				createRiseEffect(oPlayer.x, (oPlayer.y-32)-(16*i), 70, 40, global.makeBarrierCount, 0);
			}
			
		}
		
	}
	
}