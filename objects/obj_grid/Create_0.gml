///The grid tool
//Aditive tool for the object "obj_deco_creator"
with (obj_deco_creator) 
{
 ///Declaring the Grid buffer
 vertex_format_begin();
 vertex_format_add_position_3d();
 vertex_format_add_colour();
 format_grid = vertex_format_end();
 buffer_grid = vertex_create_buffer();
 vertex_begin(buffer_grid, format_grid);
 var i;
 //Using the variables "grid_width" and "grid_height"...
 //...as a default values(this variables are stored on the Creator object and it can be tweaked)
 for (i = 0; i < room_width; i += grid_width)
 {
   //draw_line_colour(i, 0, i, room_height,grid_color,grid_color); 
  scr_vertex_add_point_col(buffer_grid,i,0,0,grid_color,1);
  scr_vertex_add_point_col(buffer_grid,i,room_height,0,grid_color,1);
 }

 for (i = 0; i < room_height; i += grid_height)
 {
  draw_line_colour(0, i, room_width, i,grid_color,grid_color);
  scr_vertex_add_point_col(buffer_grid,0,i,0,grid_color,1);
  scr_vertex_add_point_col(buffer_grid,room_width,i,0,grid_color,1);
 }
 vertex_end(buffer_grid);
 vertex_freeze(buffer_grid);
}
// grid variables
creator = obj_deco_creator;
// Get the current room_width and room height
rw = room_width;
rh = room_height;
last_color = creator.grid_color;

