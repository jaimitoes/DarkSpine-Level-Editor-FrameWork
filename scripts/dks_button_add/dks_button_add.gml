/// @description dks_button_add(Array 2d id, startx, starty, width, heigth, x_margin, y_margin, button_color, button_color_press, text_color, text_color_press, sprite)
/// @param Array2d
/// @param  startx
/// @param  starty
/// @param  width
/// @param  heigth
/// @param  x_margin
/// @param  y_margin
/// @param  button_color
/// @param  button_color_press
/// @param  text_color
/// @param  text_color_press
/// @param  sprite
/*
	[i,10] = text;
	[i,11] = script;
*/
function dks_button_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) 
{
	var a,i,start_x,start_y,wid,hei,xf,yf,b_col,b_press,t_col,t_press,spr;
	if (is_array(argument0))
	{
		a = argument0;
		i = array_length(a);
		start_x = argument1;
		start_y = argument2;
		wid = argument3;
		hei = argument4;
		xf  = argument5;
		yf  = argument6; 
		b_col = argument7;
		b_press = argument8;
		t_col = argument9;
		t_press = argument10;
		spr = argument11;

		a[i][0] = start_x;
		a[i][1] =  start_y;
		a[i][2] = start_x + wid;
		a[i][3] = start_y + hei;
		a[i][4] = xf;
		a[i][5] = yf;
		a[i][6] = b_col;
		a[i][7] = b_press;
		a[i][8] = t_col;
		a[i][9] = t_press;
		a[i][10] = "*";
		a[i][12] = a[i][0]+a[i][4];
		a[i][13] = a[i][1]+a[i][5];
		a[i][14] = 0;
		a[i][15] = spr;
		return a;
	}
	else
	{
	 show_error("Array id does not exist",1);
	}
}