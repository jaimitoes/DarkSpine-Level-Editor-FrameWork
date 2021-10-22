///Drawing an ambient light 
// Set the inserted blending mode [0-10,0-10]
gpu_set_blendmode_ext(blend[blend1],blend[blend2]);
//Deactivate z-depth ordering
gpu_set_zwriteenable(0);
// The number of times we draw to simulate a ambient filter
repeat(rep)
{
 script_execute(draw_method);
} 
// Reset the blending mode
gpu_set_blendmode(bm_normal);
// Activate z-depth ordering
gpu_set_zwriteenable(1);

