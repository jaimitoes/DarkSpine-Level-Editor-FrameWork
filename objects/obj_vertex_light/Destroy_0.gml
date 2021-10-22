///Destroy all the data created from the editor
event_inherited();
//Destroying the light buffer
if(buffer_light != -1)
{
  vertex_delete_buffer(buffer_light);
  vertex_format_delete(format_light);
}

