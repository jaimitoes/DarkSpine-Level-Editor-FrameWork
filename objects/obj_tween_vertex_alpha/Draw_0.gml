shader_set(shader);
shader_set_uniform_f(u_alpha,image_alpha);
script_execute(draw_method);
if(parent)
{
 for(var i=0; i<size; i++)
 {
  with(child[i])
  {
   script_execute(draw_method);
  }
 }
}
shader_reset();

