
function executionEnemyMove(){
	x += hSpeed;
	y += vSpeed;
}

hSpeed = 0;
vSpeed = 0;
if(!global.gameStop){
	
	if(zapped){
		//踏まれるなどして攻撃された
		instance_destroy();
	}
	
	hSpeed = -global.flySpeed
	
	executionEnemyMove();
	
	if(x < 0-sprite_get_width(sprite_index)){
		//左に行ったら消す
		instance_destroy()
	}
}

