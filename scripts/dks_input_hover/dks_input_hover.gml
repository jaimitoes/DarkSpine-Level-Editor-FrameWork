/// @description dks_input_hover()    
function dks_input_hover() 
{
	//get inputbox field ends
	var x1, y1, x2;
	x1 = x+xoffset;
	y1 = y+yoffset;
	x2 = (x+width)-xoffset;
	//set font
	draw_set_font(font)
	//cursor positions
	var cx1, cx2, curx1, curx2;
	cx1 = clamp(x1+string_width(string_copy(text, 0, cursor_pos))-scroll, x1, x2);
	cx2 = clamp(x1+string_width(string_copy(text, 0, cursor_pos2))-scroll, x1, x2);
	curx1 = min(cx1, cx2);
	curx2 = max(cx1, cx2);
	//menu
	var y1, mtxt, mx, my;
	y1 = y+yoffset;
	mtxt = round(curx1+((curx2-curx1)/2));
	mx = mtxt+menu_x;
	my = y1+menu_y;
	//test mouse hover
	return point_in_rectangle(global.mouse_xd, global.mouse_yd, mx, my, mx+menu_width, my+menu_height)
}