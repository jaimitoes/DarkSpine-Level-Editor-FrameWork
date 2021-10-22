/// @description dks_input_menu_resize
function dks_input_menu_resize() 
{
	draw_set_font(font);
	var t = string_height("AA");
	menu_width = 0;
	for (i = 0; i < menu_length; i += 1)
	{
	 if (menu_sets[i][4])
	 {
	  menu_width += string_width(menu_sets[i][0])+scratch_pad*2;
	 }
	}
	menu_height = t+(scratch_pad*2);
	menu_x = round(-menu_width/2);
	menu_y = (-menu_yoffset)-menu_height;
	var xx;
	xx = 0;
	for (i = 0; i < menu_length; i += 1)
	{
	 if (menu_sets[i][4])
	 {
	  menu_sets[i][1] = round(scratch_pad+xx);
	  menu_sets[i][2] = round(menu_sets[i][1]+string_width(menu_sets[i][0]));
	  if (i > menu_first_set)
	  {
	   menu_sets[i][3] = xx;
	  }
	  xx += string_width(menu_sets[i][0])+(scratch_pad*2);
	 }
	}
}