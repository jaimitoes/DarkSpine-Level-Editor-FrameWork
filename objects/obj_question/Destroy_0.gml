///Cleaning the panel

//If an input box exists, destroy it.
if(input != noone)
{
 with (input)
 {
  instance_destroy();
 }
}
//Free the buttons array
button_rectangle =0;
button_question = 0;