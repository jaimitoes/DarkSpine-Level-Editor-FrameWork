if is_array(variables)
{
 dks_array_update(val,variables);
 current_font = asset_get_index(val[0]);
 previous_font = asset_get_index(val[1]);
 text = val[2];
 _3d = real(val[3]);
 if(_3d)
 {
  draw_method = dks_draw_text3D;
 }
 else
 {
  draw_method = dks_draw_text;
 }
}


