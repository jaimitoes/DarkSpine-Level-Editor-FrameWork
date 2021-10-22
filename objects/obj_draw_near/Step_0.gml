///Update, the creator object is responsible to manage this one...why? Well, we need to draw in different depths and...
// we must to create a new draw call controlled from this object, in that way, we can control the draw order and depths.

//Draw the nearest Deco object if we aren´t positioned hover the CREATE MODE
with (obj_deco_creator) 
{
 switch(modo)
 {
  case mode.create:
  {// NULL ACTION AND EXIT
   exit;
  }   
  break; 
  default : 
  // Getting the name and coordinates from the nearest Deco object relative to he mouse
  if instance_exists(obj_deco)
  {
   // While you don´t touch any mouse button 	 
   if (! mouse_check_button(mb_any))
   {
    if (near != noone) //Check if the deco object exists
    {
     if (target != near) // Check if the nearest Deco object is already selected
     {
      obj_draw_near.depth = near.depth-1;
      near_cord = dks_cord_object_to_screen(near,vcam,pcam,Dw,Dh);
	  if (near.object_transform != noone)
	  {
	   if(near.object_execute)
	   {
		c_color = c_lime;   
		near_name = object_get_name(near.object_index);     
	   }
	   else
	   {
		c_color = c_orange;   
		near_name = near.object_transform;
	   }
	  }
	  else
	  {
		c_color = c_white;  
	   	near_name = object_get_name(near.object_index);  
	  }
      draw_data = 1;
     } 
     else
     {
	  // Draw locking
      draw_data = 0;
      near_cord = 0;
     }
    }  
    else
    {
	 // Draw locking
     draw_data = 0;
     near_cord = 0;
    }
   }
  }
 }
}