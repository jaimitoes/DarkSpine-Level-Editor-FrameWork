/// Create end event, performing the User event 0

// If the default variable "variables" is setted from the editor...
if is_array(variables)
{
 // Getting the editor variables and updating our custom array "val" 
 dks_array_update(val,variables);
 if (parent)
 {
  // Get the lenght of our hierarchy
  var s = array_length(child)
   /* In trying to make this object dynamic, 
   I've put a conditional that checks the name of an inserted object from the first variable in our editor. 
   In such a way, that if it coincides with the last object added to a hierarchy, our platform will begin to follow its pattern.*/ 
   if (child[s-1].object_index = asset_get_index(val[0]))
   {// Needs to be the last child of the array
    object_follow = child[i].id;
    xf = x - object_follow.x;
    yf = y - object_follow.y;
    bind_xoffset = scr_bind_set_xoffset(id, xf, yf);
    bind_yoffset = scr_bind_set_yoffset(id, xf, yf);
	// If this conditional comes true, we must to cancel 
    with(child[i])
    {
     dks_child_unparent();
    }
   }
  }
 parent_follow = real(val[1]);
}
// Alternative method to follow an object based on the editable variable "Parent follow" from the editor
if(parent_follow) && (bind_target !=noone)
{
 xf = x - bind_target.x;
 yf = y - bind_target.y;
 bind_xoffset = scr_bind_set_xoffset(id, xf, yf);
 bind_yoffset = scr_bind_set_yoffset(id, xf, yf);
}

