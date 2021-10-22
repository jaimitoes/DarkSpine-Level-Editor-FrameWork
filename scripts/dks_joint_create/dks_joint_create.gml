/// Create a joint from the current object and one selected from the editor.
function dks_joint_create() 
{
	// While we set a joint type from the physics editor, a dynamic list is created storing a set of data according to the selected type.
	// That means our joint list can be resized and manage different numbers of variables depending on the current joint.
	// The joint target (the second object) must to exists and need to be setted as a joint_target.
	if instance_exists(joint_target)
	{
	 with (joint_target)
	 {// If the second object does not have a physics structure, a fixture box is created automatically based on the current sprite image.
	  if(!is_physics) 
	  { 
	   // Creates a physics structure	  
	   dks_phyprops_create();
	   // Creates a box shape fixture
	   fixture_create_box(sprite_width/2,sprite_height/2);
	   // Set the Deco object as physics 
	   is_physics = true;
	  } 
	 }
	 // Update the local matrix transformation to calculate the joint coordinates relative to the world.
	 dks_matrix_update();
	 //Check the joint type and create this one setting up the properties using the joint list structure. This structure is managed from our editor by default. 
	 switch(phyprops[| physics.joint_type])
	 {// The ID of our joint is stored on the variable "joint_id".
	  case "Joint distance": joint_id = physics_joint_distance_create(id, joint_target,x+joint_list[| 0],y+joint_list[| 1],x+joint_list[| 2],y+joint_list[| 3],joint_list[| 4]);break;
	  case "Joint revolute": joint_id = physics_joint_revolute_create(id, joint_target,x+joint_list[| 0],y+joint_list[| 1],joint_list[| 2 ],joint_list[| 3],joint_list[| 4],joint_list[| 5],joint_list[| 6],joint_list[| 7],joint_list[| 8]);break;
	  case "Joint rope"    : joint_id = physics_joint_rope_create(id, joint_target,x+joint_list[| 0],y+joint_list[| 1],x+joint_list[| 2],y+joint_list[| 3],joint_list[| 4],joint_list[| 5]);break;
	  case "Joint friction" : joint_id = physics_joint_friction_create(id, joint_target,x+joint_list[| 0],y+joint_list[| 1],joint_list[| 2],joint_list[| 3],joint_list[| 4]);break;
	  case "Joint weld" : joint_id = physics_joint_weld_create(id, joint_target,x+joint_list[| 0],y+joint_list[| 1],joint_list[| 2],joint_list[| 3],joint_list[| 4],joint_list[| 5]);break;
	  //////////////////////////
	  //THE FOLLOWING JOINTS NEEDS A BIT OF EXTRA CALCULATION
	  case "Joint pulley"  :
	  // Normalize the distance of our vectors to represent correctly our joints into the world.
	  var norm = dks_normalize_distance( x, y, joint_offset[| 4], joint_offset[| 5]);
	  var norm2 = dks_normalize_distance( joint_target.x, joint_target.y, joint_offset[| 6], joint_offset[| 7]);
	  var nx1 = (joint_offset[| 4]/norm)*4;
	  var ny1 = (joint_offset[| 5]/norm)*4;
	  var nx2 = (joint_offset[| 6]/norm2)*4;
	  var ny2 = (joint_offset[| 7]/norm2)*4;
	  joint_id = physics_joint_pulley_create(id, joint_target, x+joint_list[| 0], y+joint_list[| 1], x+joint_list[| 2], y+joint_list[| 3], nx1, ny1, nx2, ny2,joint_list[| 8],joint_list[| 9]);break;
	  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	  case "Joint prismatic" : 
	  // Get the normalised axis orientation of our prismatic joint
	  var dir = point_direction(joint_list[| 0],joint_list[| 1],joint_list[| 2],joint_list[| 3]);
	  var c = cos(dir*pi/180);
	  var s = -sin(dir*pi/180);
	  // Set the normalised variables in the new joint creation
	  joint_id = physics_joint_prismatic_create(joint_target, id, x+joint_list[| 0], y+joint_list[| 1], c, s, joint_list[| 4],joint_list[| 5],joint_list[| 6],joint_list[| 9],joint_list[| 8],joint_list[| 7],joint_list[| 10]);break;
	  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
	  case "Joint wheel": 
	  var dir = point_direction(joint_list[| 0],joint_list[| 1],joint_list[| 2],joint_list[| 3]);
	  var c = cos(dir*pi/180);
	  var s = -sin(dir*pi/180);
	  joint_id = physics_joint_wheel_create(joint_target, id,x+joint_list[| 0],y+joint_list[| 1],c,s,joint_list[| 4],joint_list[| 5], joint_list[| 6], joint_list[| 7],joint_list[| 8],joint_list[| 9]);break;
	  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 }
	}
}