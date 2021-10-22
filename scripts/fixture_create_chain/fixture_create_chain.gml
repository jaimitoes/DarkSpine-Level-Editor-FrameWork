/// @description fixture_create_chain(list to pass,  true =closed false = open)
/// @param list to pass
/// @param   true =closed false = open
/// Create a chain fixture based on its polygon points
function fixture_create_chain(argument0, argument1) 
{
 // Create a fixture ID
	fix = physics_fixture_create();
	// Set the fixture type, in this case a chain fixture
	//...And also set if our vertices forms a closed/nonClosed polygon.
	physics_fixture_set_chain_shape(fix, argument1);
	// Get the id of our current polygon list
	var l = argument0;
	// Reverse the polygon list if our object contains a negative scale
	if(image_xscale <0)
	{
	 ds_list_reverse(l);
	}
	// Get the size of our polygon list
	var s = ds_list_size(argument0);
	// 
	var xf,yf;
	// Set a custom intial offset for the first collidable vertex.
	xf = (l[| 0]+corner1_xoff)*image_xscale;
	yf = (l[| 1]+corner1_yoff)*image_yscale;
	// Add the first point
	physics_fixture_add_point(fix, xf, yf);
	// Loop trought the other.id vertices to set its coordinates
	for (var i=2; i<s-2; i+=2) 
	{
	 xf = l[| i]*image_xscale;
	 yf = l[| i+1]*image_yscale;
	 physics_fixture_add_point(fix, xf, yf);
	}
	// Set a custom intial offset for the last collidable vertex.
	xf = (l[| s-2]+corner2_xoff)*image_xscale;
	yf = (l[| s-1]+corner2_yoff)*image_yscale;
	physics_fixture_add_point(fix, xf, yf);
	////////////////////////////////////////////////////////////////
	// Set the physics properties from the default customised physics variables stored on the list "phyprops".
	// Aditional data: Take a look into the script "dks_phyprops_create" to set a physics object compatible with DarkSpine
	physics_fixture_set_density(fix, phyprops[| physics.dens]);
	physics_fixture_set_restitution(fix, phyprops[| physics.rest]);
	physics_fixture_set_collision_group(fix, phyprops[| physics.group]);
	physics_fixture_set_linear_damping(fix, phyprops[| physics.l_damp]);
	physics_fixture_set_angular_damping(fix, phyprops[| physics.a_damp]);
	physics_fixture_set_friction(fix, phyprops[| physics.frict]);
	physics_fixture_set_awake(fix, phyprops[| physics.awake]);
	physics_fixture_set_sensor(fix, phyprops[| physics.sensor]);
	// Set the kinematic settings
	if(phyprops[| physics.kine])
	{
	 physics_fixture_set_kinematic(fix);
	}
	// Set the sensor settings    
	physics_fixture_set_sensor(fix, phyprops[| physics.sensor]);
	// Set if our deco objects starts awake in its physics simulation.    
	physics_fixture_set_awake(fix,phyprops[| physics.awake]);
	// Bind the fixture relative to the setted coordinates
	b_fixture = physics_fixture_bind_ext(fix, id, -col_xoff*image_xscale, -col_yoff*image_yscale);
}