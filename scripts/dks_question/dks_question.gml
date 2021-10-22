/// @description dks_question(x, y, wid, hei, button_color, button_color_press, text_color,text_color_press, string1, string2);
/// @param x
/// @param  y
/// @param  wid
/// @param  hei
/// @param  button_color
/// @param  button_color_press
/// @param  text_color
/// @param text_color_press
/// @param  string1
/// @param  string2
function dks_question(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) 
{
 // Create an Question panel that trigger an action using the button data system...
	// A button system can store scripts that can be triggered, check the button system stored in the script "dks_editor_init".
	with instance_create_depth(0,0,0,obj_question)
	{
	 var x1 =    argument0,
	 y1 =    argument1,
	 wid =   argument2+64,
	 hei  =  argument3,
	 b_col = argument4,
	 b_press = argument5,
	 t_col = argument6,
	 t_press = argument7,
	 x_margin = wid/2;
  //local variable
	 string1 = argument8; // The primary string that shows the panel
	 string2 = argument9;//  The secondary optional string  
 //Create a blank panel using the button system
	 button_rectangle = dks_button_create(x1,y1,wid,hei,x_margin,hei*0.1,b_col,b_press,t_col,t_press,spr_button_question);
	 //You have different way to create a set of button structures, check all scripts that start by "dks_button..."
	 //Create a single button 
	button_question = dks_button_create(x1+wid*0.1,y1+hei*0.6,128,32,64,16,b_col,b_press,t_col,t_press,spr_button);
	 // Set a relative position based on the panel size/position
	 var xx = wid -(button_question[0][2]-x1);
	 // Add a second button to the previous structure using the horizontal coordinate and the assigned width size
	 button_question = dks_button_add_reel(button_question,"right",128,32,64,16,xx-128-wid*0.1,b_col,b_press,t_col,t_press,spr_button);
	 // Add the string to show from the 2 created buttons
	 dks_button_add_text(button_question,0,"CANCEL");
	 dks_button_add_text(button_question,1,"CONFIRM");
	}
}