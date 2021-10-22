/// Terrain Collider checker (Based on the in-build physics engine Box2D)

// When the collision has been detected from the feet of our hero
if(phy_collision_y > y+1)
{
 switch(current_state)
 {
  case State.fall://When the hero falls and collides the ground
  part_particles_create(hero_part,phy_collision_x,phy_collision_y,part_ground[3],5);
  grounded = true;
  can_jump = 2;
  if (weapon != -1)// If our hero is in attack mode
  {
   current_state= State.idle2; // Sword idle animation state
  }
  else
  {
   current_state= State.idle; // No weapon idle animation state
  } 
  
  if(phy_speed_y > falling) // While the phy speed  on its Y axis are higher than the established max speed "falling",...
  //...the state is switched to show a slide animation, executing a new state block
  {
   current_state = State.slide_begin;
  }
  break;
  
  case State.slide_wall: // This state is normally executed while we are falling and collinding into a wall ( a vertical collision).
  current_state = State.idle;
  grounded = true;
  can_jump = 2;
  break;
  case State.walk:
  // Check a collision from the left side
  if(phy_collision_x <= x-5)
  {
    if (phy_speed_x = 0)
    {
     //xscale = -1;
     //can_jump = 2;
     //last_colx = -1;
     current_state = State.cast; 
    } 
  } 
  //CHeck a collision frome the right side
  else if(phy_collision_x >= x+5)
  {
    if (phy_speed_x = 0)
    {
     //xscale = 1;
     //can_jump = 2;
     //last_colx = 1;
     current_state = State.cast;
    }  
  }
  else//The variable last_colx store the orientation of the last horizontal collision check, -1 is left, 1 is right and 0 is a null value
  {
   last_colx = 0;
  }
  break;
 }
 // Check if the object with which we have collided contains vertex data information 
 if(other.have_polygon)
 {
  switch(other.path_texture)//Check if the object contains a defined texture that can be used to attach a particle to spawn.
  {
   case spr_edge_pack_0 : spawn_part = part_ground[other.path_image];break;
   default : spawn_part = part_ground[1];
  } 
   
  var pl;// Create a temporary variable to point the id of our customized polygon list depending on whether this is an smooth polygon...
         //... or a regular one.
  if (other.smooth_terrain)
  {
   pl = other.poly_s;
  }
  else
  {
   pl = other.poly_list;
  }
  // Get the size of our polygon list
  var s = ds_list_size(pl);
  // A world matrix is created while a polygon exists, this variable gets the matrix of the terrain to update...
  //...calculations in real time, giving us the posibility to bind the relative position of our player with the enviroment, and even if it is in motion.
  var mtp = other.mtx;
  // Define the maths variables of the first vector
   var xx,yy,xx2,yy2,dir;
  // Make a loop to check in every vector if our player is colliding on a edge of our polygon
  for (var i =0; i<s-2; i+=2)
  {//Matrix calculation scale-rotate-traslate in realtime of the collided terrain.
   xx  = pl[| i]*mtp[0] + -pl[| i+1]*mtp[1] + mtp[12]*1;
   yy  =-pl[| i]*mtp[4] +  pl[| i+1]*mtp[5] + mtp[13]*1;
   xx2 = pl[| i+2]*mtp[0] + -pl[| i+3]*mtp[1] + mtp[12]*1;
   yy2 =-pl[| i+2]*mtp[4] +  pl[| i+3]*mtp[5] + mtp[13]*1;
   if(x >= xx) and (x <= xx2)// IF the hero is over a vector area on its horizontal axis
   {
	// Get the direction of the vector in clockwise mode (even in negative scale) 
    dir = point_direction(xx,yy,xx2,yy2);
    if (dir >180)
    {
     dir-= 360;
    }
    if (dir >-45) and (dir<45)
    {
	 // Set the physics rotation of our player based on the direction calculation	
     phy_rotation = lerp(phy_rotation,-dir,0.25);break;
    } 
    
   }
  }
 }
}// If the collision is detected outside the range of our feets
else
{
 switch(current_state)
 {
 case State.slide_begin: scr_slide_wall_ckeck();break;
 case State.slide: scr_slide_wall_ckeck();break;
 case State.slide_end: scr_slide_wall_ckeck();break;
 case State.fall: scr_slide_wall_ckeck();break;
 //case State.run:scr_slide_wall_ckeck();break;//future fix
 }
} 
 






