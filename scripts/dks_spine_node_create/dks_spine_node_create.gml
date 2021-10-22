/// @description dks_spine_node_create
function dks_spine_node_create() {
	if (bone_list !=-1)
	{
	var map = ds_map_create();
	var creator = obj_deco_creator;
	var s = ds_list_size(bone_list);
	for (var i = 0; i < s; i++)
	{
   
 
	     skeleton_bone_state_get(bone_list[| i], map);
	     var xx = ds_map_find_value(map, "worldX");
	     var yy = ds_map_find_value(map, "worldY");
	     var an = ds_map_find_value(map, "angle");
	     var xscale = ds_map_find_value(map, "xscale");
	     var yscale = ds_map_find_value(map, "yscale");
     
	     creator.ob_ffd[i]=instance_create_depth(x+xx,y+yy,depth,obj_ffd);
	     creator.ob_ffd[i].target=false;
	     creator.ob_ffd[i].start_x =x;
	     creator.ob_ffd[i].start_y =y;
	     creator.ob_ffd[i].image_angle = an;
     
	     creator.ob_ffd[i].image_xscale = xscale;
	     creator.ob_ffd[i].image_yscale = yscale;
	     creator.ob_ffd[i].xsoffset = image_xscale;
	     creator.ob_ffd[i].ysoffset = image_yscale;
	     creator.ob_ffd[i].xoffset = Mxd-x;
	     creator.ob_ffd[i].yoffset = Myd-y;
	     creator.ob_ffd[i].anoff = image_angle;
	     creator.ob_ffd[i].number = i;
     
	     ds_map_clear(map);
 
	}


	ds_map_destroy(map);
	with(creator.ob_ffd[0])
	{
	 target=true;
	}
	with(obj_ffd)
	         {
          

	          TweenFire(id,EaseOutElastic,TWEEN_MODE_ONCE,0,0,30,"image_xscale",0,image_xscale);
	          TweenFire(id,EaseOutElastic,TWEEN_MODE_ONCE,0,0,30,"image_yscale",0,image_yscale);
        
	         }
	obj_deco_creator.ffd_created=1;
	} 
	else
	{
	 dks_message(" No bones in Sprite...");
	}



}
