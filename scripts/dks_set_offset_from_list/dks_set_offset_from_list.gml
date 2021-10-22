/// @description dks_set_offset_from_list( list) 
/// @param  list
function dks_set_offset_from_list(argument0) 
{
	//return : array
	var list = argument0;
	var offset;
	var size = ds_list_size(list);
	for (var i=0;i<size;i+=2)
	{
 
	 offset[ i]   = scr_bind_set_xoffset(id,list[| i],list[| i+1]);
	 offset[ i+1] = scr_bind_set_yoffset(id,list[| i],list[| i+1]);

	}
	return offset;
}