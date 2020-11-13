//gameState変更、実際の処理はoGameMgrのendstep
function changeGameState(_state){
	
	var _changeState = true;
	//同じフレームで別のステートにする処理が入っている場合優先度をつける
	if(global.nextState != noone and global.nextState != _state){
		var _state1PriorityScore, _state2PriorityScore
		switch(_state){
		case GAMESTATE.STAGESTART:
			_state1PriorityScore = 100;
		break
		case GAMESTATE.GAMEOVER:
			_state1PriorityScore = 80;
		break
		case GAMESTATE.PAUSE:
			_state1PriorityScore = 60;
		break
		case GAMESTATE.MAIN:
			_state1PriorityScore = 20;
		break
		}
		
		switch(global.nextState){
		case GAMESTATE.STAGESTART:
			_state2PriorityScore = 100;
		break
		case GAMESTATE.GAMEOVER:
			_state2PriorityScore = 80;
		break
		case GAMESTATE.PAUSE:
			_state2PriorityScore = 60;
		break
		case GAMESTATE.MAIN:
			_state2PriorityScore = 20;
		break
		}
		
		//比較して最初に入っていたステートのほうがプライオリティが高い場合nextStateは変更されない
		if(_state1PriorityScore < _state2PriorityScore){
			_changeState = false;
		}
	}
	
	if(_changeState){
		global.nextState = _state;
	}
	
	return _changeState
}