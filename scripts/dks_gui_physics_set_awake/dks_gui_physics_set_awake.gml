function dks_gui_physics_set_awake() 
{
	target.phyprops[| physics.awake] = !target.phyprops[| physics.awake];
	dks_input_set_text(input_list[| physics.awake],string(target.phyprops[|physics.awake]));
}