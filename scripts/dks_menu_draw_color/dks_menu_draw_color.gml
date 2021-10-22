/// @description dks_menu_draw_color(slider, color array)
/// @param slider
/// @param  color array
function dks_menu_draw_color(argument0, argument1) 
{
	var slider = argument0;
	var bcolor = argument1;
	var h,s,v,c;
	c = make_color_hsv(bcolor[0],bcolor[1],bcolor[2]);
	for (var i =0;i<256;i++)
	{
	 h = make_color_hsv(i,255,255);
	 draw_line_colour(slider[0][0]+i, slider[0][1], slider[0][0]+i, slider[0][3], h, h);
	 s = make_color_hsv(bcolor[0], i, bcolor[2]);
	 draw_line_colour(slider[1][0]+i, slider[1][1], slider[1][0]+i, slider[1][3], s, s);
	 v = make_color_hsv(bcolor[0], bcolor[1], i);
	 draw_line_colour(slider[2][0]+i, slider[2][1], slider[2][0]+i, slider[2][3], v, v);
	}

	for (var i =0;i<3;i++)
	{
  draw_rectangle(slider[i][0],slider[i][1],slider[i][2],slider[i][3],true);
	 draw_rectangle_colour(slider[i][0]+bcolor[i]-1, slider[i][1], slider[i][0]+bcolor[i]+1, slider[i][3],c_white,c_white,c_white,c_white,true);
	}
	draw_text(slider[0][2]-32, slider[0][1]+16, " H : "+string(bcolor[0]));
	draw_text(slider[1][2]-32, slider[1][1]+16, " S : "+string(bcolor[1]));
	draw_text(slider[2][2]-32, slider[2][1]+16, " V : "+string(bcolor[2]));
 draw_rectangle_colour(slider[3][0], slider[3][1], slider[3][2], slider[3][3], c, c, c, c, false);
}