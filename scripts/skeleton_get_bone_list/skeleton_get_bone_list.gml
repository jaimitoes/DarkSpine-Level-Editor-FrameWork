/// @description skeleton_get_bone_list(json_file)...
/// @param json_file
function skeleton_get_bone_list() {
	// Get the a list retrieving the bones data names...
	var n = sprite_get_name(sprite_index);
	var l = ds_list_create();
	var bone_map = dks_map_from_json(working_directory+"DarkSpine\\SpineJson\\"+n+".json");
	var map_name;
	var name;
	var bones = bone_map[? "bones"];
	var size = ds_list_size(bones);
	for (var i = 0;i<size;i++)
	{
	 map_name = bones[| i];
	 name = map_name[? "name"];

	 ds_list_add(l,name);
	}
	ds_map_destroy(bone_map);
	return l;




}
