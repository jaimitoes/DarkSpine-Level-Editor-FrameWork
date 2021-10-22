/// @description dks_darkspine_updater( folder)
/// @param  folder
function dks_darkspine_updater(argument0) 
{
	var folder = argument0;
	var file;
	file = file_find_first(working_directory + "DarkSpine\\Levels\\"+folder+"\\*.json", 0);
	show_debug_message(file);
	while(file != "")
	{
	 if (file != "LEVEL_LIST.json")
	 {
	  var buffer_level = buffer_load(working_directory + "DarkSpine\\Levels\\"+folder+"\\"+file);
	  var js1 = buffer_read(buffer_level,buffer_string);
	  var map = json_decode(js1);
	  buffer_delete(buffer_level);   
	  /////////////////////////////////////////////////////////////////////////UPDATES
	  var a = array_length(upgrade);
	  for( var i =0; i<a;i++)
	  {
	   if(dk_version < upgrade[i][0])
	   {
	    script_execute(upgrade[i][1],map);
	   }
	  }
	  /////////////////////////////////////////////////////////////////////////END
	  var encode = json_encode(map);
	  file_delete(working_directory + "DarkSpine\\Levels\\"+folder+"\\"+file);
	  var buffer = buffer_create(1024,buffer_grow,1);
	  buffer_write(buffer,buffer_string,encode);
  
	  buffer_save(buffer,working_directory + "DarkSpine\\Levels\\"+folder+"\\"+file);
	  buffer_delete(buffer);
	  ds_map_destroy(map);
	 }
	 file = file_find_next();
	} 
}