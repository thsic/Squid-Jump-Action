
gravitateTime = 0;
gravitateEnable = false;
gravitateSpeed = 0;


lifeTime = random_range(0, 1000);
lightPowerMin = random_range(1, 1.5);
lightPowerMax = random_range(1.5, 3);
lightPower = random_range(lightPowerMin, lightPowerMax);
	
lightAlpha = 0.2;


//オブジェクトに触れたときに出てくるプランクトン
leaveToPlayerTime = 0;
leaveToPlayerTimeBase = 0;
leaveEnable = false;
leaveDirection = 0;
leaveSpeedBase = 0;
