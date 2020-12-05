
switch(fadeState){
case FADESTATE.FADEIN:
	fadeInTime++;
	
	if(fadeInTime > fadeInTotalTime){
		if(gotoRoom != noone){
			room_goto(gotoRoom);
		}
		
		if(betweenFrame <= 0){
			fadeState = FADESTATE.FADEOUT;
		}
		else{
			fadeState = FADESTATE.ROOMCHANGETIME;
		}
		
	}
break
case FADESTATE.ROOMCHANGETIME:
	roomChangeTime++;
	
	if(roomChangeTime > betweenFrame){
		fadeState = FADESTATE.FADEOUT;
	}
	
break
case FADESTATE.FADEOUT:
	fadeOutTime++;
	
	if(fadeOutTime > fadeOutTotalTime){
		instance_destroy();
	}
	
break
}
