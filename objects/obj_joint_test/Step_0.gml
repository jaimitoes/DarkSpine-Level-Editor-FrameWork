// Update the object position based on the mouse coordinates
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
phy_position_x = Mxd;
phy_position_y = Myd;

// While we release the left button click, the joint is automatically destroyed...
if (mouse_check_button_released(mb_left))
{
 if (joint_created)
 {
  //physics_fixture_set_sensor(fix,true);
  physics_joint_delete(joint_id);
  joint_created = false;
 
 }
}
// Create a fixture circle object by pressing the right click mouse button
if mouse_check_button_pressed(mb_right)
{
 with (instance_create_depth( Mxd, Myd,depth, obj_deco))
 {
  sprite_index = spr_icon_object;
  dks_phyprops_create();
  phyprops[| physics.dens]  = 1;
  fixture_create_circle();
  visible = false;
 }
}