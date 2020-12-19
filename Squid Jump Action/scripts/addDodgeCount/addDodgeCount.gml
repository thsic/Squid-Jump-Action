
function addDodgeCount(_dodgeCount){
	oPlayer.remainDodgeCount += _dodgeCount;
	if(oPlayer.remainDodgeCount > oPlayer.dodgeCountBase){
		oPlayer.remainDodgeCount = oPlayer.dodgeCountBase;
	}
}