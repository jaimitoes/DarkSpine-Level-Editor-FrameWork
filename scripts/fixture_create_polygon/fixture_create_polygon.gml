/// @description fixture_create_polygon(polygon_list)
/// @param polygon_list
function fixture_create_polygon(argument0) 
{
 //Get the polygon list
	var l = argument0;
	//Reverse the list with a negative scale
	if (image_xscale<0)
	{
	 ds_list_reverse(l);
	}
	//Check if our polygon is convex, a regular polygon.
	if polygon_is_convex(l)
	{   
	 //Create a fixture ID	
	 fix = physics_fixture_create();
	 // Set the polygon type
	 physics_fixture_set_polygon_shape(fix);
	 // Get the size of our list of points
	 var size = ds_list_size(l);
	 //Set the local coordinates points
	 for (var i=0; i<size; i+=2)   
	 {
	  var xf = l[| i]*image_xscale;
	  var yf = l[| i+1]*image_yscale;
	  physics_fixture_add_point(fix, xf, yf);
	 }
	 // Set the physics properties
	 physics_fixture_set_density(fix, phyprops[| physics.dens]);
	 physics_fixture_set_restitution(fix, phyprops[| physics.rest]);
	 physics_fixture_set_collision_group(fix, phyprops[| physics.group]);
	 physics_fixture_set_linear_damping(fix, phyprops[| physics.l_damp]);
	 physics_fixture_set_angular_damping(fix, phyprops[| physics.a_damp ]);
	 physics_fixture_set_friction(fix, phyprops[| physics.frict]);
	 if(phyprops[| physics.kine])
	 {
	    physics_fixture_set_kinematic(fix);
	 }
	 physics_fixture_set_sensor(fix,phyprops[| physics.sensor]);
	 physics_fixture_set_awake(fix,phyprops[| physics.awake]);
	 // Bind the fixture with our Deco object
	 b_fixture =physics_fixture_bind_ext(fix, id,-col_xoff,-col_yoff);
	}
	else //While is a concave polygon
	{	
	
	 //Remove from memory any previous triangle list	
	 if ds_exists(tri, ds_type_list)
	 {
	  ds_list_destroy(tri);
	 } 
	 // Make a new triangle list of our shape
	 tri = dks_triangulate(l);
	 // Reverse the triangulation
	 ds_list_reverse(tri);
	 // Loop troughth our triangle list adding a fixture for each one.
	 var size = ds_list_size(tri);
 
	 for(var i =0;i<size-6;i+=6)
	 {
	  fix = physics_fixture_create();
	  physics_fixture_set_polygon_shape(fix);
	  var x0 = tri[| i]*image_xscale;
	  var y0 = tri[| i+1]*image_yscale;
	  var x1 = tri[| i+2]*image_xscale;
	  var y1 = tri[| i+3]*image_yscale;
	  var x2 = tri[| i+4]*image_xscale;
	  var y2 = tri[| i+5]*image_yscale;
	  physics_fixture_add_point(fix, x2, y2);
	  physics_fixture_add_point(fix, x1, y1);
	  physics_fixture_add_point(fix, x0, y0);
 
	 // Set the physics properties
	  physics_fixture_set_density(fix, phyprops[| physics.dens]);
	  physics_fixture_set_restitution(fix, phyprops[| physics.rest]);
	  physics_fixture_set_collision_group(fix, phyprops[| physics.group]);
	  physics_fixture_set_linear_damping(fix, phyprops[| physics.l_damp]);
	  physics_fixture_set_angular_damping(fix, phyprops[| physics.a_damp ]);
	  physics_fixture_set_friction(fix, phyprops[| physics.frict]);
	  if(phyprops[| physics.kine])
	  {
	   physics_fixture_set_kinematic(fix);
	  }
	  physics_fixture_set_sensor(fix,phyprops[| physics.sensor]);
	  physics_fixture_set_awake(fix,phyprops[| physics.awake]);
	  // Bind the fixture with our Deco object
	  b_fixture =physics_fixture_bind_ext(fix, id,-col_xoff,-col_yoff);
	 } 
	}
}