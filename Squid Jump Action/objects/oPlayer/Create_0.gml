
vSpeed = 0;
hSpeed = 0;
swipeStartPointX = noone;
swipeStartPointY = noone;
remainDashCount = dashCountBase;
remainJumpCount = jumpCountBase;

//ダッシュ
hSpeedAcceleration = 0;
dashHspeed = 0;
dashVspeed = 0;
dashEnable = false;
dashTime = 0;
dashHspeedBase = 0;
dashVspeedBase = 0;
chargeingDash = false;
drawDashDirection = 0;
dashSpeed = dashSpeedBase;
dashTimeBase = dashTimeDefault;


//移動
playerDirection = 0;
grounded = false;

//海
intoSea = true;
intoSeaPrev = intoSea;

//無敵時間
invinsibleTime = 0;
invinsibleEnable = false;
invinsibleCount = 0;

//描画
subimage = 0;

//回避
prevTapTime = 1000;
remainDodgeCount = dodgeCountBase;
dodgeEnable = false;
dodgeTime = 0;

//アイテム
infiniteJumpTime = 0;
infiniteJumpEnable = false;

dsEnemyParam = ds_grid_create(10, 99);

//残像
dsTrailGrid = ds_grid_create(10, 7);
trailTimeBase = dashTimeBase+7;
trailTime = 0;

var _gridHeight = ds_grid_height(dsTrailGrid);
for(var i=0; i<_gridHeight; i++){
	dsTrailGrid[# TRAILPARAM.ENABLE, i] = false;
}


enum ENEMYPARAM{
	ID,
	DISTANCE,
	DIRECTION,
	
}

enum TRAILPARAM{
	X,
	Y,
	LIFETIME,
	ALPHA,
	DIRECTION,
	ENABLE,
}

