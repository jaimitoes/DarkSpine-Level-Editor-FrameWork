/// @description dks_mouse_deco_meeting(MouseScreenX, MouseScreenY, ObjectScreenX, ObjectScreenY )
/// @param MouseScreenX
/// @param MouseScreenY
/// @param ObjectScreenX
/// @param ObjectScreenY
function dks_mouse_deco_meeting(argument0, argument1, argument2) 
{
 // Returns the id of the closest object accessible by our editor and layer...
	if instance_exists(argument2)
	{
	 var view = vcam;
	 var proj = pcam;
	 var dw = Dw;
	 var dh = Dh;
	 with(argument2)
	 {
	  if(lay_depth = other.lay_depth) and (!locked)
	  {
	   var vec = dks_cord_vertex_to_screen(x,y,depth,view,proj,dw,dh);
	   if point_in_circle(argument0,argument1,vec[0],vec[1],16)
	   {
		   return id;  
	   }
	  }
	 }
	} 
	return noone;
	/*
	if (instance_exists(argument2))
	{
	 var n = instance_nearest(argument0,argument1,argument2);
	 if(n.lay_depth = lay_depth)
	 {
	  if(n.locked)
	  {
	   return noone;
	  }
	  //Get the screen coordinates of the nearest object.
	  var vec = dks_cord_object_to_screen(n,vcam,pcam,Dw,Dh);
	  //Check if our mouse are hover on the sphere selection based on the current axis.
	  if point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),vec[0],vec[1],16)
	  {
	   return n.id;
	  }
	  else
	  {
	   return noone;
	  }
	 }
	 else
	 {
	 /// Check if the nearest object are sharing the same xy cord with other.id object...
	  with(obj_deco)
	  {
	   if(n.x = x) and (n.y = y) and (lay_depth = other.lay_depth)
	   {
		with(other.id)
		{
	     var vec = dks_cord_object_to_screen(other.id,vcam,pcam,Dw,Dh);
	     if point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),vec[0],vec[1],16)
	     {
	      return id;
	     }
		}
	   }
	  }
	 }
	 return noone;
	}
	else
	{
	 return noone;
	}
	*/
}