if is_array(variables)
{
 dks_array_update(val,variables);
 res_x = real(val[0]);
 res_y = real(val[1]);
 refraction_amount = real(val[2]);
 var index_map = asset_get_index(val[3]);
 normal_map = sprite_get_texture( index_map,0);
 normal_w = sprite_get_width(index_map);
 normal_h = sprite_get_height(index_map);
 
}
else
{
 res_x = sprite_width;
 res_y = sprite_height;
}

diffuse = sprite_get_texture(sprite_index,image_index);

