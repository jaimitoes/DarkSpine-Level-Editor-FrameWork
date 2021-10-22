function dks_joint_update_pos(argument0) 
{
	with(argument0)
	{
	 if(joint)
	 {
		 dks_matrix_update();
		 switch(phyprops[| physics.joint_type])
		 {
		  case "Joint distance": scr_bind_joint_offset4(joint_offset[| 0], joint_offset[| 1],joint_offset[| 2],joint_offset[| 3]);break;
		  case "Joint revolute": scr_bind_joint_offset2(joint_offset[| 0], joint_offset[| 1]);break;
		  case "Joint rope"    : scr_bind_joint_offset4(joint_offset[| 0], joint_offset[| 1],joint_offset[| 2],joint_offset[| 3]);break;
		  case "Joint pulley"  : scr_bind_joint_offset8(joint_offset[| 4],joint_offset[| 5],joint_offset[| 6],joint_offset[| 7]);break;
		  case "Joint prismatic" : scr_bind_joint_offset4(joint_offset[| 0], joint_offset[| 1],joint_offset[| 2],joint_offset[| 3]);break;
		  case "Joint friction" : scr_bind_joint_offset2(joint_offset[| 0], joint_offset[| 1]);break;
		  case "Joint weld" : scr_bind_joint_offset2(joint_offset[| 0], joint_offset[| 1]);break;
		  case "Joint wheel": scr_bind_joint_offset4(joint_offset[| 0], joint_offset[| 1],joint_offset[| 2],joint_offset[| 3]);break;
		 }
	 } 
	 if(parent)
	 {
	  var s = array_length(child)
	  for(var i =0; i<s; i++)
	  {
	   with(child[i])
	   {
	    dks_joint_update_pos(id);
	   }
	  }
	 }
	}
}