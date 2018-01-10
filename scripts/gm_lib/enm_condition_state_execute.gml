///enm_condition_state_execute()

/*** Execute Enm Condition State ***/

switch ( enm_condition_state )
{
    case enm_condition_state.DEATH: // --------- dead
        instance_destroy();
    break;
    case enm_condition_state.GETTING_HIT: // --- getting hit
        was_hit = false;
    break;
    case enm_condition_state.CHASING: // ------- chasing
        enm_chase();
    break;
    case enm_condition_state.SHOOTING: // ------- shooting
        enm_shoot();
    break;
    case enm_condition_state.PATROLLING: // ----- patrolling

    break;
}
