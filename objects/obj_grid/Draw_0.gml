///Drawing the grid
with (obj_deco_creator)
{
 if (grid)
 {
  //Create a custom matrix world for the grid 
  grid_matrix = matrix_build(0,0,depth-1,0,0,0,1,1,1);
  // Set the custom matrix
  matrix_set(matrix_world,grid_matrix);
  // Deactivating the Z-ordering to prevent artifacts
  gpu_set_zwriteenable(0);
  // Grid Draw
  vertex_submit(buffer_grid,pr_linelist,-1);
  //Activating the Z-ordering
   gpu_set_zwriteenable(1);
   //Reset the matrix world
   matrix_set(matrix_world,global.mat_world);
 }    
}
