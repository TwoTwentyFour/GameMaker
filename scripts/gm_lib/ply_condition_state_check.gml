///ply_condition_state_check()

/*** Check Player Condition State ***/

if ( hp <= 0 ) // --------------------------------------------------- death
{
    ply_condition_state = ply_condition_state.DEATH;
}
else if ( was_hit == true ) // ------------------------------- getting hit
{
    ply_condition_state = ply_condition_state.GETTING_HIT;
}
else if ( fireball_block_count >= 3 ) // --------------------------- block streak
{
     ply_condition_state = ply_condition_state.BLOCK_STREAK;   
}
else if ( ply_kill_streak_count >= 3 ) // ---------------------------- kill streak
{
    ply_condition_state = ply_condition_state.KILL_STREAK;
}
else if ( ply_dodge_count >= 3 ) // ---------------------------------- power up
{
    ply_condition_state = ply_condition_state.POWER_UP;
}
else if ( 0 ) // ----------------------------------------------------- win
{
    ply_condition_state = ply_condition_state.WIN;
}
else ply_condition_state = ply_condition_state.NORMAL; // ------------ normal

