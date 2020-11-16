function executionItemMove(){
	x += hSpeed;
	y += vSpeed;
}

hSpeed = 0;
vSpeed = 0;
if(!global.gameStop){
	
	var _disToPlayer = point_distance(x, y, oPlayer.x, oPlayer.y);
	
	//アイテム取得
	if(_disToPlayer < collisionSize and effectScript != noone){
		script_execute(effectScript);
		instance_destroy();
	}
	
	hSpeed = -global.flySpeed
	
	executionItemMove();
}

