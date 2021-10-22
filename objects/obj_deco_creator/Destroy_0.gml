//Destroy the current level list
ds_list_destroy(level_list);
//Destroy the Sprite menu map
ds_map_destroy(sp_map);
//destroy the folder list
ds_list_destroy(sprite_tab);
//destroy the actions history
ds_map_destroy(undo_map);
//Free the memory buffer of our interface
vertex_delete_buffer(buffer_col);
vertex_format_delete(format_col);
//Free the sprite menu surface
if surface_exists(sf_sprite)
{
 surface_free(sf_sprite);
}
//Destroy the interface logic
instance_destroy(obj_draw_near);
instance_destroy(obj_grid);
instance_destroy(obj_cam_editor);
instance_destroy(obj_room_buffer);







