/// @description dks_input_list_create(array button2d, string list or array, visible)
/// @param array button2d
/// @param stringListOrArray
/// @param visible
function dks_input_list_create(argument0, argument1, argument2) 
{
	var button, number,text,b;
	b = ds_list_create();
	button= argument0;
	number = array_length(argument0);
	text = argument1;
 if is_array(argument1)
	{
	 for(var i =0; i<number;i++)
	 {
	  b[| i] = dks_input_create(button,i,0,0,string(text[ i]),fontGGUI);
	  b[| i].visible = argument2;
	 }
	}
	else
	{
	 for(var i =0; i<number;i++)
	 {
   
	  b[| i] = dks_input_create(button,i,0,0,string(text[| i]),fontGGUI);
	  b[| i].visible = argument2;
	 } 
	}
 return b;
}