/// @description dks_button_add_reel(Array 2d id, direction, width, heigth, x_margin, y_margin, space_between, button_color, button_color_press, text_color, text_color_press,sprite)
/// @param Array 2d id
/// @param  direction
/// @param  width
/// @param  heigth
/// @param  x_margin
/// @param  y_margin
/// @param  space_between
/// @param  button_color
/// @param  button_color_press
/// @param  text_color
/// @param  text_color_press
/// @param sprite
function dks_button_add_reel(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
	var a,dir,i,wid,hei,space,b_col,b_press,t_col,t_press,spr;
	/*
	[i][10] = text;
	[i][11] = script;
 
	*/
	if (is_array(argument0))
	{
	a = argument0;
	i = array_length(a);
	dir = argument1;
	wid = argument2;
	hei = argument3;
	xf  = argument4;
	yf  = argument5; 
	space = argument6;
	b_col = argument7;
	b_press = argument8;
	t_col = argument9;
	t_press = argument10;
	spr = argument11;
	var x1 = a[i-1][0];
	var y1 = a[i-1][1];
	var x2 = a[i-1][2];
	var y2 = a[i-1][3];

	switch(dir)
	{
	  case "up":
	             a[i][0] =  x1;
	             a[i][1] =  y1 -hei-space;
	             a[i][2] =  x2+wid;
	             a[i][3] =  y2 -hei-space;
	             a[i][4] =  xf;
	             a[i][5] =  yf;
	             a[i][6] =  b_col;
	             a[i][7] =  b_press;
	             a[i][8] =  t_col;
	             a[i][9] =  t_press;
	             a[i][10] = "*";
	             a[i][12] = a[i][0]+a[i][4];
	             a[i][13] = a[i][1]+a[i][5];
	             a[i][14] = 0;
	             a[i][15] = spr;
             
            
	            break;
            
	  case "down" :
	             a[i][0] = x1;
	             a[i][1] = y1 +hei +space;
	             a[i][2] = x2;
	             a[i][3] = y2 + hei+space;
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
             
            
	            break;
	  case "right" :
           
	             a[i][0] = x2 + space;
	             a[i][1] = y1;
	             a[i][2] = x2 + space +wid;
	             a[i][3] = y2;
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
             
            
	            break;
	  case "left" :
            
	             a[i][0] = x1 -wid -space;
	             a[i][1] = y1;
	             a[i][2] = x1 - space;
	             a[i][3] = y1;
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
             
          
	            break;

	}
 return a;
	}
	else
	{
	 show_error("Array id does not exist",1);
	}




}
