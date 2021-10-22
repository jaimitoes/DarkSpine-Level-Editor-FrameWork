 Dx = device_mouse_x_to_gui(0);
 Dy = device_mouse_y_to_gui(0);
 Mxd = global.mouse_xd;
 Myd = global.mouse_yd;	
 if  (creator.modo != mode.multiple )
 {
  if instance_exists(obj_deco)
  {
   with(obj_deco)
   {
    if (selected)
    {
     selected =false;
    }
   }
   if(parent)
   { 
    dks_parent_unchild();
   }
   creator.target = noone;
  }
  instance_destroy();exit;
 }
 ///////////////////////////////////////////////////////////
 var near = creator.near;
 depth = creator.depth;
 if mouse_check_button_pressed(mb_right)
 {
  x = Mxd;
  y = Myd;
  dks_set_offset(id, Mxd, Myd);
  Dxoff = Dx;
  Dyoff = Dy;
  if keyboard_check(vk_shift)
  {
   if(near!=noone)
   {
    near.selected = !near.selected;
   }
  }
  else
  {
   gui_rectangle = 1;
   if parent
   {
    dks_parent_unchild();
    parent = false;
    with(obj_deco)
    {
     selected = 0;
    }
   }
  }
 }
   
 if mouse_check_button_released(mb_right)
 {
  var vc = creator.vcam;
  var pc = creator.pcam;
  var dw = creator.Dw;
  var dh = creator.Dh;
  var dx = Dx;
  var dy = Dy;
  var dxoff = Dxoff;
  var dyoff = Dyoff;
  gui_rectangle = 0;
  with(obj_deco)
  {
   	  
   if(lay_depth = obj_deco_creator.lay_depth)
   {
	var vec = dks_cord_vertex_to_screen(x,y,depth,vc, pc, dw, dh);   
    if dks_in_rectangle(vec[0],vec[1],dxoff,dyoff,dx,dy)
    {
     if (bind_target = noone) and(id != obj_deco_creator.target.id)
     {
      selected = true;
     }
    }
    else
    {
     if(near !=noone)
     {
      with (near)
      {
       if (!selected)
       {
        if (bind_target = noone) and(id != obj_deco_creator.target.id)
        {
         selected = true;
        }
       } 
      }
     }
    }
   }
  }
  // 
  if not parent
  {
   with(obj_deco)
   {
    if (selected)
    {
     dks_set_child(other.id,id);
    }
   }
  }  
 }
