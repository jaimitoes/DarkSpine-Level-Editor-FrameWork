/// This custom deco object stores all blending modes to manage...
//...customized blending draws modes from the editor.
event_inherited();
// Store 2 editable variables "blend1" and "blend2" from the editor
val[2] = 0;
blend[0] = bm_zero;
blend[1] = bm_one;
blend[2] = bm_src_colour;
blend[3] = bm_inv_src_color;
blend[4] = bm_src_alpha;
blend[5] = bm_inv_src_alpha;
blend[6] = bm_dest_alpha;
blend[7] = bm_inv_dest_alpha;
blend[8] = bm_dest_color;
blend[9] = bm_inv_dest_colour;
blend[10] = bm_src_alpha_sat;
//Link between the array "val" and your custom variables (see "user event 0")
blend1 = 0;
blend2 = 0;
rep = 0;
///////////////////


