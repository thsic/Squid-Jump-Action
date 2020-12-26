
var _px = oPlayer.x;
var _py = oPlayer.y;
var _distanceForPlayer = point_distance(x, y, _px, _py);


if(_distanceForPlayer < gravitateRange){
	gravitateEnable = true;
}

//引き寄せ
if(gravitateEnable){
	gravitateTime++;
	gravitateSpeed += 0.1;
	gravitateSpeed *= 1.02;
	gravitateSpeed = clamp(gravitateSpeed, 0, collisionRange);
	
	var _dir = point_direction(x, y, _px, _py);
	var _hSpeed = lengthdir_x(gravitateSpeed, _dir);
	var _vSpeed = lengthdir_y(gravitateSpeed, _dir);
	
	x += _hSpeed;
	y += _vSpeed;
	
	
	if(_distanceForPlayer < collisionRange){
		addLevelPoint(levelPoint);
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
