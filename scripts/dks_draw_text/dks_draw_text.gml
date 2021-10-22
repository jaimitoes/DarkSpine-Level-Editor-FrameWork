function dks_draw_text() 
{
	draw_set_font(current_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext_transformed_colour(x,y,text,16,camera_get_view_width(Cam),image_xscale*1.05,image_yscale*1.05,image_angle,c_black,c_black,c_black,c_black, 0.3);
	draw_text_ext_transformed_colour(x,y,text,16,camera_get_view_width(Cam),image_xscale,image_yscale,image_angle,image_blend,image_blend,image_blend,image_blend,image_alpha);
 draw_set_font(previous_font);
}