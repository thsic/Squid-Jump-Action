
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
	
	hSpeed = -global.flySpeed - swimSpeed;
	
	executionEnemyMove();
	
	if(x < 0-sprite_get_width(sprite_index)){
		//左に行ったら消す
		instance_destroy()
	}
}

