///enm_init( enm_speed, enm_hp, shoot_range, idle_range )

/*** Enemy Init ***/

// enemy attributes
hp = argument[0];
enm_speed = argument[1];
shoot_range = argument[2];
idle_range = argument[3];

// enemy falgs
can_attack = true;
was_hit = false;

// enemy condition values
fire_ball_count = 0;

// physics attributes
phy_rotation = 0;
phy_fixed_rotation = true;

// enemy states
enum enm_condition_state
{
    DEATH, GETTING_HIT, PATROLLING, CHASING, SHOOTING
};
enm_condition_state = enm_condition_state.PATROLLING;
