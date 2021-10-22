function dks_setter_room() 
{
 if(input_created)
	{
  if mouse_check_button_released(mb_any) or keyboard_check_released(vk_anykey)
	 {
	  var active = dks_input_list_get_active(input_list);
	  if (active)
	  {
		  var text; 
   
		  text = dks_input_list_get_array_real(input_list);
		  room_width = text[ 0];
		  room_height = text[ 1];
		  if(text[2] <15)
		  {
		   text[@ 2] = 15;
		  }
		  room_speed = text[ 2];
		  physics_pause = text[ 3];
		  physics_grav_x = text[ 4];
		  physics_grav_y = text[ 5];
		  physics_p_to_m = text[ 6];
		  physics_iterations = text[ 7];
		  physics_update_speed = text[ 8];
		  texture_flushing = text[ 9]
		  texture_interpolation = text[ 10];
		  gpu_set_texfilter(text[ 10]);
		  physics_world_create(physics_p_to_m);
		  physics_pause_enable(physics_pause);
		  physics_world_gravity(physics_grav_x,physics_grav_y);
		  physics_world_update_iterations(physics_iterations);
		  physics_world_update_speed(physics_update_speed);
   }
	 }
 }
	else
	{
	 var text;
	 text[ 0] = room_width;
	 text[ 1] = room_height;
	 text[ 2] = room_speed;
	 text[ 3] = physics_pause;
	 text[ 4] = physics_grav_x;
	 text[ 5] = physics_grav_y;
	 text[ 6] = physics_p_to_m;
	 text[ 7] = physics_iterations;
	 text[ 8] = physics_update_speed;
	 text[ 9] = texture_flushing;
	 text[ 10]= texture_interpolation;
	 input_list = dks_input_list_create(button_room_setter_int,text,1);
  input_created = true;
	}
}