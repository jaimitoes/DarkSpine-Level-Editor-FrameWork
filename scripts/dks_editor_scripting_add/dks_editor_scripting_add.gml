/// @description dks_editor_scripting_add(object, variables[]);
/// @param object
/// @param  variables[]
function dks_editor_scripting_add() 
{
	// Add the variables information into a new key list
	var name = object_get_name(argument[0]),
	l = ds_list_create(),i;
	for(i =1; i<argument_count; i++)
	{
	 l[| i-1] = argument[i];
	}
	ds_map_add_list(var_map,name,l);
}