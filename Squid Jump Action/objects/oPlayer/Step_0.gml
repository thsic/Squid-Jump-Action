
#region function
function jumpManage(){
	/*if(mouse_check_button_pressed(mb_left) and remainJumpCount > 0){
		//ジャンプの実行
		vSpeed = -5;
		remainJumpCount --;
	}*/
	//ダッシュが0の時にタップしたらちょっとだけ浮く
	if(mouse_check_button_pressed(mb_left)
	and remainDashCount = 0
	and sign(vSpeed) = 1){
		vSpeed *= 0.7;
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
	if(dashEnable){
		global.flySpeed = dashHspeed;//ダッシュ中はダッシュの加速も追加
	}
	else{
		global.flySpeed = hSpeed;//ダッシュ中はダッシュの加速も追加
	}
	
	//地面についた
	if(GROUNDPOS-1 < y){
		y = GROUNDPOS;
		grounded = true;
		global.flySpeed /= 2;
		
		//ダッシュが無い時に地面に落ちるとダッシュ１復活
		if(remainDashCount = 0){
			remainDashCount += 1;
		}
	}
	else{
		graunded = false;
	}
	
	global.swimLength += global.flySpeed;//泳いだ距離
	addLevelPoint(global.flySpeed * flightLevelPoint);//レベルポイント加算
	playerDirection = point_direction(0, 0, hSpeed + dashHspeed, vSpeed);
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
	
	var _enemyDis, _enemyId;
	var _enemyNum = instance_number(oEnemy);
	for(var i=0; i<_enemyNum; i++){
		_enemyDis = ds_grid_get(dsEnemyParam, ENEMYPARAM.DISTANCE, i);
		if(_enemyDis <= stompRange){
			_enemyId = ds_grid_get(dsEnemyParam, ENEMYPARAM.ID, i);
			
			//敵が踏みつけ可能か確認
			if(_enemyId.canStomp){
				//踏む
				zapToEnemy(_enemyId);
				//バリアカウント減少
				decreaseBarrierCount(1);
				//レベルポイント上昇
				addLevelPoint(3);
				//スコア上昇
				gainScore(1000);
				
				//上昇
				vSpeed = -5;
		
				//いろいろ回復
				remainJumpCount = jumpCountBase;
				remainDashCount = dashCountBase;
				//敵を踏むとhSpeedはもとに戻る
				hSpeed = 0;
			}
		}
	}

}
function dashManage(){
	
	subimage = 0;
	chargeingDash = false
	var _mx = window_mouse_get_x();
	var _my = window_mouse_get_y();
	if(mouse_check_button_pressed(mb_left)){
		swipeStartPointX = _mx;
		swipeStartPointY = _my;
	}
	
	var _swipeDir = point_direction(swipeStartPointX, swipeStartPointY, _mx, _my);
	var _swipeDis = point_distance(swipeStartPointX, swipeStartPointY, _mx, _my);
		
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
			subimage = 2;
		}
		
		//手を離すとダッシュ
		if(mouse_check_button_released(mb_left)){
			dashTime = dashTimeBase;
			dashEnable = true;
			remainDashCount--;
			
			dashHspeedBase = lengthdir_x(dashSpeed, dashDirection);
			dashVspeedBase = lengthdir_y(dashSpeed, dashDirection);
			
			//vspeedはダッシュ時にはリセット
			vSpeed = 0;
			//vSpeed = lengthdir_y(dashSpeed, dashDirection);
			
			//加速
			var _dirRatio = (dashDirection-90)/180;
			var _channel = animcurve_get_channel(acAcceleration, 0);
			//hSpeedAcceleration = animcurve_channel_evaluate(_channel, _dirRatio);
			
		}
	}
	else{
		if(_swipeDis < 32
		and mouse_check_button(mb_left)
		and remainDashCount > 0){//スワイプ距離が短い場合はsubimageを変える
			subimage = 1;
		}
		dashDirection = noone;
	}
	
	//ダッシュ中処理
	if(dashEnable){
		if(dashTime <= 0){
			//ダッシュ終わり
			if(vSpeed > 0){//ダッシュが下向きの時はダッシュ後もそのままvspeedが引き継がれる
				vSpeed = dashVspeedBase;
			}

			dashEnable = false;
			dashHspeed = 0;
			dashVspeed = 0;
			subimage = 0;
			
		}
		else{
			//ダッシュ中
			var _dashTimeRatio = 1-dashTime/dashTimeBase;
			var _channel = animcurve_get_channel(acDashSpeed, 0);
			var _dashRatio = animcurve_channel_evaluate(_channel, _dashTimeRatio);
			dashTime--;
			
			dashHspeed = dashHspeedBase*_dashRatio;
			subimage = 3;
			
			if(dashVspeedBase > 0){//ダッシュが下向きの場合はvspeedが減少しない
				vSpeed = dashVspeedBase;
			}
			else{
				vSpeed = dashVspeedBase*_dashRatio;
			}
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
	//hp管理
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
				if(!invinsibleEnable){
					//無敵時間でないならプレイヤーにダメージ
					damageToPlayer(1);
				}
				
				//無敵時間にする
				setPlayerInvinsibleTime(invinsibleTimeBase);
				
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
	if(y > room_height){
		gameoverScript();
	}
}

function playerParamManage(){
	
	intoSeaPrev = intoSea;
	if(y < SEALEVEL){
		intoSea = false;
	}
	else{
		intoSea = true;
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
playerParamManage();


//移動の実行
executionMove();

