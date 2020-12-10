
var _sprWidth = sprite_get_width(object_get_sprite(oShark));
instance_create_layer(room_width+_sprWidth, y, "GameObjects", oShark);
instance_destroy();
