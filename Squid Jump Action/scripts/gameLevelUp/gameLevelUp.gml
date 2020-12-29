// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gameLevelUp(){
	if(global.nowLevel < MAXLEVEL){
		global.nowLevel++;
		oGameMgr.levelUpPoint *= oGameMgr.levelUpPointScale;//レベル上昇ごとにレベルアップまでの必要ポイントが上昇していく
		createLevelUpTextEffect(120, global.nowLevel);
		setEnemyGenerateSpan();
		
		//現在レベルが5で割り切れる場合に難易度上昇
		if(global.nowLevel mod 5 == 0){
			global.scoreRatio += SCORERATIOPERLEVEL*5;//スコアレシオ上昇
			oGameMgr.makeBarrierCountBase++;//バリア生成までのカウント上昇
			global.makeBarrierCount++;//レベル上昇時にバリアカウントも上げる、ちょっとだけやさしくない感じ
		}
		
	}
}