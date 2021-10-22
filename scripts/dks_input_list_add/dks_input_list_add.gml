/// @description dks_input_list_add(array button2d,string list or array, input_list)
/// @param array button2d
/// @param string list or array
/// @param  input_list
function dks_input_list_add(argument0, argument1, argument2) 
{
	var button, number,text,list,size;
 button= argument0;
	number = array_length(argument0);
	text = argument1;
	list = argument2;
	size = ds_list_size(list);
	if is_array(argument1)
	{
	 for(var i =0; i<number;i++)
	 {
	  list[| i+size] = dks_input_create(button,i,0,0,string(text[ i]),fontGGUI,);
	 }
	}
	else
	{
	 for(var i =0; i<number;i++)
	 {
   
	  list[| i+size] = dks_input_create(button,i,0,0,string(text[ i]),fontGGUI);
	 } 
	}
}