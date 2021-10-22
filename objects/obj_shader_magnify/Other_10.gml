if is_array(variables)
{
 dks_array_update(val,variables);
 res_x = real(val[0]);
 res_y = real(val[1]);
 circle_radius = real(val[2]);
 zoom_min = real(val[3]);
 zoom_max = real(val[4]);
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}


