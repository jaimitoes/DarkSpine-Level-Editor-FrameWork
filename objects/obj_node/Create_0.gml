///The initial node data
event_inherited();
// In this object, target is interpreted in a different way, telling us this object is highlighted/select...
//...and can be managed by the mouse
//Initial values in screen space
if (global.start_3d)
{
	current_cam = Cam3D;
}
else
{
	current_cam = Cam;
}
var vec = dks_cord_vertex_to_screen(x,y,depth,camera_get_view_mat(current_cam),camera_get_proj_mat(current_cam),camera_get_view_width(current_cam),camera_get_view_height(current_cam));
x1 = vec[0];
y1 = vec[1];
target = false;
radius = 16;// The circle radius in pixels
radx = radius/64; 
color = c_green; // The default color of the node
image_xscale = 1;
creator = obj_deco_creator;// Get the creator id
first_node = 0; //If this node id is stored at first on the creator node controller


