function dks_gui_physics_set_active() 
{
	target.phyprops[| physics.active] = !target.phyprops[| physics.active];
	dks_input_set_text(input_list[| physics.active],string(target.phyprops[|physics.active]));
}