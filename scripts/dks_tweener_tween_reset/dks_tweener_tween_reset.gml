function dks_tweener_tween_reset(argument0) 
{
	with(argument0)
	{
	  dks_sequence_destroy(sequence);
	  sequence = 0;
	  x = xstart;
	  y = ystart;
	  image_xscale = xsoffset;
	  image_yscale = ysoffset;
	  image_angle  = anoff;
	  image_blend = make_colour_hsv(bl_h,bl_s,bl_v);
	  image_alpha = aloff;
	  x_rotation = anoffx;
	  y_rotation = anoffy;
	  depth = zoff;
	}
}