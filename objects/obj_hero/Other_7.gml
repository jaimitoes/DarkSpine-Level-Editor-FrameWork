///States that can be executed in the end of an animation

switch(sprite_index)
{
 case spr_hero_get_sword: current_state = State.idle2;break;
 case spr_hero_attack1: current_state = State.idle2;break;
 case spr_hero_attack2: current_state = State.idle2;break;
 case spr_hero_attack3: current_state = State.idle2;break;
 case spr_hero_save_sword: current_state = State.idle;break;
 case spr_hero_air_attack1: current_state = State.fall;break;
 case spr_hero_air_attack2: current_state = State.fall;break;
 case spr_hero_air_attack3: current_state = State.fall;break;
 case spr_hero_air_attack4: current_state = State.fall;break;
 case spr_hero_slide_begin: current_state = State.slide;break;
 case spr_hero_slide_end: current_state = State.walk;break;
 case spr_hero_cast: current_state = State.cast_loop;break;
}

