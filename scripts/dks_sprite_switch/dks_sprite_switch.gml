/// @description dks_sprite_switch(sprite,image_speed);
/// @param sprite
/// @param image_speed
function dks_sprite_switch(argument0, argument1) 
{
	if (sprite_index != argument0)
	{
	 sprite_index = argument0;
	 image_index = 0;
	} 
	image_speed = argument1;
}