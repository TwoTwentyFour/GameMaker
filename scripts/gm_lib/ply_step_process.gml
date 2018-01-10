///ply_step_process()

/*** Player Step Processes ***/

event_inherited();

// setting depth
depth = -y;

// get user input
ply_get_user_input();

// run player state
ply_condition_state_check();
ply_condition_state_execute();
ply_action_state_check();
ply_action_state_execute();
ply_animation_state();

// move the player
if ( ply_action_state != ply_action_state.ATTACKING )
{
        if ( ply_condition_state == ply_condition_state.NORMAL || 
             ply_condition_state == ply_condition_state.WIN ||
             ply_condition_state == ply_condition_state.POWER_UP ||
             ply_condition_state == ply_condition_state.BLOCK_STREAK ||
             ply_condition_state == ply_condition_state.KILL_STREAK )
    {
            // set player speed and direction based on input and collision with life forms
            var hspd_this_frame = (ply_speed * ply_input_x) * global.seconds_passed;
            var vspd_this_frame = (ply_speed * ply_input_y) * global.seconds_passed;
            shr_move_lifeform( hspd_this_frame, vspd_this_frame );
    }
}

// check counters
if ( ply_kill_streak_count >= 3 )
{
    ply_kill_streak_count = 3;
}

// debug
ply_draw_debug_tile_position();

