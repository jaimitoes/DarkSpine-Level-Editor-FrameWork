event_inherited();

//Simple random seed based on the current second of your timeZone
random_set_seed(current_second);
randomize();
// Set a Start alarm based on the current room speed.
alarm[0] = room_speed;




