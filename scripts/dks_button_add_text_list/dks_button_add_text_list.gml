function dks_button_add_text_list(argument0, argument1) 
{
	var s = array_length(argument0);
	for(var i =0; i<s; i++)
	{
	 argument0[i][@10] = argument1[| i];
	}
}