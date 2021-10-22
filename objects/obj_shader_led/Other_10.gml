if is_array(variables)
{
 dks_array_update(val,variables);
 led_size = real(val[0]);
 led_brightness = real(val[1]);
 res_x = real(val[2]);
 res_y = real(val[3]);
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}