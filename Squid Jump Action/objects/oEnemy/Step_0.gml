
function executionEnemyMove(){
	x += hSpeed;
	y += vSpeed;
}

if(!global.gameStop){
	
	if(zapped){
		//踏まれるなどして攻撃された
		instance_destroy();
	}
	if(collided){
		//プレイヤーと接触した
		//現状とくに処理は無し
		
	}
	if(disablement){
		//無効化された
		//現状とくに処理は無し
		
	}
	
	var _swimSpeed = swimSpeed;
	if(oGameMgr.damagedTime > 0){
		var _swimSpeed = swimSpeed * oGameMgr.damagedTimeSlowRatio;
	}
	
	hSpeed = -global.flySpeed - _swimSpeed;
	
	executionEnemyMove();
	
	if(x < 0-sprite_get_width(sprite_index)){
		//左に行ったら消す
		instance_destroy()
	}
}

