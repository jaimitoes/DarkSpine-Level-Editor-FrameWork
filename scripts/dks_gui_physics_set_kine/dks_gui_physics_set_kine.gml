function dks_gui_physics_set_kine() 
{
	target.phyprops[| physics.kine] = !target.phyprops[| physics.kine];
	dks_input_set_text(input_list[| physics.kine],string(target.phyprops[|physics.kine]));
}