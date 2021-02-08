// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemGetRandomEvent(){
	oRandomEventMgr.eventRoulette = true;
	oRandomEventMgr.rouletteTime = oRandomEventMgr.rouletteTimeBase;
	oGameMgr.otherItemThroughCount = 0;
}