// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemGetSpeedUp(){
	global.speedLevel += 1;
	global.throughSpeedUpCount = 0;//スルー回数をリセット
	if(global.speedLevel > MAXSPEEDLEVEL){
		global.speedLevel = MAXSPEEDLEVEL;
		//スピードレベルが最大値なら代わりに仮スピードを獲得
		gainTempSpeed(2);
	}
}