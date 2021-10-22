function dks_spine_node_pos(argument0, argument1) {
	with(argument0)
	{
	 var map = ds_map_create();
	 var obf;
	 var i = argument1;
	 with(other.id)
	  {
	   if (ob_ffd[i].target = true)
	   {
	    //var dist,dir,scale_factor;
	    //scale_factor = sign(argument0.image_xscale)*sign(argument0.image_yscale)
	    //dir=-argument0.image_angle+point_direction(ob_ffd[i].start_x+ob_ffd[i].xoffset,ob_ffd[i].start_y+ob_ffd[i].yoffset, Mxd,Myd)*scale_factor;
	    //dist=point_distance(ob_ffd[i].start_x+ob_ffd[i].xoffset, ob_ffd[i].start_y+ob_ffd[i].yoffset, Mxd,Myd);
	    ob_ffd[i].x = Mxd-ob_ffd[i].xoffset;
	    ob_ffd[i].y = Myd-ob_ffd[i].yoffset;
	   //final_dir =  dir;
	   //final_dist = dist;
	   }
	  }
	  var mxx = other.Mxd;
	  var myy = other.Myd;
	  obf = other.ob_ffd[i];
	  var dist,dir,scale_factor;
	  scale_factor = sign(argument0.image_xscale)*sign(argument0.image_yscale)
	  dir=-argument0.image_angle+point_direction(obf.start_x+obf.xoffset,obf.start_y+obf.yoffset, mxx, myy)*scale_factor;
	  dist=point_distance(obf.start_x+obf.xoffset, obf.start_y+obf.yoffset, Mxd,Myd);
  
  
  
 
	  if(obf.target)
	  {
	   var xf = lengthdir_x(dist,dir);
	   var yf = -lengthdir_y(dist,dir);
	   skeleton_bone_state_get(bone_list[| i],map);
	   ds_map_replace(map, "x",  xf);
	   ds_map_replace(map, "y",  yf);
	   skeleton_bone_state_set(bone_list[| i], map);
	  }
   
 

	ds_map_destroy(map);
	}



}
