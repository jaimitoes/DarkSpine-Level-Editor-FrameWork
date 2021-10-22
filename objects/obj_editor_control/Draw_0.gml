/// @description Draw physics flags
// Draw the most important physics debug data by pressing F6
if(global.all_collision)
{
 if instance_exists(cam_target)
 {
  depth = abs(cam_target.z)-5;
 }
 
  var flag =   
  //phy_debug_render_aabb |
  phy_debug_render_collision_pairs |
  phy_debug_render_coms |
  phy_debug_render_core_shapes| 
  phy_debug_render_joints |
  phy_debug_render_shapes;
  physics_world_draw_debug(flag);
}  





 



