///enm_condition_state_check()

/*** Check Enm Condition State ***/

if ( hp <= 0 ) // -------------------------------------------------------------- dead
{
    enm_condition_state = enm_condition_state.DEATH;
}
else if ( was_hit ) // --------------------------------------------------------- getting hit
{
    enm_condition_state = enm_condition_state.GETTING_HIT;
}
else if ( distance_to_point(test_ply_obj.x, test_ply_obj.y) > idle_range ) // -- patrolling
{
    enm_condition_state = enm_condition_state.PATROLLING;
}
else if ( distance_to_point(test_ply_obj.x, test_ply_obj.y) <= idle_range &&
          distance_to_point(test_ply_obj.x, test_ply_obj.y) > shoot_range ) // - chasing
{
    enm_condition_state = enm_condition_state.CHASING;
}
else enm_condition_state = enm_condition_state.SHOOTING; // -------------------- shooting

