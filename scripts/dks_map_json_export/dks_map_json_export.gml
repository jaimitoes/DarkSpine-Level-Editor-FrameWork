/// @description dks_map_json_export( map, folder ubication)
/// @param  map
/// @param  folder ubication
function dks_map_json_export(argument0, argument1) 
{
	var m = argument0;
	if file_exists(argument1)
	{
	 file_delete(argument1);
	}
 var json = json_encode(m);
	var buffer = buffer_create(1024,buffer_grow,1)
	buffer_write(buffer,buffer_string,json);
	buffer_save(buffer,argument1);
	buffer_delete(buffer);
}