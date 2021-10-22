/// @description fixture_create_circle()
function fixture_create_circle() 
{
	// This variable store the id of a created fixture shape 
	fix = physics_fixture_create();
	// Set the radius of our circle based on the higher value of an axis 
	//(If X is higher than Y, the value is getted from this variable... and viceversa)
	if(sprite_width >= sprite_height)
	{
	  physics_fixture_set_circle_shape(fix,(sprite_width/2)*phyprops[| physics.radius]);
	}
	else
	{
	 physics_fixture_set_circle_shape(fix,(sprite_height/2)*phyprops[| physics.radius]);
	}
	// Set the other.id physics properties based on the default values of the structure
	physics_fixture_set_density(fix, phyprops[| physics.dens]);
	physics_fixture_set_restitution(fix, phyprops[| physics.rest]);
	physics_fixture_set_collision_group(fix, phyprops[| physics.group]);
	physics_fixture_set_linear_damping(fix, phyprops[| physics.l_damp]);
	physics_fixture_set_angular_damping(fix, phyprops[| physics.a_damp ]);
	physics_fixture_set_friction(fix, phyprops[| physics.frict]);
	physics_fixture_set_awake(fix, phyprops[| physics.awake]);
	physics_fixture_set_sensor(fix, phyprops[| physics.sensor]);
	// Check the kinematic settings
	if(phyprops[| physics.kine])
	    {
	     physics_fixture_set_kinematic(fix);
	    }
		// Set the sensor variable
	    physics_fixture_set_sensor(fix,phyprops[| physics.sensor]);
		// Set the awake variable
	    physics_fixture_set_awake(fix,phyprops[| physics.awake]);
		// Set the local coordinate of our fixture relative this object
	    b_fixture = physics_fixture_bind_ext(fix, id, -col_xoff, -col_yoff);
	/*
	In the destroy event of a deco object
	physics_fixture_delete(fix);
	physics_fixture_delete(b_fixture);
 /* end fixture_create_circle */
}