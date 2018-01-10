///debug_draw_test_gui()

/*** Draw Debug Data ***/

// GUI test cubes drawn to the four corners of the screen area
draw_sprite( test_gui_spr, 0, 17, 16); // left upper
draw_sprite( test_gui_spr, 0, 17, (display_get_gui_height() - 16)); // left lower
draw_sprite( test_gui_spr, 0, (display_get_gui_width() - 16), 16); // right upper
draw_sprite( test_gui_spr, 0, (display_get_gui_width() - 16), (display_get_gui_height() - 16) ); // right lower

// performance output
draw_text_color( 32, 32, ("Instance Count: " + string( instance_count)), c_white, c_white,c_white, c_white, 1 ); // instance count
draw_text_color( 32, 44, ("Real FPS: " + string( fps_real )), c_white, c_white,c_white, c_white, 1 ); // frames per second
draw_text_color( 32, 56, ("Room Speed: " + string( room_speed )), c_white, c_white,c_white, c_white, 1 ); // room speed


if ( instance_exists(test_ply_obj) )
{
    // player action state
    if ( test_ply_obj.ply_action_state == ply_action_state.ATTACKING ) draw_text_color( 32, 68, "Player Action State: ATTACKING", c_white, c_white,c_white, c_white, 1 ); // ATTACKING
    else if ( test_ply_obj.ply_action_state == ply_action_state.DASHING ) draw_text_color( 32, 68, "Player Action State: DASHING", c_white, c_white,c_white, c_white, 1 ); // DASHING
    else if ( test_ply_obj.ply_action_state == ply_action_state.MOVING ) draw_text_color( 32, 68, "Player Action State: MOVING", c_white, c_white,c_white, c_white, 1 ); // MOVING
    else draw_text_color( 32, 68, "Player Action State: IDLE", c_white, c_white,c_white, c_white, 1 ); // IDLE
    
    // player condition state
    if ( test_ply_obj.ply_condition_state == ply_condition_state.DEATH ) draw_text_color( 32, 80, "Player Condition State: DEATH", c_white, c_white,c_white, c_white, 1 ); // DEATH
    else if ( test_ply_obj.ply_condition_state == ply_condition_state.GETTING_HIT ) draw_text_color( 32, 80, "Player Condition State: GETTING_HIT", c_white, c_white,c_white, c_white, 1 ); // GETTING_HIT
    else if ( test_ply_obj.ply_condition_state == ply_condition_state.POWER_UP ) draw_text_color( 32, 80, "Player Condition State: POWER_UP", c_white, c_white,c_white, c_white, 1 ); // POWER_UP
    else draw_text_color( 32, 80, "Player Condition State: NORMAL", c_white, c_white,c_white, c_white, 1 ); // NORMAL
    
    // player counters
    draw_text_color( 32, 92, "Player Dodge Count: " + string( test_ply_obj.ply_dodge_count ), c_white, c_white,c_white, c_white, 1 );
    draw_text_color( 32, 102, "Player Kill Count: " + string( test_ply_obj.ply_kill_streak_count ), c_white, c_white,c_white, c_white, 1 );
    draw_text_color( 32, 114, "Player HP: " + string( test_ply_obj.hp ), c_white, c_white,c_white, c_white, 1 );
}


