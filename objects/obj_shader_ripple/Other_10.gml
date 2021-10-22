if is_array(variables)
{
 dks_array_update(val,variables);
 time = real(val[0]);
 res_x = real(val[1]);
 res_y = real(val[2]);
 wave_amount = real(val[3]);
 wave_distorsion = real(val[4]);
 wave_speed = real(val[5]);
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}


