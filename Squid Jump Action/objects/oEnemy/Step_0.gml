
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
	
	hSpeed -= global.flySpeed;
	
	executionEnemyMove();
}
