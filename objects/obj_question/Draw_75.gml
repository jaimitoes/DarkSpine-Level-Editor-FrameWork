///Drawing the Question Panel

// Set the text halign
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//Get the coordinates data from the button structures
var x1,y1,x2,y2,a;
a = button_rectangle;
x1 = a[0][0];
y1 = a[0][1];
x2 = a[0][2]-x1;
y2 = a[0][3]-y1;

//Draw the button panel
draw_sprite_stretched_ext(a[0][15],0,x1,y1,x2,y2,a[0][6],1);
draw_sprite_stretched_ext(a[0][15],1,x1,y1,x2,y2,a[0][8],1);
draw_set_colour(a[0][8]);
// Draw the text question data
draw_text(a[0][12],a[0][13],string1+string2);
// Draw the confirmation buttons
dks_draw_button_reel(button_question);
// If an inputbox is created using the script "dks_question_input", draw the button inputBox
if is_array(button_input_box)
{
 dks_draw_button_rectangle(button_input_box);
}



