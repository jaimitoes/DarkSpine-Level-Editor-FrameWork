//Testing void
if is_array(variables)
{
 dks_array_update(val,variables);
 pixels = real(val[0]);
 pos_x =   real(val[1]);
 pos_y =   real(val[2]);
 res_x =  real(val[3]);
 res_y =  real(val[4]);
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

