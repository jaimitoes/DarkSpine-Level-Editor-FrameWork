function dks_gui_color_set() 
{
	if(target != noone)
	{
	 blend_color[0] = colour_get_hue(target.image_blend);
	 blend_color[1] = colour_get_saturation(target.image_blend);
	 blend_color[2] = colour_get_value(target.image_blend);
	 menu_setters = setter.color;
 
	}
	else
	{
	 dks_message("You must to select a target");
	}
}