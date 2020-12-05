
var _buttonY = room_height*0.7;
var _playStartButtonX = room_width/2;
var _howToPlayButtonX = _playStartButtonX + room_width*0.2 + sprite_get_width(sHowToPlayButton)/2
var _achievementButtonX = _playStartButtonX - room_width*0.2 - sprite_get_width(sAchievementButton)/2;

createButton(sPlayStartButton, _playStartButtonX, _buttonY, pressedPlayStartButton, 0, DRAWEVENT.DRAW);
createButton(sHowToPlayButton, _howToPlayButtonX, _buttonY, pressedHowToPlayButton, 1, DRAWEVENT.DRAW);
createButton(sAchievementButton, _achievementButtonX, _buttonY, pressedAchievementButton, 2, DRAWEVENT.DRAW);

buttonActive = false;
pressedButton = noone;

instance_create_layer(0, 0, "Instances", oCamera);
