///env_control_session()

/*** Apply Specific Room Atributes ***/

// delta time in seconds
global.seconds_passed = delta_time / 1000000; // created in the env_level_obj create event

// end game or restart room
if ( keyboard_check_pressed( vk_escape ))
{
    game_end();
}
else if ( keyboard_check_pressed( vk_enter ))
{  
    room_restart();
}

// toggle fullscreen
if ( keyboard_check_pressed( vk_f11 ))
{
    if ( window_get_fullscreen() )
    {
        window_set_fullscreen( false );
    }
    else window_set_fullscreen( true );
}

// set the room to use views
if ( keyboard_check_pressed( vk_f12 ))
{
    if ( view_enabled )
    {
       view_enabled = false;
    }
    else view_enabled = true;
}


// toggle foom speed between 30 and 60
if ( keyboard_check_pressed( vk_f10 ))
{
    if ( room_speed == 30)
    {
        room_speed = 60;   
    }
    else
    {
        room_speed = 30;     
    }
}
