

function drawWaterDrop(){
	if(intoSea != intoSeaPrev){
		var _partType = part_type_create();
	
		part_type_sprite(_partType, sCircle8px, false, false, false);
		part_type_life(_partType, 30, 50);
		part_type_speed(_partType, 4, 5, -0.1, 0);
		part_type_direction(_partType, 45, 135, 0, 0);
		part_type_gravity(_partType, 0.2, 270);
		part_type_alpha2(_partType, 1, 0);
		part_type_color1(_partType, c_aqua);
		
		var _partSystem = part_system_create();
		
		part_particles_create(_partSystem, x, y, _partType, 5);
	}
}

//drawWaterDrop()
