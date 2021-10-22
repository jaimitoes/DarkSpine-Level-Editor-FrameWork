/// @description dks_layer_select(input press)
/// @param input press
function dks_layer_select(argument0) 
{
	lay_depth = layer_index[argument0][1];
	depth = lay_depth;
	dks_cam_update_z(obj_cam_editor,camera_get_view_x(Cam), camera_get_view_y(Cam),lay_depth);
	dks_message("CREATOR POSITIONED IN layer name: "+layer_index[argument0][0]);
}