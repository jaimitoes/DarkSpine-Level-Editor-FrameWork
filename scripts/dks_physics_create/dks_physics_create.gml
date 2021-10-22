///dks_physics_create
function dks_physics_create() 
{
	if (have_polygon) 
	{
	 //Update the Deco local matrix
	 dks_matrix_update();
	 // This enumerated value stores what kind of shape our physical object is composed of.
	 // And then e use a switch statement checking this shape to adjust the related physical parameters. 
	 switch(phyprops[| physics.shape])
	 {
	  // Setting up a chain fixture
	  case "Chain" :
	  ////////Aditional sprite based box fixture. This fixture complements a dynamic fixtures...
	  //...to give mass while the density is setted higher than 0 
	  if(phyprops[| physics.dens] != 0)
	  {
		// 
	    fix = physics_fixture_create();
	    physics_fixture_set_box_shape(fix,(sprite_width/2)*phyprops[| physics.radius],(sprite_height/2)*phyprops[| physics.radius]);
	    physics_fixture_set_density(fix, phyprops[| physics.dens]);
	    physics_fixture_set_restitution(fix,phyprops[| physics.rest] );
	    physics_fixture_set_collision_group(fix, phyprops[| physics.group]);
	    physics_fixture_set_linear_damping(fix, phyprops[| physics.l_damp]);
	    physics_fixture_set_angular_damping(fix, phyprops[| physics.a_damp]);
	    physics_fixture_set_friction(fix, phyprops[| physics.frict]);
	    physics_fixture_set_sensor(fix,true);
	    b_fixture =physics_fixture_bind_ext(fix, id, -col_xoff, -col_yoff);
	    physics_fixture_delete(fix);
	    physics_fixture_delete(b_fixture);
	  }  
	  //////////////////////////////////////////////////////////////////////////////////////////////
	  //CREATING THE VERTEX FIXTURE
	   if(smooth_terrain) // While it is a smooth terrain...
	   {
		// Use the "poly_s" list structure that stores a computed smooth bezier curve.   
		// The variable poly_closed tell us if the vertex data is closed or non-closed polygon.
	    fixture_create_chain(poly_s, poly_closed);
	   }
	   else 
	   {
		// Use the regular polygon list structure "poly_list" to create the chained fixture.
		// The variable poly_closed tell us if the vertex data is closed or non-closed polygon.
		fixture_create_chain(poly_list, poly_closed);
	   }
  
	  break;
	  //SETTING UP A POLYGON SHAPE
  
	  case "Polygon": 
	  if(smooth_terrain)
	  {
	   // Set the polygon fixture using the smooth polygon structure	  
	   fixture_create_polygon(poly_s);
	  }
	  else
	  {
	   // Set the polygon fixture using the regular polygon structure
	   fixture_create_polygon(poly_list);
	  }
	  break;
	  //SETTING UP A CIRCLE SHAPE
	  case "Circle": 
	  // The size of our circle will be based on the size of our image
	  fixture_create_circle();
	  break;
	  /////////////////
	 }
	}
	else // While any vertex data are stored hover a Deco object.
	{
 	
	 if (phyprops[| physics.shape] !="Circle")
	 {
	  // Create a boxed fixture based on the sprite size.	 
	  fixture_create_box(sprite_width/2,sprite_height/2);
	 }
	 else
	 {
	  /// The size of our circle will be based on the size of our image
	  fixture_create_circle();
	 }
	}
}