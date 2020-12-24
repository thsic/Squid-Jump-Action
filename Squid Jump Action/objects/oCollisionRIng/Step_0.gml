
ringSize += 0.8;
ringSize *= 1.02;
ringAlpha -= 0.02;
x -= global.flySpeed;

if(x+ringSize < 0 or ringAlpha < 0){
	instance_destroy();
}
