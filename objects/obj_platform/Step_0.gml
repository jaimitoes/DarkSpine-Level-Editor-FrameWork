/// Updates, dynamic platform
if (target != noone)
{// IF we detect a player collision detection...
 with(target) 
 {// With the player...This custom platform component need an object that works with a state machine.
  switch(current_state)
  {
   //Break the conditional in this cases:	  
   case State.jump1:other.target = noone;break;
   case State.jump2:other.target = noone;break;
   //case State.slide_wall:other.target = noone;break;
   case State.fall: other.target = noone;break;
   case State.slide_begin: other.target = noone;break;
   case State.slide_end: other.target = noone;break;
   case State.slide: other.target = noone;break;
   // Set the offset of our player based on the current physics speed
   case State.slide_wall:
   xoffset += phy_speed_x;
   yoffset += phy_speed_y;
   break;
   // By default
   default:
   // Increase the offset value based on his physics speed while we are pressing the right/left keys.
   if (key_left) or (key_right)
   {
	// Add or substract units depending on the player direction
    xoffset += phy_speed_x;
   }
   //The player depth is setted as the same depth of our platform object, substracting 1 unit to be drawn above this.
   zoff = other.zoff-1;
   //Transforming the player coordinates.
   dks_physics_bind_to(other.id,xoffset, yoffset);
  } 
 }
}

//If this platform is a child object...
if(parent_follow) && (bind_target !=noone) 
{
 // Update the matrix of his father
 with(bind_target)
 {
  dks_matrix_update();
 }
 // Transform the platform coordinates relative to his father
 dks_physics_bind_to(bind_target, bind_xoffset, bind_yoffset);
 // If the plaftorm is a father...
 if(parent)
 {
  // Transform all the hierarchy	 
  dks_child_transform();
 }
}
else //While is father but not a child
{
 if(parent)
 {
  if (parent_follow)// This variable is setted from the editor
  {
   with(child[0])
   {
    dks_matrix_update();
   }
   //The first child reacts different than the other.ids, getting the same coordinates of his father.
   dks_physics_bind_to(child[0], 0, 0); 
   dks_matrix_update();
   var s = array_length(child);
   // Transform all the hierarchy from the next child to the end.
   for (var i =1; i<s;i++)
   {
    with(child[i])
    {
	 // Moving the childs like iks relative to their father
     dks_bind_to(bind_target,bind_xoffset,bind_yoffset);
     if (parent)
     {
	  // Chaining operations, if a child is father, repeat the process (This script pass thought all the hierarchy).
      dks_child_transform();
     }  
    }
   }   
  }
  else
  {
   // Transform all the hierarchy
   dks_child_transform();
  }
 }
}

if(object_follow != noone)//The platform follows the id inserted from the editor
{
 //Transform the platform coordinates relative to the assigned object in the variable "object_follow"
 dks_physics_bind_to(object_follow,bind_xoffset, bind_yoffset);
}




