// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increaseThroughSpeedUpCount(_increase){
	global.throughSpeedUpCount += _increase;
	if(global.throughSpeedUpCount >= THROUGHSPEEDUPCOUNTLIMIT){//スルー回数が基準値を超えたらスピードレベルを落とす
		decreaseSpeedLevel(1);
	}
}