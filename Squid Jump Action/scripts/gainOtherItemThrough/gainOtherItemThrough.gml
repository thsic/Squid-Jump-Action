// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gainOtherItemThrough(){
	oGameMgr.otherItemThroughCount++;
	if(oGameMgr.otherItemThroughCount >= 6){
		oGameMgr.otherItemThroughCount = 6;
	}
	oGameMgr.otherItemGenerateCount /= 2;
}