with (obj_deco_creator) 
{
 /// Hightlihgt the nearest object from our mouse coordinates
 if (draw_data)
 {
  shader_set(shader)
  shader_set_uniform_f(u_color, 2.0, 2.0, 2.0, 2.0);
  with(near)
  {
   script_execute(draw_method);
  } 
  shader_reset();
 }
}