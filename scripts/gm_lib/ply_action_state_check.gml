///ply_action_state_check()

/*** Check Player Action State ***/

if ( ply_input_x != 0 || ply_input_y != 0 ) // ------------------------ moving
{
    ply_action_state = ply_action_state.MOVING;
    if ( ply_input_attack && ply_attack_cool_down == false ) // ------- attacking while moving
    {
        ply_action_state = ply_action_state.ATTACKING;       
    }
    else if ( ply_input_dash && ply_dash_cool_down == false ) // ------ dashing, only while moving
    {
        ply_action_state = ply_action_state.DASHING;    
    }
}
else if ( ply_input_attack  && ply_attack_cool_down == 0 ) // --------- attacking while not moving
{
    ply_action_state = ply_action_state.ATTACKING;    
}
else // --------------------------------------------------------------- idle
{
    ply_action_state = ply_action_state.IDLE;
}
