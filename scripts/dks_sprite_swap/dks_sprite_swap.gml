/// @description dks_sprite_swap(object, string type, next value (true or false))
/// @param object
/// @param  string type
/// @param  next value (true or false
///Under construction! NOt optimized...
function dks_sprite_swap(argument0, argument1, argument2) 
{
	if !ds_list_empty(sprite_tab)
	{
	 var sprite_n, Spr = -1, sprite_list = -1;
	 switch(argument1)
	 {
	  case "sprite" : sprite_n = argument0.sprite_index;break;
	  case "fill_texture" : sprite_n = argument0.vertex_texture;break;
	  case "edge_texture" : sprite_n = argument0.path_texture;break;
	 }
	 //////////////////////////////////////////////////
	 if (sprite_n  = -1) or (sprite_n = spr_icon_object)
	 {
			sprite_list = sp_map[? sprite_tab[| 0]];
	  sprite_n = sprite_list[| 0];
	 }
	 else
	 {
	  var name = sprite_get_name(sprite_n);
	  sprite_n = name;
	  var s = ds_list_size(sprite_tab);
	  var sl,ss;
	  for(var i =0; i<s; i++)
	  {
	   sl = sp_map[? sprite_tab[| i]];
				if !is_undefined(sl)
				{
	    ss = ds_list_size(sl);
	    for(var j = 0; j<ss; j++)
	    {
	     if (sprite_n = sl[| j])
	     {
	      sprite_list = sl;break;
	     }
	    }
				}	
				else
				{
					exit;
				}
	  }
	 }
	 
//////////////////////////////////////////////////////////// 
if (sprite_list != -1) 
{
	 if(argument2 = 1)
	 {
   var size = ds_list_size(sprite_list);
	  for (var j =0; j<size;j++)
	  {
	   if (sprite_n = sprite_list[| j])
	   {
	    if  (sprite_n != sprite_list[| size-1])
	    {
	     Spr =  asset_get_index(sprite_list[| j+1]);
	    }
	    else
	    {
	     Spr =  asset_get_index(sprite_list[| 0]);
	    } 
	   }
	  } 
  }
	 else
	 {
   var size = ds_list_size(sprite_list);
	  for (var j =0; j<size;j++)
	  {
	   if (sprite_n = sprite_list[| j])
	   {
	    if  (sprite_n != sprite_list[| 0])
	    {
	     Spr =  asset_get_index(sprite_list[| j-1]);
	    }
	    else
	    {
	     Spr = asset_get_index(sprite_list[| size-1]);
	    } 
	   }
	  }   
  }
  
		if(Spr = -1)
	 {
	  Spr = asset_get_index(sprite_list[| 0]);
	 }
	//////////////////////////////////////////////////////////////////////  
	 switch(argument1)
	 {
	  case "sprite" : 
							
	  sprite_index = Spr;
			image_index = 0;
							
	  is_spine = dks_spine_check();
	  with(argument0)
	  {
								
	   sprite_index = other.sprite_index;
				image_index = 0;
				is_spine = other.is_spine;
								
	  } 
	  break;
	  case "fill_texture" :
							
	  sprite_index = Spr;
			image_index = 0;
							
	  is_spine = dks_spine_check();
	  if (!is_spine)
	  {
							
				argument0.sprite_index = Spr;
					argument0.image_index = 0;
	   argument0.vertex_texture = Spr;
				argument0.fill_image = 0;
								
	   dks_message("Fill_texture swap!");
	  }
	  else
	  {
	   dks_message("Spine detected, you can´t use a Spine file for textures");
	  }
	  break;
       
	   case "edge_texture" : 
								
	   sprite_index = Spr;
				image_index = 0;
								
	   is_spine = dks_spine_check();
	   if (!is_spine)
	   {
									
					argument0.sprite_index = Spr;
					argument0.image_index = 0; 	
					argument0.path_texture = Spr;
					argument0.path_image = 0;
	    dks_message("Edge texture swap!");
	   }
	   else
	   {
	    dks_message("Spine detected, you can´t use a Spine file for textures");
	   }
	   break;
	  }
		dks_vertex_check(argument0);
	} 
}
}