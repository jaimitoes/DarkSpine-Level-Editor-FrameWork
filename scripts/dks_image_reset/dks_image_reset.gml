function dks_image_reset() 
{
	image_xscale =1;
	image_yscale =1;
	image_angle =0;
	image_alpha = 1;
	image_speed =0;
	image_index =0;
	x_rotation =0;
	y_rotation =0;
	dks_spine_node_destroy();
	dks_spine_set_frame0();
	if(parent)
	{
	 dks_child_transform();
	}
	dks_tween_set_offset(id);
	image_blend = make_colour_hsv(bl_h,bl_s,bl_v);
}