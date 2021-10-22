if is_array(variables)
{
 dks_array_update(val,variables);
 time = real(val[0]);
 res_x = real(val[1]);
 res_y = real(val[2]);
 shock_amplitude = real(val[3]);
 var_speed = real(val[4]);
 shock_refraction = real(val[5]);
 shock_width = real(val[6]);
 pos_x = real(val[7]);
 pos_y = real(val[8]);
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}

if(parent)
{
 size = array_length(child);
 for(var i =0; i<size;i++)
 {
  child[i].visible = 0;
 }
}

