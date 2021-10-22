/// Rectangle area for multiple selection usage...
function scr_draw_mouse_selector() 
{
 // In multiple select mode, press the right click to create a visible area that select a group of objects.
	if(gui_rectangle)
	{
	 //Draw an outlined rectangle and a filled rectangle with a half-alpha value...
	 draw_set_color(c_lime);//Set the gpu draw colour blending
	 draw_rectangle(Dxoff, Dyoff, Dx, Dy, true);
	 draw_set_alpha(0.5);
	 draw_rectangle(Dxoff, Dyoff, Dx, Dy, false);
	 draw_set_alpha(1);
	 draw_set_color(c_white);//Reset the gpu draw colour blending
	}
}