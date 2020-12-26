
effectTime = 0;
drawScore = 0;
surfaceNumber = -1;

if(!variable_global_exists("scoreSurface")){
	for(var i=0; i<3; i++){
		global.scoreSurface[i] = noone;
		global.scoreSurfDrawing[i] = false;
	}
}

for(var i=0; i<3; i++){
	//開いてる所探す
	if(global.scoreSurfDrawing[i] = false){
		global.scoreSurfDrawing[i] = true;
		surfaceNumber = i;
		break;
	}
}

if(surfaceNumber == -1){
	//スコアが既に3つ描画されてる
	instance_destroy();
	
}