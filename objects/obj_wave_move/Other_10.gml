if is_array(variables)
{
 dks_array_update(val,variables);
 pos_x = real(val[0]);
 pos_y = real(val[1]);
 res_x = real(val[2]);
 res_y = real(val[3]);
 wave_speed = real(val[4]);
 wave_amount = real(val[5]);
 time = real(val[6]);
 move_x = real(val[7]);
 move_y = real(val[8]);
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}

