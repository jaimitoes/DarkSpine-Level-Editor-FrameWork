/// @description dks_spine_node_scale(node, array pos)
/// @param node
/// @param  array pos
function dks_spine_node_scale(argument0, argument1) {
	switch(scale_edit)
	{
	 case "x" : 
	 with(argument0) 
	 {
	  dks_spine_node_scale_x(argument1);
  
	 } 
	 break;
 
	 case "y" : 
	 with(argument0)
	 {
	 dks_spine_node_scale_y(argument1);
	 }
	 break;
 
	 case "xy": 
	 with(argument0)
	 {
	  dks_spine_node_scale_y(argument1);
	 }
	 break;
 
	}



}
