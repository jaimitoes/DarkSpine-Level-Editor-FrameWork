///Creates a default data structure to manage physics properties from the editor/game of our application
function dks_phyprops_create() 
{
	phyprops = ds_list_create();
	phyprops[| physics.shape] = "Chain";
	phyprops[| physics.dens]  = 0;
	phyprops[| physics.rest]  = 0.1;
	phyprops[| physics.group] = 1;
	phyprops[| physics.l_damp] = 0.1;
	phyprops[| physics.a_damp] = 0.1;
	phyprops[| physics.frict] = 0.2;
	phyprops[| physics.awake] = true;
	phyprops[| physics.sensor] = false;
	phyprops[| physics.kine] = false;
	phyprops[| physics.fixed_rotation] = false;
	phyprops[| physics.joint_type] = "disabled";
	phyprops[| physics.active] = true;
	phyprops[| physics.radius] = 1;
	is_physics = true;
}