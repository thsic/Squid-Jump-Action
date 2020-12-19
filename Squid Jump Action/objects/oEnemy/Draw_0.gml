
shTexelHandle = shader_get_uniform(shOutline, "inTexel");
shOutlineColorHandle = shader_get_uniform(shOutline, "outlineColor");

shader_set(shOutline);

var _tex = sprite_get_texture(sprite_index, image_index);
var _tWidth = texture_get_texel_width(_tex)
var _tHeight = texture_get_texel_height(_tex)

if(spike){
	var _r = 1.0;
	var _g = 0.1;
	var _b = 0.1;
}
else{
	var _r = 1.0;
	var _g = 1.0;
	var _b = 1.0;
}
var _a = cos(current_time/300)/6+0.5;

shader_set_uniform_f(shTexelHandle, _tWidth, _tHeight);
shader_set_uniform_f(shOutlineColorHandle, _r, _g, _b, _a);

draw_sprite(sprite_index, image_index, x, y);

shader_reset();

