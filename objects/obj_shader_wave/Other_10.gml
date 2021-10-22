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
 
}
else
{
 pos_x = x- camera_get_view_x(Cam);
 pos_y = y- camera_get_view_y(Cam);
 res_x = sprite_width;
 res_y = sprite_height;
}

if(parent)
{
 size = array_length(child);
 for(z = 0; z<size;z++)
 {
  child[z].visible = 0;
 }
}

