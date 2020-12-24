
event_inherited();

if(collided){
	subimage = 1;
	outlineEnable = false;
	
	if(!ringCreate){
		ringCreate = true;
		instance_create_layer(x, y, "Effects", oCollisionRIng);
	}
}