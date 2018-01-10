///ply_condition_state_execute()

/*** Execute Player Condition State ***/

switch ( ply_condition_state )
{
    case ply_condition_state.DEATH: // ---------- death
        ply_death();
    break;
    case ply_condition_state.GETTING_HIT: // ----- getting hit
        ply_getting_hit();
    break;
    case ply_condition_state.BLOCK_STREAK: // ---- block streak
    
    break;
    case ply_condition_state.KILL_STREAK: // ----- kill streak
    
    break;
    case ply_condition_state.POWER_UP: // --------- power up
        ply_fire_powerup();       
    break;
    case ply_condition_state.WIN: // -------------- win
        ply_win_room();
    break;
}
