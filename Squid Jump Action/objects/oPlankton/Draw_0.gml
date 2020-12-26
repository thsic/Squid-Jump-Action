

var _sprH = sprite_get_height(sLight);
var _lightSize = power(lightPower, 3) + 16;
var _scale = _lightSize / _sprH;

draw_set_color(color);

draw_sprite_ext(sLight, 0, x, y, _scale, _scale, 0, color, lightAlpha);
draw_circle(x, y, 1, false);
drawSetDefault();
