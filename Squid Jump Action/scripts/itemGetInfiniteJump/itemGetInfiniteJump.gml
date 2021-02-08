
function itemGetInfiniteJump(){
	oPlayer.infiniteJumpTime = MAXINFINITEJUMPTIME;
	oPlayer.infiniteJumpTimeDefault = MAXINFINITEJUMPTIME;
	oGameMgr.otherItemThroughCount = 0;
	gainScore(ITEMGETSCOREBASE, ITEMGETSCORECOLOR, true, true);
}