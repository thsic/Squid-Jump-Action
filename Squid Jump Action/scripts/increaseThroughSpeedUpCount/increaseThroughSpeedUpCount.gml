
function increaseThroughSpeedUpCount(_increase){
	global.throughSpeedUpCount += _increase;
	if(global.throughSpeedUpCount >= THROUGHSPEEDUPCOUNTLIMIT){//スルー回数が基準値を超えたらスピードレベルを落とす
		decreaseSpeedLevel(1);
	}
}