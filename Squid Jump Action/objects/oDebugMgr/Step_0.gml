
if(mouse_check_button_pressed(mb_right)){
	instance_create_layer(mouse_x, mouse_y, "GameObjects", oRandomEventItem);
}
if(keyboard_check_pressed(ord("R"))){
	game_restart();
}
if(keyboard_check_pressed(vk_backspace)){
	game_restart();
}
if(keyboard_check_pressed(vk_escape)){
	game_end();
}
if(keyboard_check_pressed(ord("W"))){
	debugInfinityJump = !debugInfinityJump;
}
if(keyboard_check_pressed(ord("Q"))){
	debugInvinsible = !debugInvinsible;
}
if(keyboard_check_pressed(ord("E")) and room == rMain){
	gameLevelUp()
}
if(keyboard_check(ord("S")) and room == rMain){
	gainScore(10000, c_white, true, false)
}

if(instance_exists(oPlayer)){
	if(debugInfinityJump){
	
		oPlayer.remainJumpCount = oPlayer.jumpCountBase;
		oPlayer.remainDashCount = oPlayer.dashCountBase;
	}
	if(debugInvinsible){
		setPlayerInvinsibleTime(3);
	}
}