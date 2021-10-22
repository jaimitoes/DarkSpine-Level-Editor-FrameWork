/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
with(obj_room_buffer)
{
	vertex_begin(buffer_room, format_room);
scr_vertex_add_point( buffer_room,0,0,0,0,0, c_white,1);
scr_vertex_add_point( buffer_room,0,0,z2,0,uv,c_white,1);
scr_vertex_add_point( buffer_room,room_width,0,0,uv,0,c_white,1);
scr_vertex_add_point( buffer_room,room_width,0,z2,uv,uv,c_white,1);
scr_vertex_add_point( buffer_room,room_width,room_height,0,0,0,c_white,1);
scr_vertex_add_point( buffer_room,room_width,room_height,z2,uv,0,c_white,1);
scr_vertex_add_point( buffer_room,0,room_height,0,0,uv,c_white,1);
scr_vertex_add_point( buffer_room,0,room_height,z2,uv,uv,c_white,1);
scr_vertex_add_point( buffer_room,0,0,0,0,0,c_white,1);
scr_vertex_add_point( buffer_room,0,0,z2,0,uv,c_white,1);
scr_vertex_add_point( buffer_room,0,0,z2,0,0,c_white,1);
scr_vertex_add_point( buffer_room,0,room_height,z2,0,uv,c_white,1);
scr_vertex_add_point( buffer_room,room_width,0,z2,uv,0,c_white,1);
scr_vertex_add_point( buffer_room,room_width,room_height,z2,uv,uv,c_white,1);
vertex_end(buffer_room);
vertex_submit(buffer_room, pr_trianglestrip, room_tex);
}