if is_array(variables)
{
 level_folder = variables[0];
 level_name = variables[1];
} 

var f = working_directory + "DarkSpine\\Levels\\"+level_folder+"\\"+level_name+".json";

if file_exists(f)
{
 dks_level_load(level_folder,level_name);
}
alarm[0] = -1;

