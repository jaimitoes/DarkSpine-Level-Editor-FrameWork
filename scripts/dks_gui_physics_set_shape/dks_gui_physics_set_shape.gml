function dks_gui_physics_set_shape() 
{
	switch(target.phyprops[| physics.shape])
	{
 
	 case "Chain": target.phyprops[| physics.shape] = "Polygon";break;
	 case "Polygon" : target.phyprops[| physics.shape] = "Circle";break;
	 case "Circle": target.phyprops[| physics.shape] = "Chain";break;
	}
	dks_input_set_text(input_list[| physics.shape],target.phyprops[|physics.shape]);
}