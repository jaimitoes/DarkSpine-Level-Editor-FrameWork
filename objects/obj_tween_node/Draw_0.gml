/// Draw the ghosted tween data

// If the tween is stopped
if instance_exists(creator) and (creator.k_play[0])
{
 switch(creator.current_set)
 {
  // Nothing is drawn if we are managing the colour properties	 
  case 6: exit;
  
  default:
  //Set the gpu additive blending
  gpu_set_blendmode(bm_add);
  // Set the recolouring shader
  shader_set(shader);
  // Set the current colours for the nodes (Red = Tween start value, Green = Tween final value)
  shader_set_uniform_f(u_color,R,G,B,image_alpha);
  // Drawing the nodes based on the Creator targeted object.
  script_execute(draw_method);
  // Reset shader
  shader_reset();
  // Reset the gpu blending mode
  gpu_set_blendmode(bm_normal);
 }
}