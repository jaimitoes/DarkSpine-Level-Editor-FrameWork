///destroy the default vertex data created from the editor
if (have_polygon)
{
 dks_vertex_destroy(id);
}

//Destroy any joint created from the editor
if(joint)
{
 ds_list_destroy(joint_list);
 ds_list_destroy(joint_offset);
 
}

//Destroy all the physcis data created from the editor
if (is_physics)
{
 ds_list_destroy(phyprops);
 physics_fixture_delete(fix);
 physics_fixture_delete(b_fixture);
}
/*Under construction
if (is_spine)
{
 ds_list_destroy(bone_list);
}
*/
// Unlink a hiearchy of Deco Object (Updating the child list of a parent/controller object)
if not keyboard_check(vk_control)
{
 // If the Deco object is a father, we must to update the child data (stored in the variable "bind_target" of our child/deco object) and UNBIND this.
 if (parent) 
 {
  dks_parent_unchild();
 }
// If the Deco object is a child, we must to update the child list of the parent/father object.
 if (bind_target !=noone) 
 {
  dks_child_unparent();
 }
}
//Remove all tween data of this object
dks_tween_destroy();
// We are destroying a deco object so, we have to check if any object in our world shares joint data with this ...
//...in a positive case, we must to destroy the joint data of the other.id objects.
with (obj_deco)
{
 
 if (joint)
 {
  if (joint_target = other.id)
  {
   ds_list_destroy(joint_list);
   ds_list_destroy(joint_offset);
   joint_target = noone;
   joint = false;
  }
 }
}