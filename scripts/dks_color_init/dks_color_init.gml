function dks_color_init() 
{
	//colors
	dark_gray = make_colour_rgb(84,84,84);
	red_pastel = make_colour_rgb(163,57,57);
	orange_pastel = make_colour_rgb(217,128,41);
	lime_pastel = make_colour_rgb(143,184,94);
	yellow_pastel = make_colour_rgb(214,216,36);
	node_color = make_color_rgb(57,163,149);
	node_b1_color = make_color_rgb(227,174,63);
	node_b2_color = make_color_rgb(167,67,142);
	menu_b_switch = dks_button_reel_create("right",2,129,64,128,32,64,16,4,dark_gray,red_pastel,red_pastel,dark_gray,spr_button);
	dks_button_add_colour(menu_b_switch,1,dark_gray,lime_pastel,lime_pastel,dark_gray);
	dks_button_add_text(menu_b_switch,0,"OFF");
	dks_button_add_text(menu_b_switch,1,"ON");
	blend_color[0]=0;
	blend_color[1]=0;
	blend_color[2]=255;
	blend_color[3]=0;
 bl_h = colour_get_hue(image_blend);
	bl_s = colour_get_saturation(image_blend);
	bl_v = colour_get_value(image_blend);
	////
	//Target color setters
	slider_color = dks_button_reel_create("down",4,140,64,255,32,0,16,4,dark_gray,c_maroon,c_maroon,dark_gray,spr_button_256);
}