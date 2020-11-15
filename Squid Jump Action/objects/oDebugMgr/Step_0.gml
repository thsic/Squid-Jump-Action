
if(mouse_check_button_pressed(mb_right)){
	instance_create_layer(mouse_x, mouse_y, "GameObjects", oUrchin);
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


if(debugInfinityJump){
	oPlayer.remainJumpCount = oPlayer.jumpCountBase;
	oPlayer.remainDashCount = oPlayer.dashCountBase;
}
if(debugInvinsible){
	setPlayerInvinsibleTime(3);
}