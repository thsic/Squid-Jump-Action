
function getSquidCoin(_num){
	global.squidCoin += _num;
}

var _px = oPlayer.x;
var _py = oPlayer.y;
var _lengthForPlayer = point_distance(x, y, _px, _py);

if(_lengthForPlayer < collisionSize
and gettedCoin == false){
	getSquidCoin(1);
	gettedCoin = true;
	//エフェクトとかいれてもいい
	instance_destroy();
}

x -= global.flySpeed;




