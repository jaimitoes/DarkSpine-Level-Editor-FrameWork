if is_array(variables)
{
 dks_array_update(val,variables);
 Group = real(val[0]);
 jumpforce = real(val[1]);
 _depth = real(val[2]);
 dur = real(val[3]);
 z_dur = real(val[4]);
 delay = real(val[5]);
 
 if(parent) and (child[0].object_index = obj_tween_path_creator_depth)
   {
    path_list = ds_list_create();
    if(child[0].smooth_terrain)
    {
     ds_list_copy(path_list,child[0].poly_s);
    }
    else
    {
     ds_list_copy(path_list,child[0].poly_list);
    }
    
    _path = path_add();
     var sx, sy;
     var s = ds_list_size(path_list) div 2;
    for(var i =0; i<s; i++)
    {
     sx = path_list[|i*2];
     sy = path_list[|i*2+1];
     path_add_point(_path,  sx, sy,100);
     
    }
    path_set_closed(_path,child[0].poly_closed);
    path_set_kind(_path,0);
    child_ease = asset_get_index(child[0].variables[0]);
    child_mode= real(child[0].variables[1]);
    child_dur= real(child[0].variables[2]);
    childx = child[0].x;
    childy = child[0].y;
    childz = real(child[0].variables[7]);
    child_path = true;
   }
}
else
{
 instance_destroy();
}

