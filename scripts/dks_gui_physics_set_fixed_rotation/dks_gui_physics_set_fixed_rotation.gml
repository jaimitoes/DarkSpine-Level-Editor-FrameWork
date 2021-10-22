function dks_gui_physics_set_fixed_rotation() 
{
	target.phyprops[| physics.fixed_rotation] = !target.phyprops[| physics.fixed_rotation];
	dks_input_set_text(input_list[| physics.fixed_rotation],string(target.phyprops[|physics.fixed_rotation]));
}