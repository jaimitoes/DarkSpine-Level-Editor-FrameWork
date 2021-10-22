event_inherited();

if instance_exists(cam_target)
{
 cam_target._3d = cam3dswitch;
} 

if(child_path)
{
 ds_list_destroy(path_list);
 path_delete(_path);
}

