
#region function
function jumpManage(){
	if(mouse_check_button_pressed(mb_left) and remainJumpCount > 0){
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
		if(vSpeed > 8){
			vSpeed = 8;
		}
	}
}
function executionMove(){
	//hSpeedTemp *= hSpeedAcceleration;
	
	if(hSpeed < hSpeedTemp){
		//高い方が優先
		hSpeed = hSpeedTemp;
	}
	
	
	y += vSpeed;
	global.flySpeed = hSpeed + dashHspeed;//ダッシュ中はダッシュの加速も追加
	
	//x += hSpeed;
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
		remainJumpCount = jumpCountBase;
		remainDashCount = dashCountBase;
		//敵を踏むとhSpeedはもとに戻る
		hSpeed = 0;
	}
}
function dashManage(){
	
	chargeingDash = false
	if(mouse_check_button_pressed(mb_left)){
		swipeStartPointX = mouse_x;
		swipeStartPointY = mouse_y;
	}
	
	var _swipeDir = point_direction(swipeStartPointX, swipeStartPointY, mouse_x, mouse_y);
	var _swipeDis = point_distance(swipeStartPointX, swipeStartPointY, mouse_x, mouse_y);
		
	if(_swipeDis > 32 and remainDashCount > 0){
		if(mouse_check_button(mb_left)){
			//一定距離以上スワイプするとダッシュ可能状態に
			chargeingDash = true;
			/*if(isInRange(0, 180-20, _swipeDir)){
				dashDirection = 360-60;
			}
			if(isInRange(180-20, 180+20, _swipeDir)){
				dashDirection = 0;
			}
			if(isInRange(180+20, 360, _swipeDir)){
				dashDirection = 60;
			}*/
			dashDirection = _swipeDir + 180;
			
			dashDirection %= 360;
			//逆方向には進めない
			if(isInRange(90, 180, dashDirection)){
				dashDirection = 90;
			}
			if(isInRange(180, 270, dashDirection)){
				dashDirection = 270;
			}
		}
		
		//手を離すとダッシュ
		if(mouse_check_button_released(mb_left)){
			dashTime = dashTimeBase;
			dashEnable = true;
			remainDashCount--;
			
			dashHspeedBase = lengthdir_x(dashSpeed, dashDirection);
			
			//vspeedはダッシュ時にはリセット
			vSpeed = 0;
			vSpeed = lengthdir_y(dashSpeed, dashDirection);
			
			//加速
			var _dirRatio = (dashDirection-90)/180;
			var _channel = animcurve_get_channel(acAcceleration, 0);
			//hSpeedAcceleration = animcurve_channel_evaluate(_channel, _dirRatio);
			
		}
	}
	else{
		dashDirection = noone;
	}
	
	//ダッシュ中処理
	if(dashEnable){
		if(dashTime <= 0){
			//ダッシュ終わり
			dashEnable = false;
			dashHspeed = 0;
		}
		else{
			var _dashTimeRatio = 1-dashTime/dashTimeBase;
			var _channel = animcurve_get_channel(acDashSpeed, 0);
			var _dashRatio = animcurve_channel_evaluate(_channel, _dashTimeRatio);
			dashHspeed = dashHspeedBase*_dashRatio;
			dashTime--;
		}
	}
}
function flightPlayer(){
	//飛ぶ
	hSpeedTemp += flightSpeed;
}
function resetPlayerParam(){
	hSpeedTemp = 0;
}
function playerHpManage(){
	
	var _enemyId, _enemyDis;
	var _enemyNum = instance_number(oEnemy);
	for(var i=0; i<_enemyNum; i++){
		_enemyDis = ds_grid_get(dsEnemyParam, ENEMYPARAM.DISTANCE, i);
		
		//敵が当たり判定内にいるかどうか調べる
		if(_enemyDis < playerCollisionSize){
			//いる
			_enemyId = ds_grid_get(dsEnemyParam, ENEMYPARAM.ID, i);
			if(_enemyId.spike = true){
				//敵に攻撃判定がある
				setPlayerInvinsibleTime(invinsibleTimeBase);
				
				if(!invinsibleEnable){
					//無敵時間でないならプレイヤーにダメージ
					damageToPlayer(1);
				}
			}
		}
		else{
			//居ない
			break;
		}
	}
	
	//無敵時間減らす
	if(invinsibleTime > 0){
		invinsibleTime--;
	}
	else{
		invinsibleEnable = false;
	}
	
}
function fellIntoTheSea(){
	//海に落ちた
	if(y < 0){
		gameoverScript();
	}
}

#endregion

resetPlayerParam();
lengthForEnemyList();

//移動関連
jumpManage();
gravityManage();
stompEnemy();
dashManage();
flightPlayer();

//ライフ
playerHpManage();

//ゲームシステム関連
fellIntoTheSea();


//移動の実行
executionMove();
