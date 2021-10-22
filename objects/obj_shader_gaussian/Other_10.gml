if is_array(variables)
{
 dks_array_update(val,variables);
 blur_amount = real(val[0]);
 res_x = real(val[1]);
 res_y = real(val[2]);
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}

