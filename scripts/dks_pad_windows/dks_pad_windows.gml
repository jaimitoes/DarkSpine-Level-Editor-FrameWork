function dks_pad_windows() 
{
	if (game_pad)
	{
	 key_left = gamepad_button_check(0,gp_padl);
	 key_right = gamepad_button_check(0,gp_padr);
	 key_down = gamepad_button_check(0,gp_padd);
	 key_up = gamepad_button_check(0,gp_padu);
	 key_jump = gamepad_button_check_pressed(0,gp_face1);
	 key_leftr = gamepad_button_check_released(0,gp_padl);
	 key_rightr = gamepad_button_check_released(0,gp_padr);
	 key_dash   = gamepad_button_check(0,gp_shoulderrb);
	 key_dash_released = gamepad_button_check_released(0,gp_shoulderrb);
	 key_attack = gamepad_button_check_pressed(0,gp_face3);
	 key_weapon = gamepad_button_check_pressed(0,gp_face4); 
 
	}
	else
	{
	 key_left   = keyboard_check (ord ("A")); 
	 key_right  = keyboard_check (ord ("D")) ; 
	 key_down = keyboard_check (ord ("W")) ; 
	 key_up = keyboard_check (ord ("S")) ; 
	 key_jump   = keyboard_check_pressed (vk_space); 
	 key_leftr  = keyboard_check_released (ord ("A"));
	 key_rightr = keyboard_check_released (ord ("D"));
	 key_dash   = keyboard_check (vk_shift);
	 key_attack = mouse_check_button_pressed(mb_left);
	 key_weapon = keyboard_check_pressed (ord("E")); 
	 key_dash_released = keyboard_check_released(vk_shift);
	}
}