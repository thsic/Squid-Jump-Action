
function playerDodgeStart(){
	if(oPlayer.dodgeEnable){
		//ドッジ中にもう一回ドッジするとドッジ時間が伸びる
		oPlayer.dodgeTime += dodgeTimeBase
	}
	else{
		oPlayer.dodgeTime = dodgeTimeBase;
	}
	oPlayer.dodgeEnable = true;
	oPlayer.remainDodgeCount--;
	setPlayerInvinsibleTime(oPlayer.dodgeTimeBase);
	
	//プランクトン全部あつめる
	with(oPlankton){
		gravitateEnable = true;
	}
}

