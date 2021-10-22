function dks_spine_node_scale_x(argument0) {
	//dks_spine_node_scale_x(array position)
	var map = ds_map_create();
	var scale_factor = sign(image_xscale)*sign(image_yscale);
	var i = argument0;
	var obf = obj_deco_creator.ob_ffd[i];
	var scaler = (global.mouse_xd- obf.mouse_startx)*obj_deco_creator.interface[2];
	if (obf.target = true)
	{
	 var xscale = obf.xsoffset+scaler*scale_factor;
	 skeleton_bone_state_get(bone_list[| i], map);
	 ds_map_replace(map, "xscale", xscale );
	 obf.image_xscale = xscale; 
	 skeleton_bone_state_set(bone_list[| i], map);
	}  
	ds_map_destroy(map);



}
