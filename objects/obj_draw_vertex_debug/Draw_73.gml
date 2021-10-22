with (obj_deco_creator)
{
///draw the vertex data of an object, very useful to look the simetry  and adjust any bug related to colliders or graphics glitches.
 if(modo != mode.multiple)
 {
  if(global.all_collision)
  {
   dks_draw_vertex_debug(obj_deco);// Draw the vertex data from all deco objects belonging to a layer
  }
  else 
  {
   if(global.show_collision)
   {
    dks_draw_vertex_debug(target);// Draw the vertex data from the selected object
   }
  }
 }  
}
