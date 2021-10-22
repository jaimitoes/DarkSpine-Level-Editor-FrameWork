if is_array(variables)
{
 dks_array_update(val,variables);
 ease = asset_get_index(val[0]);
 Mode = real(val[1]);
 Dur  = real(val[2]);
 object_place = asset_get_index(val[3]);
 tween_target = asset_get_index(val[4]);
 destroy = real(variables[5]);
 
 if(have_polygon)
 {
  if(smooth_terrain)
  {
   pl = poly_s;
  }
  else
  {
   pl = poly_list;
  }
  s = ds_list_size(pl) div 2;
  _path = path_add();
  var sx, sy;
  for(i =0; i<s; i++)
  {
   sx = pl[|i*2];
   sy = pl[|i*2+1];
   path_add_point(_path,  sx, sy,100);
   Px[i] = x + sx;
   Py[i] = y + sy;
  }
  path_set_closed(_path,poly_closed);
  path_set_kind(_path,0);
 }
 
 if(tween_target != -1)
   {
    object_target = tween_target;
   }
   else
   {
    object_target = id;
   }
} 
/////////////////////////////////////////////////


