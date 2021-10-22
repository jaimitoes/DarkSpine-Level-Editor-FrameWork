/// @description dks_draw_rectangle_sprite(x1, y1, wid, hei, spr, colour, alpha);
/// @param x1
/// @param  y1
/// @param  wid
/// @param  hei
/// @param  spr
/// @param  colour
/// @param  alpha
function dks_draw_rectangle_sprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6) 
{
	//corners
	var rw, rh;
	rw = sprite_get_width(argument4);
	rh = sprite_get_height(argument4);
	draw_sprite_ext(argument4, 0, argument0, argument1, 1, 1, 0, argument5, argument6);
	draw_sprite_ext(argument4, 1, argument0+(argument2-rw), argument1, 1, 1, 0, argument5, argument6);
	draw_sprite_ext(argument4, 2, argument0, argument1+(argument3-rh), 1, 1, 0, argument5, argument6);
	draw_sprite_ext(argument4, 3, argument0+(argument2-rw), argument1+(argument3-rh), 1, 1, 0, argument5, argument6);
	var cx1, cy1, cx2, cy2;
	cx1 = argument2/rw;
	cy1 = (argument3-(rh*2))/rh;
	cx2 = (argument2-(rw*2))/rw;
	cy2 = argument3/rh;
	draw_sprite_ext(argument4, 4, argument0, argument1+rh, cx1, cy1, 0, argument5, argument6);
	draw_sprite_ext(argument4, 4, argument0+rw, argument1, cx2, cy2, 0, argument5, argument6);
}