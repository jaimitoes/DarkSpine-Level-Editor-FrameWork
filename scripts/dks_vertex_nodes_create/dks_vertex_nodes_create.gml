function dks_vertex_nodes_create() 
{
	var size = array_length(target.poly_off)div 2; 
	with(target)
	{
	 dks_matrix_update();
	}
	var mtp = target.mtx;
	var xf,yf,x1,y1,lx,lx2,clr,sx,sy;
	
	switch(menu_setters)
	{
	 case setter.vector_del:clr = red_pastel;break;
	 case setter.vector_add:clr = yellow_pastel;break;
	 case setter.vector_mod:clr = node_color;break;
 } 
	
 for (var i =0;i<size;i+=1)
	{
	 sx = i*2;
	 sy = i*2+1;
	 xf = target.poly_off[ sx];
	 yf = target.poly_off[ sy];
              
	 x1 = xf*mtp[0] + -yf*mtp[1] + mtp[12] *1;
	 y1 = -xf*mtp[4]+  yf*mtp[5] + mtp[13] *1;
             
              
	 xf = target.bz1_off[ sx];
	 yf = target.bz1_off[ sy];
	 lx = xf*mtp[0] + -yf*mtp[1] + mtp[12] *1;
	 ly = -xf*mtp[4]+  yf*mtp[5] + mtp[13] *1;
              
	 xf = target.bz2_off[ sx];
	 yf = target.bz2_off[ sy];
	 lx2 = xf*mtp[0] + -yf*mtp[1] + mtp[12] *1;
	 ly2 = -xf*mtp[4]+  yf*mtp[5] + mtp[13] *1;
              
              
	 node[i] = instance_create_depth(x1,y1,target.depth-1,obj_node);
	 node[i].color = clr;
	 node[i].radius = 24;
	 node[i].radx = 24/64;
              
              
	 bezier_n1[i] = instance_create_depth(lx,ly,target.depth-2,obj_node);
	 bezier_n1[i].radius = 16;
	 bezier_n1[i].radx = 16/64;
	 bezier_n1[i].color = node_b1_color;
              
	 bezier_n1[i].visible = false;
              
              
	 bezier_n2[i] = instance_create_depth(lx2,ly2,target.depth-3,obj_node);
	 bezier_n2[i].radius = 8;
	 bezier_n2[i].radx = 8/64;
	 bezier_n2[i].color = node_b2_color;
	 bezier_n2[i].depth = target.depth -3;
	 bezier_n2[i].visible = false;
	}
}