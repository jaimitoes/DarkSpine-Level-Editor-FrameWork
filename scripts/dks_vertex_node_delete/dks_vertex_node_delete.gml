/// @description dks_vertex_node_delete(node)
/// @param node
function dks_vertex_node_delete(argument0) 
{
	var s = array_length(node);
	var minimum;
	if (target.have_texture)
	{
	 minimum = 3;
	}
	else
	{
	 minimum = 2;
	}
	if (s>minimum)
	{ 
	 var clr;
	 switch(menu_setters)
	 {
	  case setter.vector_del:clr = red_pastel;break;
	  case setter.vector_add:clr = yellow_pastel;break;
	  case setter.vector_mod:clr = node_color;
	 } 
                         
	 if is_array(argument0)
	 {
	  var a = argument0;
	  for(var i = 0; i<s; i++)
	  {
	   if(a[ i].target)
	  {
	   instance_destroy(a[i]);
	   a[@ i]= noone;
	  }   
	  }        
	 }
	 else
	 {
	  for(var i = 0; i<s; i++)
	  {
  
	   if(node[i] = argument0)
	   {
	    with (node[i])
	    {
	     instance_destroy();
	    } 
	    node[@ i] = noone;
	   }
	  }
	 }  
 
	 var new_node = ds_list_create();
	 for(var j = 0;j<s;j++)
	 {
	  if (node[j] != noone)
	  {
	   ds_list_add(new_node,node[j].x,node[j].y,bezier_n1[j].x,bezier_n1[j].y,bezier_n2[j].x,bezier_n2[j].y);
	  }
	 }
 
	 dks_vertex_nodes_destroy();
	 var list_size = ds_list_size(new_node);
	 var sx1,sy1,sx2,sy2,sx3,sy3;
	 var ob =0;
	 for (j =0;j<list_size; j+=6)
	 {
	  sx1 = new_node[| j];
	  sy1 = new_node[|j+1];
	  sx2 = new_node[|j+2];
	  sy2 = new_node[|j+3];
	  sx3 = new_node[|j+4];
	  sy3 = new_node[|j+5];
                         
	  node[ob] = instance_create_depth(sx1,sy1,target.depth-1,obj_node);
	  node[ob].color = clr;
	  node[ob].radius = 24;
	  node[ob].radx = 24/64;
	  bezier_n1[ob] = instance_create_depth(sx2,sy2,target.depth-2,obj_node);
	  bezier_n2[ob] = instance_create_depth(sx3,sy3,target.depth-3,obj_node);
	  bezier_n1[ob].radius = 16;
	  bezier_n1[ob].radx = 16/64;
	  bezier_n1[ob].color = node_b1_color;
	  bezier_n1[ob].visible = false;
	  bezier_n2[ob].radius = 8;
	  bezier_n2[ob].radx = 8/64;
	  bezier_n2[ob].color = node_b2_color;
	  bezier_n2[ob].visible = false;
	  ob+=1;
	 }
	 ds_list_destroy(new_node);
	 dks_vertex_recreate(target);
	 dks_vertex_check(target)
 
	}
	else
	{
	 dks_message("You can not delete more vertices.");
	}
}