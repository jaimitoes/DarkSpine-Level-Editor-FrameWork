/// @description dks_button_create(start_x, start_y, width, heigth, x_margin, y_margin, button_color, button_color_press, text_color, text_color_press, sprite)
/// @param start_x
/// @param start_y
/// @param width
/// @param heigth
/// @param x_margin
/// @param y_margin
/// @param button_color
/// @param button_color_press
/// @param text_color
/// @param text_color_press
/// @param sprite
function dks_button_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) 
{
	var a,start_x,start_y,wid,hei,b_col,b_press,t_col,t_press,spr;
	/*
	[i,10] = text data, call dks_button_add_text;
	[i,11] = script id, call dks_button_add_script;
 
	*/
 start_x = argument0;
	start_y = argument1;
	wid = argument2;
	hei = argument3;
	xf  = argument4;
	yf  = argument5; 
	b_col = argument6;
	b_press = argument7;
	t_col = argument8;
	t_press = argument9;
	spr = argument10;

	a[0][0] = start_x; 
	a[0][1] =  start_y;
	a[0][2] = start_x + wid;
	a[0][3] = start_y + hei;
	a[0][4] = xf;//xf+ (a[0,2]-a[0,0])*0.5;
	a[0][5] = yf;
	a[0][6] = b_col;
	a[0][7] = b_press;
	a[0][8] = t_col;
	a[0][9] = t_press;
	a[0][10] = "*";
	a[0][12] = a[0][0]+a[0][4];
	a[0][13] = a[0][1]+a[0][5];
	a[0][14] = 0; 
	a[0][15] = spr;//Sprite data
	return a;
}