/// @description  Object icons, lines colliders etc ....
with(obj_deco_creator)
{
 vcam = other.vcam;
 pcam = other.pcam;
 Dw = display_get_gui_width();
 Dh = display_get_gui_height();
 Cx = other.Cx;
 Cy = other.Cy;	
 if (show_interface)
 {
  //Get the size and screen coordinates of our objects relative to the world.
  var dw = Dw;
  var dh = Dh;
  var vc = vcam;
  var pc = pcam;
  //Get the mouse coordinates from the current Gui interface.
  var dvx = Dx;
  var dvy = Dy;
  // Activating the Grid
  if (grid)
  {
   //Get the coordinates from a custom variable with this script:
   var gd = dks_cord_vertex_to_screen( mouse_grid_x, mouse_grid_y,depth,vcam,pcam,Dw,Dh);
   //Draw a circle from the mouse coordinates.
   draw_circle_colour( gd[0], gd[1], 8, c_green, lime_pastel, 0);
  }  
  //Draw the deco data, like icons representing if our deco object contains properties related with vertex buffers, logic, tween data, etc...
  if instance_exists(obj_deco)
  { 
   if(modo != mode.create)
   {
    dks_draw_deco_data(obj_deco);
   }
   switch(modo)
   {
    case mode.create :
    //Get the screen coordinates from a targeted object.
    var vec = dks_cord_vertex_to_screen(x, y,depth,vcam,pcam,Dw,Dh);
    //Draw the analogic transformation scaler from the interface deco object. (Very useful to manage from a tablet in future updates)
    switch(scale_mode)
    {
     case "Rotation":
     draw_sprite_ext(spr_flecha_cir,0,vec[0],vec[1],1,1,image_angle,c_white,1);
     break;
     case "pos":
     draw_sprite_ext(spr_4_way,0,vec[0],vec[1],1,1,image_angle,c_white,1);
     break;
    }
    break;
    case mode.edit :
    // While a deco object is selected...
    if (target != noone)
    {
	    draw_set_halign(fa_center);
     draw_set_valign(fa_middle);  
     draw_set_color(c_black);
	    draw_set_alpha(0.5);
	    draw_rectangle(0,642,128,720,0);
	    draw_set_alpha(1);
	    draw_set_color(c_white);
     with(target)
     {
      var vec = dks_cord_vertex_to_screen(x,y,depth,vc,pc,dw,dh);
	     switch(other.scale_mode)
      {
       case "Rotation":
	      //Draw the rotation data
       draw_sprite_ext(spr_flecha_cir,0,vec[0],vec[1],1,1,0,c_white,1);
       draw_sprite_ext(spr_flecha_cir,1,vec[0],vec[1],1,1,image_angle,c_white,1);
       draw_text(64,680,"2D Angle: "+ string(image_angle));
	      draw_text(64,695,"3D Xrotation: " + string(x_rotation));
	      draw_text(64,710,"3D Yrotation: " + string(y_rotation));
       break;
       case "pos":
	      // Draw the translation data
       draw_sprite_ext(spr_4_way,0,vec[0],vec[1],1,1,0,c_white,0.6);
					  draw_text(64,680,"X: "+ string(x));
					  draw_text(64,695,"Y: " + string(y));
					  draw_text(64,710,"Depth: " + string(depth));
       break;          
      }
      
						switch(other.menu_setters)
      {
	      case setter.particles: 
       //If our deco object contains particles data (stored in the array "dk_part" of our deco object):
       if is_array(dk_part)
       {
        if(dk_part[34])//The value dk_part[34] stores if the particle system is an emitter.
        {
								 //These values are the rectangle of our emitter region:
         var c1 = dks_cord_vertex_to_screen(x +dk_part[37],y +dk_part[39],depth,vc,pc,dw,dh);
         var c2 = dks_cord_vertex_to_screen(x +dk_part[38],y +dk_part[40],depth,vc,pc,dw,dh);
		       //Drawing the region from the editor
         draw_rectangle(c1[0],c1[1],c2[0],c2[1],true);
        }
       }
       break;
      }
     }
	    // Draw the current depth value of the targeted Deco object.
	    draw_text(64,665,"Target ID: "+string(target.id));
    }
    // Draw the number of Deco objects are currently placed in our level.
	   draw_text(64,650,"Instances: "+string(instance_number(obj_deco)));
	   // Draw the size of the current view relative to the world.
	   break;
	   case mode.multiple : 
	   // In this mode an object called "obj_multiple_select" is created. This gives you the possibility 
	   // to select multiple Deco objects and set a kind of properties sharing a same value, like colouring a family of objects, changing an inspector propertie, etc...
	   // This section draws the referenced icon and vectors to a selected object.
	   with(obj_deco)
	   {
		   // This section draws the referenced icon and vectors to a selected object.
	    if (selected)
	    {
	     var vec = dks_cord_vertex_to_screen(x,y,depth,vc,pc,dw,dh);
	     var vec1= dks_cord_object_to_screen(obj_multiple_select,vc,pc,dw,dh);
	     draw_sprite_ext(spr_icon_select,0,vec[0],vec[1],1,1,0,c_white,1);
	     draw_line_colour(vec[0],vec[1],vec1[0],vec1[1],c_white,c_white);
	    }
	   }
	   // Drawing the multiple-selector deco data
	   with(obj_multiple_select)
	   {   
	    var vec = dks_cord_vertex_to_screen(x,y,depth,vc,pc,dw,dh);
	    switch(other.scale_mode)
	    {
	     case "Rotation": draw_sprite_ext(spr_flecha_cir,0,vec[0],vec[1],1,1,image_angle,c_white,1);break;
	     case "pos": draw_sprite_ext(spr_4_way,0,vec[0],vec[1],1,1,0,c_white,1);break;         
	    } 
	   }
    break; 
    case mode.animator:
    if (target != noone)
    {
	    var ww = dw-64;  
	    draw_set_halign(fa_center);
     draw_set_valign(fa_middle);  
     draw_set_color(c_black);
				 draw_set_alpha(0.5);
				 draw_rectangle(dw-128,642,dw,720,0);
				 draw_set_alpha(1);
				 draw_set_color(c_white);
     with(target)
     {
      var vec = dks_cord_vertex_to_screen(x,y,depth,vc,pc,dw,dh);
	     switch(other.scale_mode)
      {
       case "Rotation":
	      //Draw the rotation data
	      draw_sprite_ext(spr_flecha_cir,0,vec[0],vec[1],1,1,0,c_white,1);
	      draw_sprite_ext(spr_flecha_cir,1,vec[0],vec[1],1,1,image_angle,c_white,1);
	      draw_text(ww,680,"2D Angle: "+ string(image_angle));
					  draw_text(ww,695,"3D Xrotation: " + string(x_rotation));
					  draw_text(ww,710,"3D Yrotation: " + string(y_rotation));
       break;
       case "pos":
	      // Draw the translation data
       draw_sprite_ext(spr_4_way,0,vec[0],vec[1],1,1,0,c_white,0.6);
					  draw_text(ww,680,"X: "+ string(x));
					  draw_text(ww,695,"Y: " + string(y));
					  draw_text(ww,710,"Depth: " + string(depth));
       break;          
      }
      switch(other.menu_setters)
      {
	      case setter.particles: 
       //If our deco object contains particles data (stored in the array "dk_part" of our deco object):
       if is_array(dk_part)
       {
        if(dk_part[34])//The value dk_part[34] stores if the particle system is an emitter.
        {
		       //These values are the rectangle of our emitter region:
         var c1 = dks_cord_vertex_to_screen(x +dk_part[37],y +dk_part[39],depth,vc,pc,dw,dh);
         var c2 = dks_cord_vertex_to_screen(x +dk_part[38],y +dk_part[40],depth,vc,pc,dw,dh);
		       //Drawing the region from the editor
         draw_rectangle(c1[0],c1[1],c2[0],c2[1],true);
        }
       }
       break;
      }
     }
	    // Draw the current depth value of the targeted Deco object.
	    draw_text(ww,665,"Target ID: "+string(target.id));
	   }
    break;
    case mode.polygon:
    if instance_exists(obj_node)
    {
	    var vec = dks_cord_object_to_screen(target,vcam,pcam,Dw,Dh);
	    draw_circle_color(vec[0],vec[1],8,c_orange,c_orange,0);   
     if(highlight_vertex)
     {
      draw_line_width_colour(highlight_vertex_draw[ 0], highlight_vertex_draw[ 1] , highlight_vertex_draw[ 2], highlight_vertex_draw[ 3], 6, c_lime, c_lime);
      draw_circle_colour( Dx, Dy, 8,c_lime, c_lime, 0);
     }
     scr_draw_mouse_selector();
     var size = array_length(node),
     cx1 = node[size-1].x1, 
				 cy1 = node[size-1].y1;
     if(!target.have_polygon)
     {
	     if(grid)
      {
       draw_line_width(cx1,cy1,gd[0],gd[1],4);
      }
      else
      {
       if keyboard_check(vk_control)
       {
        var xf = abs(cx1-dvx);
        var yf = abs(cy1-dvy);
        if(xf >yf)
        {
         draw_line_width(dvx,cy1,cx1,cy1,4);
         draw_circle_colour(dvx,cy1,4,c_aqua,c_aqua,1);
        }
        else if (yf>xf)
        {
         draw_line_width(cx1,dvy,cx1,cy1,4);
         draw_circle_colour(cx1,dvy,4,c_aqua,c_aqua,1);
        }
       }
       else
       {
								
        draw_line_width(dvx,dvy,cx1,cy1,4);
        draw_circle_colour(dvx,dvy,4,c_aqua,c_aqua,1);
       }
      }
      if (size >1)
      {
       for(var i =0; i<size-1;i++)
       {
        draw_line_width(node[i].x1, node[i].y1, node[i+1].x1, node[i+1].y1,4);
       }
      }
     }
     else
     {
      if(bezier_n1[0].visible)
      {
       for(var i =0; i<size;i++)
       {
	       draw_line_width_colour(node[i].x1, node[i].y1, bezier_n1[i].x1, bezier_n1[i].y1, 4, node_color, node_b1_color);
        draw_line_width_colour(node[i].x1, node[i].y1, bezier_n2[i].x1, bezier_n2[i].y1, 4, node_color, node_b2_color);
       }
      } 
     }
    }
    else
    { 
	    if (target != noone)
     {
	     with (target)
	     {
	      var vec = dks_cord_vertex_to_screen(x,y,depth,vc,pc,dw,dh);
	      draw_sprite_ext(spr_icon_gear,0,vec[0],vec[1],1,1,0,c_white,1);
	      if (joint_target !=noone)
	      {
	       var tar = dks_cord_object_to_screen(joint_target,vc,pc,dw,dh);
	       draw_line_width_colour(vec[0],vec[1],tar[0],tar[1],4,c_red,c_red);
	      }
	     }
     with(obj_deco)
	     {
	      if (joint)
	      {
	       if ds_exists(phyprops, ds_type_list)
	       {
		       switch(phyprops[| physics.joint_type])
		       {
		        case "Joint rope":
          var j1 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_rope.w_anchor1_x],y+joint_list[| e_joint_rope.w_anchor1_y],depth,vc,pc,dw,dh);
	         var j2 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_rope.w_anchor2_x],y+joint_list[| e_joint_rope.w_anchor2_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j1[0],j1[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j2[0],j2[1],8,c_aqua,c_aqua,false);
	         draw_line_width_colour(j1[0],j1[1],j2[0],j2[1],4,c_lime,c_aqua);
          break;
	         case "Joint distance":
          var j1 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_distance.w_anchor1_x],y+joint_list[| e_joint_distance.w_anchor1_y],depth,vc,pc,dw,dh);
	         var j2 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_distance.w_anchor2_x],y+joint_list[| e_joint_distance.w_anchor2_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j1[0],j1[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j2[0],j2[1],8,c_aqua,c_aqua,false);
	         draw_line_width_colour(j1[0],j1[1],j2[0],j2[1],4,c_lime,c_aqua);
          break;
	         case "Joint revolute" :
          var j = dks_cord_vertex_to_screen(x+joint_list[| e_joint_revolute.w_anchor_x],y+joint_list[| e_joint_revolute.w_anchor_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j[0],j[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j[0],j[1],10,c_aqua,c_aqua,false);
          break;
	         case "Joint prismatic":
          var j1 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_prism.w_anchor_x],y+joint_list[| e_joint_prism.w_anchor_y],depth,vc,pc,dw,dh);
	         var j2 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_prism.w_axis_x],y+joint_list[| e_joint_prism.w_axis_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j1[0],j1[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j2[0],j2[1],8,c_aqua,c_aqua,false);
	         draw_line_width_colour(j1[0],j1[1],j2[0],j2[1],4,c_lime,c_aqua);
          break;
	         case "Joint pulley":
          var j1 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_pulley.w_anchor1_x],y+joint_list[| e_joint_pulley.w_anchor1_y],depth,vc,pc,dw,dh);
	         var j2 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_pulley.w_anchor2_x],y+joint_list[| e_joint_pulley.w_anchor2_y],depth,vc,pc,dw,dh);
	         var j3 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_pulley.l_anchor1_x],y+joint_list[| e_joint_pulley.l_anchor1_y],depth,vc,pc,dw,dh);
	         var j4 = dks_cord_vertex_to_screen(joint_target.x+joint_list[| e_joint_pulley.l_anchor2_x],joint_target.y+joint_list[| e_joint_pulley.l_anchor2_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j4[0],j4[1],8,c_aqua,c_aqua,false);
	         draw_line_width_colour(j2[0],j2[1],j4[0],j4[1],4,c_lime,c_aqua);
	         draw_circle_colour(j1[0],j1[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j2[0],j2[1],8,c_aqua,c_aqua,false);
	         draw_line_width_colour(j1[0],j1[1],j2[0],j2[1],4,c_lime,c_aqua);
	         draw_circle_colour(j3[0],j3[1],8,c_lime,c_lime,false);
	         draw_line_width_colour(j1[0],j1[1],j3[0],j3[1],4,c_lime,c_aqua);
          break;
	         case "Joint friction":
          var j = dks_cord_vertex_to_screen(x+joint_list[| e_joint_friction.anchor_x],y+joint_list[| e_joint_friction.anchor_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j[0],j[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j[0],j[1],10,c_aqua,c_aqua,false);
          break;
	         case "Joint weld" :
          var j = dks_cord_vertex_to_screen(x+joint_list[| e_joint_weld.anchor_x],y+joint_list[| e_joint_weld.anchor_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j[0],j[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j[0],j[1],10,c_aqua,c_aqua,false);
          break;
	         case "Joint wheel":
          var j1 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_wheel.anchor_x],y+joint_list[| e_joint_wheel.anchor_y],depth,vc,pc,dw,dh);
	         var j2 = dks_cord_vertex_to_screen(x+joint_list[| e_joint_wheel.axis_x],y+joint_list[| e_joint_wheel.axis_y],depth,vc,pc,dw,dh);
	         draw_circle_colour(j1[0],j1[1],8,c_lime,c_lime,false);
	         draw_circle_colour(j2[0],j2[1],8,c_aqua,c_aqua,false);
	         draw_line_width_colour(j1[0],j1[1],j2[0],j2[1],4,c_lime,c_aqua);
          break;
	        }
	       } 
	      }
	     }
     } 
    }
    break;
   }
  }                                     
 }	
}