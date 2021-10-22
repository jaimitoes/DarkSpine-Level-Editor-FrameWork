/// @description dks_spine_node_angle()
function dks_spine_node_angle(argument0, argument1) {
	with(argument0)
	{
	 var map = ds_map_create();
	 var scale_factor = sign(image_xscale)*sign(image_yscale);
	 var i = argument1;
	 var obf = obj_deco_creator.ob_ffd[i];
	 var obf_factor = sign(obf.image_xscale)*sign(obf.image_yscale);
	 var scaler = (global.mouse_xd-obf.mouse_startx)*obj_deco_creator.interface[3];
	 skeleton_bone_state_get(bone_list[| i], map);  
	 var angle = obf.anoff+scaler*scale_factor*obf_factor;
	 ds_map_replace(map, "angle", angle);
	 obf.image_angle = angle;
	 skeleton_bone_state_set(bone_list[| i], map);
	 ds_map_destroy(map);
	}
}
