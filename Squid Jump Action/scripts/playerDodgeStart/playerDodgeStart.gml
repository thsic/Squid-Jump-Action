
function playerDodgeStart(){
	if(oPlayer.dodgeEnable){
		//ドッジ中にもう一回ドッジするとドッジ時間が伸びる
		oPlayer.dodgeTime += oPlayer.dodgeTimeBase
	}
	else{
		oPlayer.dodgeTime = oPlayer.dodgeTimeBase;
	}
	oPlayer.dodgeEnable = true;
	oPlayer.remainDodgeCount--;
	setPlayerInvinsibleTime(oPlayer.dodgeTimeBase);
	
	//プランクトン全部あつめる
	with(oPlankton){
		oPlayer.gravitateEnable = true;
	}
}

