
#macro FIRSTROOM rTitle
#macro WINDOWWIDTH 990
#macro WINDOWHEIGHT 540
#macro CAMERASCALE 2
#macro GAMEWIDTH WINDOWWIDTH/CAMERASCALE
#macro GAMEHEIGHT WINDOWHEIGHT/CAMERASCALE

#macro MAINROOM rMain
#macro TITLEROOM rTitle

enum DRAWEVENT{
	DRAWBEGIN,
	DRAW,
	DRAWEND,
	DRAWGUIBEGIN,
	DRAWGUI,
	DRAWGUIEND,
}

