
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
		vSpeed *= 0.65;
	}
	
}

function gravityManage(){
	
	if(oGameMgr.damagedTime > 0){
		if(vSpeed < 0){
			//上昇中
			vSpeed *= 0.975;
			vSpeed += 0.025;
		}
		else{
			//下降中
			vSpeed *= 1.025;
			vSpeed += 0.025;
			if(vSpeed > 4){
				vSpeed = 4;
			}
		}
	}
	else{
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
	
}

function dodgeManage(){
	var _dodgeFrame = false
	if(prevTapTime < 10){//タップされてから10f以内にもう一回タップすると回避コマンド
		prevTapTime++
		if(mouse_check_button_pressed(mb_left)
		and point_distance(window_mouse_get_x(), window_mouse_get_y(), 
		prevTapPointX, prevTapPointY) < 64
		and remainDodgeCount > 0){
			//前回タップされた座標に近くないと回避が発動しない
			playerDodgeStart();
			var _dodgeFrame = true
			prevTapTime = 1000;
		}
		
	}
	
	//一回目タップ ドッジが発動したフレームでは一回目としてカウントしない
	if(mouse_check_button_pressed(mb_left)
	and !_dodgeFrame){
		prevTapTime = 0;
		prevTapPointX = window_mouse_get_x();
		prevTapPointY = window_mouse_get_y();
	}
	
	
	//ドッジ中の処理
	if(dodgeEnable){
		dodgeTime--;
		invinsibleCount = 0;//ドッジ中はinvinsibleCountが上昇しない
		if(dodgeTime <= 0){
			dodgeEnable = false;
		}
	}
}

function executionMove(){
	//hSpeedTemp *= hSpeedAcceleration;
	
	//if(hSpeed < hSpeedTemp){//if文を入れるとスピードがダメージ食らってもおちなくなるので一旦コメントアウト
		
		hSpeed = hSpeedTemp;
	//}
	
	//ダメージくらったあとの場合スピードがおそく
	if(oGameMgr.damagedTime > 0){
		var _slowRatio = oGameMgr.damagedTimeSlowRatio;
		var _hSpeed = hSpeed * _slowRatio;
		var _vSpeed = vSpeed * _slowRatio;
		var _dashHspeed = dashHspeed * _slowRatio;
	}
	else{
		var _hSpeed = hSpeed;
		var _vSpeed = vSpeed;
		var _dashHspeed = dashHspeed;
	}
	
	y += vSpeed;
	global.flySpeed = _hSpeed + _dashHspeed;//ダッシュ中はダッシュの加速も追加
	
	//地面についた
	if(GROUNDPOS-1 < y and GROUNDENABLE){
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

	
	//画面より上へはいけない
	if(0 > y){
		y = 0;
	}

	global.swimLength += global.flySpeed;//泳いだ距離
	//addLevelPoint(global.flySpeed * flightLevelPoint);//レベルポイント加算(今はプランクトンの役目)
	playerDirection = point_direction(0, 0, _hSpeed + _dashHspeed, _vSpeed);
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

function collisionEnemy(){
	//一番近い敵が踏める範囲に居るかどうか
	
	var _enemyDis, _enemyId;
	var _enemyNum = instance_number(oEnemy);
	for(var i=0; i<_enemyNum; i++){
		_enemyDis = ds_grid_get(dsEnemyParam, ENEMYPARAM.DISTANCE, i);
		if(_enemyDis <= stompRange){
			_enemyId = ds_grid_get(dsEnemyParam, ENEMYPARAM.ID, i);
			
			if(!_enemyId.collided){
				//ダッシュカウント回復
				addDashCount(_enemyId.addDashCount);
				//描画するスコアの色決め
				switch(_enemyId.object_index){
				case oOctopus:
					var _scoreColor = $FFFFFA0A;
				break;
				default:
					var _scoreColor = $FFFF4B23;
				break
				}
				//スコア上昇
				gainScore(_enemyId.collisionScore, _scoreColor, true, true);
				//バリアカウント減少
				decreaseBarrierCount(_enemyId.collisionBarrierCount);
				//レベルポイント上昇 割合と固定値大きい方
				var _p1 = _enemyId.collisionLevelPoint*oGameMgr.levelUpPoint;
				var _p2 = 10;
				generatePlankton(max(_p1, _p2), _enemyId.x, _enemyId.y);
				//addLevelPoint(max(_p1, _p2));
				//接触
				collisionToEnemy(_enemyId);
			
				//敵が踏みつけ可能か確認
				if(_enemyId.canStomp){
					//踏む
					zapToEnemy(_enemyId);
					//上昇
					vSpeed = -5;
				
					//ダッシュ消す
					dashEnable = false;
					dashHspeed = 0;
					dashVspeed = 0;
					subimage = 0;
					
					//残像消す
					trailTime = 0;
				}
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
	
	
	//drawDashDirectionは表示する角度
	//drawDashDirection = point_direction(swipeStartPointX, swipeStartPointY, _mx+hSpeed, _my) + 180;
	
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
			
			var _dashDir = _swipeDir + 180;
			_dashDir %= 360;
			
			
			var _dirMax = 90;
			var _dirMin = 270;
			
			//逆方向には進めない
			if(isInRange(_dirMax, 180, _dashDir)){
				_dashDir = 90;
			}
			if(isInRange(180, _dirMin, _dashDir)){
				_dashDir = 270;
			}
			
			
			dashDirection = _dashDir;
			
			
			//描画関連
			var _dx = lengthdir_x(dashSpeed, 90);
			var _dy = lengthdir_y(dashSpeed, 90);
			var _drawDashDirMin = abs(angle_difference(point_direction(0, 0, _dx+hSpeed, _dy), 0));
			var _drawDashDirMax = 360 - _drawDashDirMin;
			var _drawDashDir = _dashDir;
			//var _dx = hSpeed;
			//var _dy = sqrt(power(dashSpeed, 2) - power(hSpeed, 2));//三平方の定理をつかうらしい
			//var _drawDashDirMin = abs(angle_difference(point_direction(0, 0, _dx, _dy), 0));//角度の差をもとめる
			
			if(isInRange(_drawDashDirMin, 180, _drawDashDir)){
				_drawDashDir = _drawDashDirMin;
			}
			if(isInRange(180, _drawDashDirMax, _drawDashDir)){
				_drawDashDir = _drawDashDirMax;
			}
			drawDashDirection = _drawDashDir;
			
			
			//ダッシュ角度計算
			var _dx2 = lengthdir_x(dashSpeed, _dashDir);
			var _dy2 = lengthdir_y(dashSpeed, _dashDir);
			_dx2 -= dashHspeedBase;
			
			//dashDirection = point_direction(0, 0, _dx2, _dy2);
			//sdm(dashDirection)
			subimage = 2;
		}
		
		//手を離すとダッシュ
		if(mouse_check_button_released(mb_left)){
			//ダッシュ開始
			
			dashTime = dashTimeBase;
			dashEnable = true;
			remainDashCount--;
			
			
			dashHspeedBase = lengthdir_x(dashSpeed, dashDirection);
			dashVspeedBase = lengthdir_y(dashSpeed, dashDirection);
			
			//vspeedはダッシュ時にはリセット
			vSpeed = 0;
			
			//加速
			var _dirRatio = (dashDirection-90)/180;
			var _channel = animcurve_get_channel(acAcceleration, 0);
			//hSpeedAcceleration = animcurve_channel_evaluate(_channel, _dirRatio);
			
			//残像
			trailTime = trailTimeBase;
			
			//ダッシュ加速イベント中はダッシュするたびに仮スピードが増える
			if(global.randomEventId == RANDOMEVENT.DASHACCELERATION){
				gainTempSpeed(1);
			}
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
	//飛ぶ スピードアップが乗ってるときはそれも加算
	var _speedLevel = (global.speedLevel-1)+global.tempSpeedLevel;
	var _speedUpRatio = power(SPEEDUPRATIOPERLEVEL, _speedLevel);

	hSpeedTemp += flightSpeed * _speedUpRatio;
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
			if(_enemyId.spike == true
			and _enemyId.disablement == false){
				//敵に攻撃判定がある かつ 一度も接触してない
				
				if(!invinsibleEnable and global.randomEventId != RANDOMEVENT.INBINCIBLE){
					//無敵時間でないならプレイヤーにダメージ
					damageToPlayer(1);
				}
				if(dodgeEnable){
					//ドッジ中に回避するとエフェクトがでる
					createRiseEffect(oPlayer.x, oPlayer.y-32, 70, 40, "DODGE!", 0);
				}
				
				//無敵時間にする
				setPlayerInvinsibleTime(invinsibleTimeBase);
				_enemyId.disablement = true;//無力化
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
		invinsibleCount = 0;                         
	}

}
	
function fellIntoTheSea(){
	
	//海に落ちた
	var _spriteHeight = sprite_get_height(sprite_index);
	if(y - _spriteHeight > room_height){
		if(global.playerHp > 0){
		//海に落ちると1ダメージくらって大ジャンプ
			damageToPlayer(1);
			addDashCount(4);
			vSpeed = -11;
			setPlayerInvinsibleTime(invinsibleTimeBase);
		}
		else{
			//hpが無いなら無敵時間でも死亡
			gameoverScript();
		}
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
	
function infiniteJumpManage(){
	if(infiniteJumpTime > 0){
		remainDashCount = dashCountBase;
		infiniteJumpTime--;
		infiniteJumpEnable = true;
	}
	else{
		infiniteJumpEnable = false;
	}
}

function playerTrailManage(){
	var _lifeTimeBase = 30;
	var _gridHeight = ds_grid_height(dsTrailGrid)-1;
	
	if(trailTime > 0 and trailTime mod 3 = 0){
		//残像生成処理
		
		//いっこずつずらす
		var _i = _gridHeight;
		repeat(_gridHeight){
			_i--;
			if(_gridHeight != _i){
				dsTrailGrid[# TRAILPARAM.X, _i+1] = dsTrailGrid[# TRAILPARAM.X, _i];
				dsTrailGrid[# TRAILPARAM.Y, _i+1] = dsTrailGrid[# TRAILPARAM.Y, _i];
				dsTrailGrid[# TRAILPARAM.LIFETIME, _i+1] = dsTrailGrid[# TRAILPARAM.LIFETIME, _i];
				dsTrailGrid[# TRAILPARAM.DIRECTION, _i+1] = dsTrailGrid[# TRAILPARAM.DIRECTION, _i];
				dsTrailGrid[# TRAILPARAM.ENABLE, _i+1] = dsTrailGrid[# TRAILPARAM.ENABLE, _i];
			}
		}
		
		//残像生成
		dsTrailGrid[# TRAILPARAM.X, 0] = x;
		dsTrailGrid[# TRAILPARAM.Y, 0] = y;
		dsTrailGrid[# TRAILPARAM.LIFETIME, 0] = _lifeTimeBase;
		dsTrailGrid[# TRAILPARAM.ALPHA, 0] = 1;
		dsTrailGrid[# TRAILPARAM.DIRECTION, 0] = drawDashDirection;
		dsTrailGrid[# TRAILPARAM.ENABLE, 0] = true;
		
		
	}
	//残像制御
	for(var i=0; i<_gridHeight; i++){
		if(dsTrailGrid[# TRAILPARAM.ENABLE, i] == true){
			
			dsTrailGrid[# TRAILPARAM.X, i] -= global.flySpeed;
			
			var _alpha =  dsTrailGrid[# TRAILPARAM.LIFETIME, i] / _lifeTimeBase;
			dsTrailGrid[# TRAILPARAM.ALPHA, i] = _alpha;
			
			if(dsTrailGrid[# TRAILPARAM.LIFETIME, i] <= 0){
				dsTrailGrid[# TRAILPARAM.ENABLE, i] = false;
			}
			else{
				dsTrailGrid[# TRAILPARAM.LIFETIME, i] -= 1;
			}
		}
	}
	
	if(trailTime > 0){
		trailTime--
	}
}
#endregion



if(!global.gameStop){
	resetPlayerParam();
	lengthForEnemyList();
	
	//アイテム
	infiniteJumpManage()
	
	//移動関連
	jumpManage();
	gravityManage();
	collisionEnemy();
	dashManage();
	flightPlayer();
	
	//ライフ
	playerHpManage();
	
	//回避
	//dodgeManage();

	//ゲームシステム関連
	fellIntoTheSea();
	playerParamManage();
	
	//残像
	playerTrailManage()

	//移動の実行
	executionMove();
}
