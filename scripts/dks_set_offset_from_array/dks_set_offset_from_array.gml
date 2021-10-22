/// @description dks_set_offset_from_array( array) 
/// @param  array
function dks_set_offset_from_array(argument0) 
{
	//return : array
	var a = argument0;
	var offset;
	var size = array_length(a);
	for (var i=0;i<size;i+=2)
	{
	 offset[ i]   = scr_bind_set_xoffset(id,a[ i],a[ i+1]);
	 offset[ i+1] = scr_bind_set_yoffset(id,a[ i],a[ i+1]);
	}
	return offset;
}