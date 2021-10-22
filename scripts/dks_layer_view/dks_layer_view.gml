function dks_layer_view(argument0) 
{
	layer_index[argument0][@2] = ! layer_index[argument0][2];
	globalvar laynum;
	globalvar layvis;
	laynum = layer_index[argument0][1];
	layvis = layer_index[argument0][2];
	with (obj_deco)
	{
	 if (lay_depth = laynum)
	 {
	  visible = layvis;
	 }
	}
}