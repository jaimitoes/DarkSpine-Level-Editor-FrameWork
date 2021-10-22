//Drawing a GUI node

//Get the node coordinates and convert it into screen coordinates
var cord = dks_cord_vertex_to_screen( x, y, depth, creator.vcam, creator.pcam,creator.Dw,creator.Dh);
// Store the screen coordinates into this 2 variables
x1 = cord[0];
y1 = cord[1];
// Get the id of the very first node created
first_node  = creator.node[0];
// Create a variable checking if the mouse is hover a circle created from the screen node position.
var pos = point_in_circle( window_mouse_get_x(), window_mouse_get_y(), x1, y1, radius);
// IF is hover, set the highlighted image
if(pos)
{
 image_index =1;
}
else
{
 if(id =  first_node)
 {// Set The first node image
  image_index = 2;
 }  
 else
 {// Set the default node image
  image_index = 0;
 }
}








