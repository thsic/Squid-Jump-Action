

function jumpManage(){
	if(mouse_check_button_pressed(mb_left)){
		//ジャンプの実行
		vSpeed = -5;
		remainJumpCount --;
	}
}
function gravityManage(){
	if(vSpeed < 0){
		//上昇中
		vSpeed *= 0.95;
		vSpeed += 0.05;
	}
	else{
		//下降中
		vSpeed *= 1.05;
		vSpeed += 0.05;
	}
}
function executionMove(){
	y += vSpeed;
}
function lengthForEnemyList(){
	//リスト初期化
	ds_grid_clear(dsEnemyParam, 10000);

	
	//敵をリスト化
	var _enemyNum = instance_number(oEnemy);
	var _enemyId, _enemyDis, _enemyDir;
	for(var i=0; i<_enemyNum; i++){
		_enemyId = instance_find(oEnemy, i);
		_enemyDis = point_distance(x, y, _enemyId.x, _enemyId.y);
		_enemyDir = point_direction(x, y, _enemyId.x, _enemyId.y);
		
		ds_grid_set(dsEnemyParam, ENEMYPARAM.ID, i, _enemyId);
		ds_grid_set(dsEnemyParam, ENEMYPARAM.DISTANCE, i, _enemyDis);
		ds_grid_set(dsEnemyParam, ENEMYPARAM.DIRECTION, i, _enemyDir);
	}
	
	
	//ソート
	ds_grid_sort(dsEnemyParam, ENEMYPARAM.DISTANCE, true);
}
function stompEnemy(){
	//一番近い敵が踏める範囲に居るかどうか
	var _enemyDis = ds_grid_get(dsEnemyParam, ENEMYPARAM.DISTANCE, 0);
	var _enemyId = ds_grid_get(dsEnemyParam, ENEMYPARAM.ID, 0);
	if(_enemyDis < stompRange){
		//踏む
		zapToEnemy(_enemyId);
		//上昇
		vSpeed = -5;
		
		//いろいろ回復
		remainJumpCount = 1;
		remainDashCount = 3;
	}
}


lengthForEnemyList();

jumpManage();
gravityManage();
stompEnemy();

executionMove();
