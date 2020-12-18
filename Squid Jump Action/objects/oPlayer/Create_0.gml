
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

//アイテム
infiniteJumpTime = 0;
infiniteJumpEnable = false;

dsEnemyParam = ds_grid_create(10, 99);

enum ENEMYPARAM{
	ID,
	DISTANCE,
	DIRECTION,
	
}
