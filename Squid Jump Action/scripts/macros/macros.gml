
#macro FIRSTROOM rTitle
#macro WINDOWWIDTH 990
#macro WINDOWHEIGHT 540
#macro CAMERASCALE 2
#macro GAMEWIDTH WINDOWWIDTH/CAMERASCALE
#macro GAMEHEIGHT WINDOWHEIGHT/CAMERASCALE
#macro SEALEVEL 100
#macro GROUNDPOS room_height-32

#macro MAINROOM rMain
#macro TITLEROOM rTitle

//アイテム
#macro MAXSPEEDLEVEL 10
#macro MAXINFINITEJUMPTIME 600
#macro SPEEDUPRATIOPERLEVEL 1.15
#macro DECREASESPEEDLEVEL 3//ダメージを受けた時に減るスピードレベル
#macro THROUGHSPEEDUPCOUNTLIMIT 3//スピードアップアイテムをスルーできる回数 これを超えてスルーするとスピードが減る

//

enum DRAWEVENT{
	DRAWBEGIN,
	DRAW,
	DRAWEND,
	DRAWGUIBEGIN,
	DRAWGUI,
	DRAWGUIEND,
}

