function dks_gui_physics_set_sensor() 
{
	target.phyprops[| physics.sensor] = !target.phyprops[| physics.sensor];
	dks_input_set_text(input_list[| physics.sensor],string(target.phyprops[|physics.sensor]));
}