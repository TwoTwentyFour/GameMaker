///ply_action_state_execute()

/*** Execute Player Action State ***/

switch ( ply_action_state )
{
    case ply_action_state.IDLE: // ------------ idle

    break;
    case ply_action_state.MOVING: // ---------- moving

    break;
    case ply_action_state.ATTACKING: // ------- attacking
        ply_attack();        
    break;
    case ply_action_state.DASHING: // --------- dashing
        ply_dash();
    break;
}

