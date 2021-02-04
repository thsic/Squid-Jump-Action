
var _px = oPlayer.x;
var _py = oPlayer.y;
var _distanceForPlayer = point_distance(x, y, _px, _py);


if(_distanceForPlayer < gravitateRange){
	gravitateEnable = true;
}

//引き寄せ
if(gravitateEnable and !leaveEnable){
	gravitateTime++;
	gravitateSpeed += 0.1;
	gravitateSpeed *= 1.02;
	gravitateSpeed = clamp(gravitateSpeed, 0, collisionRange);
	
	var _dir = point_direction(x, y, _px, _py);
	var _hSpeed = lengthdir_x(gravitateSpeed, _dir);
	var _vSpeed = lengthdir_y(gravitateSpeed, _dir);
	
	x += _hSpeed;
	y += _vSpeed;
	
	//衝突 or 一定時間経過すると勝手に取得扱いに
	if(_distanceForPlayer < collisionRange or gravitateTime >= gravitateTimeLimit){
		addLevelPoint(levelPoint);
		gainScore(10, c_white, false, false);
		instance_destroy();
	}
}

x -= global.flySpeed;

//光加減
lifeTime++;
var _lightRatio = sin(lifeTime/50)/2 + 0.5;
var _lightPowerRange = lightPowerMax - lightPowerMin;
lightPower = lightPowerMin + _lightPowerRange*_lightRatio;
lightAlpha = _lightRatio/10 + 0.2;

if(!gravitateEnable and x < -gravitateRange){
	instance_destroy();
}

if(leaveEnable){
	
	var _posx = 1-leaveToPlayerTime/leaveToPlayerTimeBase;
	var _channel = animcurve_get_channel(acPlanktonLeaveSpeed, 0);
	var _leaveSpeed = animcurve_channel_evaluate(_channel, _posx)*leaveSpeedBase;
	
	var _hSpeed = lengthdir_x(_leaveSpeed, leaveDirection);
	var _vSpeed = lengthdir_y(_leaveSpeed, leaveDirection);
	
	x += _hSpeed;
	y += _vSpeed;
	if(leaveToPlayerTime > 0){
		leaveToPlayerTime--;
	}
	else{
		leaveEnable = false;
	}
	
}




