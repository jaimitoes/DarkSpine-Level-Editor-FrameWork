function dks_spine_node_scale_xy(argument0) {
	//Transform xy ffd;
	var map = ds_map_create();
	var scale_factor = sign(image_xscale)*sign(image_yscale);
	var i = argument0;
	var obf = obj_deco_creator.ob_ffd[i];
	var scaler = (global.mouse_xd-obf.mouse_startx)*obj_deco_creator.interface[2]
	if (obf.target = true)
	{
	  var xscale = obf.xsoffset+scaler*scale_factor;
	  var yscale = obf.ysoffset+scaler*scale_factor;
	  skeleton_bone_state_get(bone_list[| i], map);
	  ds_map_replace(map, "xscale", xscale );
	  ds_map_replace(map, "yscale", yscale );
	  obf.image_xscale = xscale; 
	  obf.image_yscale = yscale;
	  skeleton_bone_state_set(bone_list[| i], map);
	}  
	ds_map_destroy(map);




}
