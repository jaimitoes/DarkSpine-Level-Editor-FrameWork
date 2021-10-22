function dks_menu_grid_init() 
{
	// grid setters
	grid_width = 128;
	grid_height= 128;
	grid_color = c_white;
	slider_grid = dks_button_reel_create("down",5,129,96,255,32,128,16,4,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button_256);
	dks_button_add_text(slider_grid, 0, "GRID COLOR");
	dks_button_add_text(slider_grid, 1, "GRID SATURATION");
	dks_button_add_text(slider_grid, 2, "GRID LUMINOSITY");
	dks_button_add_text(slider_grid, 3, "GRID WIDTH");
	dks_button_add_text(slider_grid, 4, "GRID HEIGHT");
	slider_grid_int = dks_button_reel_create("down",5,129+256,96,128,32,8,0,4,dark_gray,dark_gray,grid_color,dark_gray,spr_button);
	for (var i =0;i<5;i++)
	{ 
	 slider_val[i] =0;
	} 
	slider_val[@3] = 128;
	slider_val[@4] = 128; 
}