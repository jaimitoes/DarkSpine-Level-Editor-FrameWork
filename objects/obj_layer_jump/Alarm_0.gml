with(obj_deco)
{
 if (is_physics)
 {
 if(phyprops[| physics.group] = other.Group)
  {
   phy_active = 1;
  }
  else
  {
   phy_active = 0;
  }
 }
}
alarm[0] = -1;

