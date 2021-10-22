/// @description dks_button_reel_create(direction,numbers,start_x,start_y,width,heigth,x_margin, y_margin,space_between,button_color, button_color_press, text_color, text_color_press, sprite)
/// @param direction
/// @param numbers
/// @param start_x
/// @param start_y
/// @param width
/// @param heigth
/// @param x_margin
/// @param  y_margin
/// @param space_between
/// @param button_color
/// @param  button_color_press
/// @param  text_color
/// @param  text_color_press
/// @param  sprite
function dks_button_reel_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13) 
{
	/* You can add aditional data into this structure calling the scripts "dks_button_add_..." library. */
	var a,dir,number,start_x,start_y,wid,hei,space,b_col,b_press,t_col,t_press,spr;
	dir = argument0;
	number = argument1;
	start_x = argument2;
	start_y = argument3;
	wid = argument4;
	hei = argument5; 
	xf  = argument6; // X text margin
	yf  = argument7; // Y text margin
	space = argument8; // Space between buttons
	b_col = argument9; 
	b_press = argument10;
	t_col = argument11;
	t_press = argument12;
	spr = argument13;
 switch(dir)
	{
	 case "up":
	 for (var i =0; i<number;i++)
	 {
	  a[i][0] = start_x; // Top left X cord
	  a[i][1] =  start_y - hei -(hei*i)-space; //Top left Y cord
	  a[i][2] = start_x + wid; // Down right X cord
	  a[i][3] = start_y -(hei*i); // Down right Y cord
	  a[i][4] = xf; // X text margin
	  a[i][5] = yf; // Y text margin
	  a[i][6] = b_col; // The regular button colour
	  a[i][7] = b_press; // The button colour while we are pressing
	  a[i][8] = t_col;  // The regular text colour 
	  a[i][9] = t_press; //The text colour while we are pressing
	  a[i][10] = ""; //Text data
			a[i][11] = dks_null;//Script data
	  a[i][12] = a[i][0] +a[i][4]; //Draw data
	  a[i][13] = a[i][1]+a[i][5];
	  a[i][14] = 0;
	  a[i][15] = spr; // Sprite data
	 }
	 break;
  case "down" :
  for (var i =0; i<number;i++)
	 {
	  a[i][0] = start_x;
	  a[i][1] = start_y +hei*i+space;
	  a[i][2] = start_x + wid;
	  a[i][3] = start_y + hei +(hei*i);
	  a[i][4] = xf;
	  a[i][5] = yf;
	  a[i][6] = b_col;
	  a[i][7] = b_press;
	  a[i][8] = t_col;
	  a[i][9] = t_press;
	  a[i][10] = "";
			a[i][11] = dks_null;//Script data
	  a[i][12] = a[i,0]+a[i,4];
	  a[i][13] = a[i,1]+a[i,5];
	  a[i][14] = 0;
	  a[i][15] = spr;
  }
	           break;
	 case "right" :
	 for (var i =0; i<number;i++)
	 {
	  a[i][0] = start_x + (wid*i)+ space;
	  a[i][1] = start_y;
	  a[i][2] = start_x +wid + (wid*i);
	  a[i][3] = start_y + hei;
	  a[i][4] = xf;
	  a[i][5] = yf;
	  a[i][6] = b_col;
	  a[i][7] = b_press;
	  a[i][8] = t_col;
	  a[i][9] = t_press;
	  a[i][10] = "";
			a[i][11] = dks_null;//Script data
	  a[i][12] = a[i][0]+a[i][4];
	  a[i][13] = a[i][1]+a[i][5];
	  a[i][14] = 0;
	  a[i][15] = spr;
  }
	 break;
	 case "left" :
	 for (var i =0; i<number;i++)
	 {
	  a[i][0] =  start_x -wid - (wid*i)-space;
	  a[i][1] = start_y;
	  a[i][2] = start_x - (wid*i);
	  a[i][3] = start_y + hei;
	  a[i][4] = xf;
	  a[i][5] = yf;
	  a[i][6] = b_col;
	  a[i][7] = b_press;
	  a[i][8] = t_col;
	  a[i][9] = t_press;
	  a[i][10] = "";
	  a[i][11] = dks_null;//Script data
	  a[i][12] = a[i][0]+a[i][4];
	  a[i][13] = a[i][1]+a[i][5];
	  a[i][14] = 0;
	  a[i][15] = spr;
		}
	 break;
	}
 return a;
}