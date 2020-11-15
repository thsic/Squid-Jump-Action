
vSpeed = 0;
hSpeed = 0;
stompRange = 64;
swipeStartPointX = noone;
swipeStartPointY = noone;
remainDashCount = dashCountBase;
remainJumpCount = jumpCountBase;

//ダッシュ
hSpeedAcceleration = 0;
dashHspeed = 0;
dashEnable = false;
dashTime = 0;
dashHspeedBase = 0;

//無敵時間
invinsibleTime = 0;
invinsibleEnable = false;

dsEnemyParam = ds_grid_create(10, 99);

enum ENEMYPARAM{
	ID,
	DISTANCE,
	DIRECTION,
	
}
