/// Updating the world coordinates relative to the object "cam_target"
// You can use this object to draw vertex buffers or regular images that can be used to simulate...
// an ambient light
if(instance_exists(cam_target))
{
 depth = (cam_target.z + layer_offset)-camera_get_view_width(Cam)*0.5;
 //x_rotation = -cam_target.x_rotation;
 //y_rotation = -cam_target.y_rotation;
}


