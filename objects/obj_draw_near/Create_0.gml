///This object Draws a highlighted texture based on the nearest Deco object.
// This object also creates an object responsible to draw the wireframe vertex data of single or multiple  objects.
// All new variables are inserted into the creator object.
with (obj_deco_creator) 
{
 event_inherited();///Inherit this data for the Creator object
 // Creating the object responsible to draw 
 instance_create_depth(0,0,depth,obj_draw_vertex_debug);
 shader = shd_colour;
 u_color = shader_get_uniform(shader,"u_color");
 draw_data = 0;
 near_cord = 0;
 near_name = -1;
 c_color = c_white;
}