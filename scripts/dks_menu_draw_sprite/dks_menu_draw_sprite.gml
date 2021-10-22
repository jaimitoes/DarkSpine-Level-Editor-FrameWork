function dks_menu_draw_sprite() 
{
	var hei = display_get_gui_height();
	var clicked = mouse_check_button_pressed(mb_left);
	var spine_check = 0;
	dks_draw_button_reel(menu_b_tab_sprite);
	dks_draw_button_reel(menu_sprite_manager);
	var text_tab;
	if(current_tab = -1)
	{
	 text_tab = "No sprite";
	}
	else
	{
	 if !ds_list_empty(sprite_tab)
	 {
	  text_tab = "Folder: "+string(sprite_tab[| current_tab]);
	  dks_button_add_text(menu_tab_sprite,0,text_tab);
	  dks_draw_button_reel(menu_tab_sprite);
	  var menu_folder_del = dks_button_create(288,32,128,32,64,16,dark_gray,red_pastel,red_pastel,dark_gray,spr_button);
	  dks_button_add_text(menu_folder_del,0,"DEL FOLDER");
	  if(clicked)
	  {
	   var delete_folder = dks_button_press(menu_folder_del);
	   if(delete_folder !=-1)
	   {
	    dks_sprite_folder_delete();exit;
	   }
	  }
	  dks_draw_button_reel(menu_folder_del);
	  dks_draw_button_reel(menu_no_sprite);
	  if(clicked)
	  {
	   var p = dks_button_press(menu_no_sprite);
	   if (p !=-1)
	   {
	    current_tab = -1;
	    sprite_index = spr_icon_object;
	    vertex_texture = -1;
	    dks_sprite_set(spr_icon_object,0);
    
	    exit;
	   }
	  }
	  var sprite_list = ds_map_find_value(sp_map,sprite_tab[| current_tab]);
	  if(sprite_list = undefined)
	  {
	   exit;
	  }
	  var s = ds_list_size(sprite_list);
	  sprite_select = dks_button_reel_create("down",s,160,96,256,24,128,14,2,dark_gray,node_color,node_color,dark_gray,spr_button_256);
	  var sprite_del = dks_button_reel_create("down",s,160+258,96,32,24,16,12,2,dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	  switch (modo)
	  {
	   case mode.edit:dks_button_set_colour(sprite_select,dark_gray,orange_pastel,orange_pastel,dark_gray);break;
	   case mode.polygon: dks_button_set_colour(sprite_select,dark_gray,yellow_pastel,yellow_pastel,dark_gray);break;
	   case mode.create: dks_button_set_colour(sprite_select,dark_gray,node_color,node_color,dark_gray);break;
	  }
   
	  for(var i =0;i<s;i++)
	  {
	  dks_button_add_text(sprite_select,i,sprite_list[| i]);
	  dks_button_add_text(sprite_del,i, "X");
	  }
	  dks_draw_button_reel(sprite_select);
	  dks_draw_button_reel(sprite_del);
   
	  if(clicked)
	  {
	   var del = dks_button_press(sprite_del);
	   if(del != -1)
	   {
	    dks_sprite_delete(del);exit;
	   }   
	  }
	  var press = dks_button_press(sprite_select);
	  if (press !=-1)
	  { 
	   if(!is_undefined(sprite_list[| press]))
	   {
	    sprite_index = asset_get_index(sprite_list[|press]);
	   }
	   if (clicked)
	   {
	    dks_sprite_set(sprite_index,0);
	   }
	  }  
  
	  if(!instance_exists(obj_question))
	  {  
	   var w = sprite_get_width(sprite_index);
	   var h = sprite_get_height(sprite_index);
	   var xf = sprite_get_xoffset(sprite_index);
	   var yf = sprite_get_yoffset(sprite_index);
	   var sp_check = skeleton_animation_get();
	   
	   if (sp_check != "")
	   {
	    spine_check = 1;
	   }  
	   var anims = ds_list_create();
	   if(spine_check)
	   {
	    skeleton_animation_list(sprite_index,anims);
	   }
	   else
	   {
	    for( var i =0; i<image_number;i++)
	    {
	     anims[| i] = i;
	    }
	   }
	   var sz = ds_list_size(anims);
	   if(sz >0)
	   {
	   var x1,y1,x2,y2,block,aspect,total, x_start,y_start,x_start2,y_start2;
	   var total =0;
	   x_start = 452;
	   y_start = 36;
   
	   if(sz = 1)
	   {
	    block = 128;
	   }
	   else
	   {
	    block = 64;
	   }
  
  
	   x_start2 = 452 + block/2;
	   y_start2 = 36+block/2;
	   aspect = block*(h/w);
	   if (!surface_exists(sf_sprite))
	   {
	    sf_sprite = surface_create(w,h);
	   }
	   else
	   {
	    surface_resize(sf_sprite, w,h);
	   }
	   draw_sprite_stretched(spr_panel,0,x_start,y_start,block,block);
	   draw_sprite_stretched(spr_panel,1,x_start,y_start+block,block,hei);
	   for(var i=0; i<sz;i++)
	   {
	    if(total>=hei-block*2)
	    {
	     x_start+=block;
	     total =0;
	     draw_sprite_stretched(spr_panel,2,x_start,y_start,block,block);
	     draw_sprite_stretched(spr_panel,3,x_start,y_start+block,block,hei);
	    }
	    total +=aspect;
	   } 
    x_start+=block;
	   draw_sprite_stretched(spr_panel,4,x_start,y_start,block,block);
	   draw_sprite_stretched(spr_panel,5,x_start,y_start+block,block,hei);
	   total =0;
  
	   for(var j=0; j<sz;j++)
	   {
     if(total>=hei-block*2)
	    {
	     x_start2+=block;
	     total =0;
	    }
	    x1 = x_start2;
	    y1 = y_start2+total;
	    x2 = x_start2+block;
	    y2 = y_start2+aspect+total;
	    surface_set_target(sf_sprite);
	    draw_clear_alpha(c_white,0);
     if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x1+2,y1+2,x2-2,y2-2)
	    {
	     if(spine_check)
	     {
	      if (sz = 1)
	      {
	       draw_skeleton(sprite_index,anims[| j],"<none>",0,xf,yf,1,1,0,c_aqua,1);
	      }
	      else
	      {
	       draw_skeleton(sprite_index,anims[| j],"<none>",obj_editor_control.image_index,xf,yf,1,1,0,c_aqua,1);
	      }
	     }
	     else
	     {
	      draw_sprite_ext(sprite_index,anims[| j],xf,yf,1,1,0,c_aqua,1);
	     }
	     surface_reset_target();
	     if(clicked)
	     {
	      dks_sprite_set(sprite_index,anims[| j]);
       if(is_spine)
	      {
        skeleton_animation_set(anims[| j]);
	       if (modo = mode.edit)
	       {
         with(target)
	        {
          skeleton_animation_set(anims[| j]);
	        }
	       }
	      }
	      else
	      {
	       image_index = anims[| j];
	      }
       ds_list_destroy(anims);
	      exit;
	     }
     }
	    else 
	    {
		    if(spine_check)
		    {
		     if (sz = 1)
		     {
		      draw_skeleton(sprite_index,anims[| j],"<none>",0,xf,yf,1,1,0,c_white,1);
		     }
		     else
		     {
		      draw_skeleton(sprite_index,anims[| j],"<none>",obj_editor_control.image_index,xf,yf,1,1,0,c_white,1);
		     }
		    }
			   else
			   {
			    draw_sprite(sprite_index,anims[| j],xf,yf);
			   }
	      surface_reset_target();
	     }
      draw_surface_stretched(sf_sprite,x1,y1,block,aspect);
	     total +=aspect;
	    }  
     ds_list_destroy(anims);
    }
		  else
		  {
		   ds_list_destroy(anims);
		  }
	  }  
	 }
 }
}