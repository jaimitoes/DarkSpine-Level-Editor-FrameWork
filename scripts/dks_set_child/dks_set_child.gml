/// @description dks_set_child(parent object, child object)
/// @param parent object
/// @param  child object
function dks_set_child(argument0, argument1) 
{
	//Changes:
	if (argument1 !=noone) && (instance_exists(argument1))
	{
	 if (argument1.bind_target = noone) and (argument1 !=argument0)
	 {
	  var xf = argument1.x -argument0.x;
	  var yf = argument1.y -argument0.y;
	  argument1.bind_xoffset = scr_bind_set_xoffset(argument0,xf,yf);
	  argument1.bind_yoffset = scr_bind_set_yoffset(argument0,xf,yf);
	  argument1.bind_target = argument0.id;
	  argument0.parent=true;
	  if (!is_array(argument0.mtx))
	  {
	   with(argument0)
	   {
	    dks_matrix_update(); 
	   }
	  }
	  if is_array(argument0.child)
	  {
	   var size = array_length(argument0.child);
	   argument0.child[size] = argument1.id;
	  }
	  else
	  {
	   argument0.child[0] = argument1.id;
	  }
	 }
	 else
	 {
	  var size = array_length(argument1.bind_target.child)
	  var num = size-1;
	  for( var i=0; i<size;i++)
	  {
	   if (argument1.bind_target.child[i] = argument1)
	   {
	    argument1.bind_target.child[i] = noone;
	   }
	   if (argument1.bind_target.child[i] = noone)
	   {
	    num-=1;
	    if (num <0)
	    {
	     argument1.bind_target.child = 0;
	     argument1.bind_target.parent = false;
	    }
	   }
	  }
	  dks_parent_update_child(argument1.bind_target);
	  argument1.bind_target = noone;
	 }
	}
}