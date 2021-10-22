draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var sth = string_height(show_text)/2;
var x1 = start_x+8;
var y1 = start_y-sth;
var x2 = x-16;
var y2 = y +16;
var scale = image_yscale*image_alpha;
draw_set_alpha(scale);

draw_rectangle_colour(x1, y1*scale,x2,y2,c_black,c_black,c_black,c_black,false);
draw_rectangle_colour(x1+1, (y1-1)*scale,x2-1,y2+1,c_lime,c_lime,c_lime,c_lime,true);
draw_rectangle_colour(x2, y1*scale,x2+8,y2,c_lime,c_lime,c_lime,c_lime,false);
//draw_text_ext_transformed_colour( t_var1, t_var2, show_text, 10, 300, 1, 1*1.2, image_angle, c_white, c_lime,c_lime,c_lime, scale);
draw_text_ext_transformed_colour( x, y-2, show_text, 10, 300, 1, 1, image_angle, c_white, c_white,c_white,c_white, scale);
draw_set_alpha(1);


