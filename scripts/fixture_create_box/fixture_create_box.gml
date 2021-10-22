/// @description fixture_create_box(halfW, halfH)
/// @param halfW
/// @param  halfH
function fixture_create_box(argument0, argument1) 
{
	// Set a box fixture based on the current sprite image, you can set the scale of the fixture from the editor.
 // Create the fixture ID.
	fix = physics_fixture_create();
	// Set the BoxShape type and multiply the scale with the editor multiplier.
	physics_fixture_set_box_shape(fix,argument0*phyprops[|physics.radius],argument1*phyprops[|physics.radius]);
	// Set the physics properties
	physics_fixture_set_density(fix, phyprops[| physics.dens]);
	physics_fixture_set_restitution(fix,phyprops[| physics.rest] );
	physics_fixture_set_collision_group(fix, phyprops[| physics.group]);
	physics_fixture_set_linear_damping(fix, phyprops[| physics.l_damp]);
	physics_fixture_set_angular_damping(fix, phyprops[| physics.a_damp]);
	physics_fixture_set_friction(fix, phyprops[| physics.frict]);
	if(phyprops[| physics.kine])
	{
	 physics_fixture_set_kinematic(fix);
	}
	physics_fixture_set_sensor(fix,phyprops[| physics.sensor]);
	physics_fixture_set_awake(fix,phyprops[| physics.awake]);
	// Binding the fixture with the current object
	b_fixture =physics_fixture_bind_ext(fix, id, -col_xoff, -col_yoff);
}