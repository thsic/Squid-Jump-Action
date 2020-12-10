
function executionEnemyMove(){
	x += hSpeed;
	y += vSpeed;
}

if(!global.gameStop){
	
	if(zapped){
		//踏まれるなどして攻撃された
		instance_destroy();
	}
	
	hSpeed = -global.flySpeed - swimSpeed;
	
	executionEnemyMove();
	
	if(x < 0-sprite_get_width(sprite_index)){
		//左に行ったら消す
		instance_destroy()
	}
}

