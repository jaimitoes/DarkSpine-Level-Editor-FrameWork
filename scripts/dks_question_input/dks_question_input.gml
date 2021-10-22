/// @description dks_question_input(x,y,wid,hei,button_color,button_color_press,text_color,text_color_press,string1,string2);
/// @param x
/// @param y
/// @param wid
/// @param hei
/// @param button_color
/// @param button_color_press
/// @param text_color
/// @param text_color_press
/// @param string1
/// @param string2
function dks_question_input(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) 
{
	// string1 is the text question;
	// string2 is the current value to change;
	with instance_create_depth(0,0,0,obj_question)
	{//Set from the arguments the position, size, the button colors, the button colors pressed, the text colors, the text colors pressed and the text margin.
	 var x1 =    argument0,
	     y1 =    argument1,
	     wid =   argument2+64,
	     hei  =  argument3,
	     b_col = argument4,
	     b_press = argument5,
	     t_col = argument6,
	     t_press = argument7,
	     x_margin = wid/2;
     
    
	 //Set the primary and secondary string to show from the panel
	 string1 = argument8; // While the string match with a question structure (See the script "dks_editor_init"), the confirmation of this panel execute the...
	 //...script stored in the second row of the Question array structure.
	 string2 = argument9; // Aditional data if you want to expand this system
	 //Set the Panel
	 button_rectangle = dks_button_create(x1,y1,wid,hei,x_margin,hei*0.1,b_col,b_press,t_col,t_press,spr_button_question);
	 // Add the confirmation buttons ( Confirm, cancel buttons of the inserted input data... you can confirm by pressing the Key ENTER)
	 button_question = dks_button_create(x1+wid*0.1,y1+hei*0.6,128,32,64,16,b_col,b_press,t_col,t_press,spr_button);
	 var xx = wid -(button_question[0,2]-x1);
	 button_question = dks_button_add_reel(button_question,"right",128,32,64,16,xx-128-wid*0.1,b_col,b_press,t_col,t_press,spr_button);
	 dks_button_add_text(button_question,0,"CANCEL");
	 dks_button_add_text(button_question,1,"CONFIRM");
	 // Create a button that represent the input box
	 button_input_box = dks_button_create(x1+wid*0.1,y1+hei*0.3,wid*0.8,32,4,0,b_col,b_col,t_col,t_press,spr_button);
	 // Create the input logic, the data inserted in this box is interpreted according to the script that we have assigned to the question.
	 input = dks_input_create(button_input_box,0,8,8,string2,fontGGUI);
 }
}