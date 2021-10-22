cx = camera_get_view_x(Cam);
cy = camera_get_view_y(Cam);
cw = camera_get_view_width(Cam);
ch = camera_get_view_height(Cam);
if  (depth > cam_target.z-room_speed) && point_in_rectangle(cx + cw*0.5,cy+ch*0.5,x+poly_list[| 0],y+poly_list[| 1],x+poly_list[| 4],y+poly_list[| 5])
{
 if (!in_draw)
 {
  s = array_length(child);
  for(i = 0; i<s; i++)
  {
   child[i].visible = 1;
   with(child[i])
   {
    if(object_index = obj_particle_system) && (dk_part[34])
    {
     visible = 0;
     part_emitter_stream(ps_system,ps_emitter,ps_part[0],dk_part[31]);
    }
   } 
  }
  in_draw = 1;
 }
}
else
{
 if (in_draw)
 {
  s = array_length(child);
  for(i = 0; i<s; i++)
  {
   child[i].visible = 0;
   with(child[i])
   {
    if(object_index = obj_particle_system) && (dk_part[34])
    {
     part_emitter_stream(ps_system,ps_emitter,ps_part[0],0);
    }
   } 
   
  }
  in_draw = 0;
 }
}

