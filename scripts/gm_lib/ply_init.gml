///ply_init( hp, dl, spd )

/*** Setting Up Player Varibables ***/

// player attributes
hp                  = argument[0];
ply_dash_length     = argument[1];
ply_speed           = argument[2];
ply_original_speed  = argument[2];
obj_to_animate      = noone;
original_blend      = image_blend;

// player counters
ply_dodge_count         = 0;
ply_slash_count         = 0; // for the old three hit combo thing. do i still need it?
ply_kill_streak_count   = 0;
fireball_block_count    = 0;


// condition flags
ply_dash_cool_down      = false;
ply_attack_cool_down    = false;
attack_reset            = false;
was_hit                 = false;

// physics attributes
phy_rotation        = 0;
phy_fixed_rotation  = true;

enum ply_condition_state
{
    DEATH, GETTING_HIT, BLOCK_STREAK, KILL_STREAK, POWER_UP, WIN, NORMAL
};
ply_condition_state = ply_condition_state.NORMAL;

enum ply_action_state
{
    IDLE, MOVING, ATTACKING, DASHING
};
ply_action_state = ply_action_state.IDLE;

// used in the tile debug draw thingy
old_rel_actor_x = (x div CELL_WIDTH) * CELL_WIDTH;
old_rel_actor_y = (y div CELL_HEIGHT) * CELL_HEIGHT;
