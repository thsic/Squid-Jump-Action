// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gameLevelUp(){
	global.nowLevel++;
	levelUpPoint *= levelUpPointScale;//レベル上昇ごとにレベルアップまでの必要ポイントが上昇していく
	createLevelUpTextEffect(120, global.nowLevel);
	setEnemyGenerateSpan();
	global.scoreRatio += SCORERATIOPERLEVEL;
}