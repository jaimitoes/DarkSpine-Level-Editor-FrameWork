/// @description  dks_layer_lock( imput_layer)
/// @param  imput_layer
function dks_layer_lock(argument0) 
{
	layer_index[argument0][@3] = ! layer_index[argument0][3];
	if(obj_deco.lay_depth = layer_index[argument0][1])
	{
	 obj_deco.locked = layer_index[argument0][3];
	 if (obj_deco.locked)
	 {
	  dks_message("Layer :"+layer_index[argument0][0]+" is locked.");
	 }
	 else
	 {
	  dks_message("Layer number "+layer_index[argument0][0]+" is unlocked.");
	 }
	}
}