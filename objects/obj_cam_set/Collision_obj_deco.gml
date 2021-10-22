/// Deco collider object created to manage in real time the current camera...
// This object is a child of the Deco object, All deco data is inherited. In this case we only use...
//...the collision event to set this object like a physics SENSOR object.
// In that way, we can tweak our custom camera maded to be compatible with our levels.

if is_array(variables)
{//While a collision is detected, use the editor variables to change the properties of the current view.
 if(cam_target.cam_w != variables[0])//CHeck if the editor settings and the view camera does not share...
 //...the sames values.
 {
  with(cam_target)
  {
   //Set the new view size respecting the aspect ration using a custom...
   cam_w = real(other.variables[0]);
   TweenSet(t_zoom,"start",camera_get_view_width(Cam));
   TweenSet(t_zoom,"destination",cam_w);
   TweenPlay(t_zoom);
  }
 }
}


// If This Deco object is a father, the camera gets the id of his child (the first id stored as a child)
if(parent)
{
 // Get the id from the very first object of our hierarchy
 cam_target.target = child[0];
}
else
{
 /*
 When an object collides with this entity, its id is assigned...
 ...as an object to be followed by the camera that we have defined.
 */
 cam_target.target = other.id;
}
cam_target.target_view = 1;
instance_destroy();


