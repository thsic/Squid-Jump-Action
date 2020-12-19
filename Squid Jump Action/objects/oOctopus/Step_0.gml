

lifeTime++;

var _acPos = lifeTime mod swimSpan;
_acPos = (_acPos / swimSpan);

var _channel = animcurve_get_channel(acOctopusSwimSpeed, 0);
swimSpeed = animcurve_channel_evaluate(_channel, _acPos) * swimSpeedMax;

//subimage
if(image_index = image_number){
	image_speed = 0;
}
if(lifeTime mod swimSpan = 0){
	image_speed = imageSpeedBase;
	image_index = 0;
}


event_inherited();





