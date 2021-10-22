/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
uv = room_width/512;
z2 = 31999;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
format_room = vertex_format_end();
buffer_room = vertex_create_buffer();
room_tex = sprite_get_texture(spr_editor_room,0);
