/// Enumerate the editor mechanics
function dks_enumerator() 
{
 // The current available modes
	enum mode
	{
	 create,
	 edit,
	 ffd_create,
	 ffd_edit,
	 multiple,
	 animator,
	 polygon
	}
	// The current available setters
	enum setter
	{
	 closed,
	 sprite,
	 level,
	 layer,
	 grid,
	 color,
	 inspector,
	 bind,
	 vector,
	 vector_mod,
	 vector_add,
	 vector_del,
	 joint,
	 physet,
	 sprite_path,
	 terrain,
	 room_setters,
	 variables,
	 particles,
	 interface
	}
	// The physics properties
	enum physics
	{
	 shape,
	 dens,
	 rest,
	 group,
	 l_damp,
	 a_damp,
	 frict,
	 awake,
	 sensor,
	 kine,
	 fixed_rotation,
	 joint_type,
	 active,
	 radius
	}
	// Joint distance properties
	enum e_joint_distance
	{
	 w_anchor1_x,
	 w_anchor1_y,
	 w_anchor2_x,
	 w_anchor2_y,
	 collidable
	}
	// Joint rope properties
	enum e_joint_rope
	{
	 w_anchor1_x, 
	 w_anchor1_y, 
	 w_anchor2_x, 
	 w_anchor2_y, 
	 max_length,
	 collidable
	}

	// Joint revolute properties
	enum e_joint_revolute
	{
	 w_anchor_x, 
	 w_anchor_y, 
	 ang_min_limit, 
	 ang_max_limit, 
	 ang_limit, 
	 max_motor_torque,
	 motor_speed, 
	 motor, 
	 collidable 
	}

	// Joint prismatic properties
	enum e_joint_prism
	{
	 w_anchor_x,
	 w_anchor_y,
	 w_axis_x,
	 w_axis_y,
	 lower_trans_limit,
	 upper_trans_limit,
	 limit_enable,
	 motor_enable,
	 motor_speed,
	 max_motor_speed,
	 collidable
	}

	// Joint Pulley properties
	enum e_joint_pulley
	{
	 w_anchor1_x, 
	 w_anchor1_y, 
	 w_anchor2_x, 
	 w_anchor2_y, 
	 l_anchor1_x, 
	 l_anchor1_y, 
	 l_anchor2_x, 
	 l_anchor2_y, 
	 ratio,
	 collidable
	}

	// Joint Friction properties
	enum e_joint_friction
	{
	 anchor_x,
	 anchor_y,
	 max_force,
	 max_torque,
	 collidable
	}

	// Joint gear properties
	enum e_joint_gear
	{
	 joint_1,
	 joint_2,
	 ratio
	}

	// Joint weld properties
	enum e_joint_weld
	{
	 anchor_x, 
	 anchor_y,
	 ref_angle, 
	 freq_hz, 
	 damping_ratio, 
	 collidable 

	}

	// Joint wheel properties
	enum e_joint_wheel
	{
	 anchor_x, 
	 anchor_y, 
	 axis_x, 
	 axis_y, 
	 motor_enable, 
	 max_motor_torque, 
	 motor_speed, 
	 freq_hz, 
	 damping_ratio, 
	 collidable 
	}
}