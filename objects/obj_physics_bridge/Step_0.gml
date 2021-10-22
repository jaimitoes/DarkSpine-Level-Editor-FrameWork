ds_list_clear(poly_list);
ds_list_add(poly_list,xx,yy);
for(var i =0; i<size; i++)
{
 
 with(child[i])
 {
  dks_matrix_update();
 }
 ds_list_add( poly_list, child[i].x, child[i].y);
 //draw_text(child[i].x,child[i].y,string(i));
}








