/// @description dks_map_from_json(filename)
/// @param filename
function dks_map_from_json(argument0) 
{
	var m = undefined;
	if(file_exists(argument0))
	{
	 var buf = buffer_load(argument0);
    
	    var s = buffer_read(buf,buffer_string);
    
	     m = json_decode(s);
    
	    buffer_delete(buf);
	}

	return m;
}