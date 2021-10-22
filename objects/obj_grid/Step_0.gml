///Updates
// Assign the same depth as the creator object by subtracting 1 unit so that it is always drawn above
depth = creator.depth -1;
if (rw != room_width) or (rh != room_height) or (last_color != creator.grid_color)
{
 vertex_delete_buffer(creator.buffer_grid);
 vertex_format_delete(creator.format_grid);
 event_perform(ev_create,0);
 rw = room_width;
 rh = room_height;
	last_color = creator.grid_color;
}


