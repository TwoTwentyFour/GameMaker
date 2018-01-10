///enm_damage_obj_init( damage, knockback, screen_shake )

/*** Enemy Damge Objects Init ***/

// setting attributes
damage = argument[0];
knockback = argument[1];
screen_shake = argument[2];

depth = -y;

// set alarm to destroy self TODO: maybe switch to animation end event
if ( alarm[0] == -1 )
{
    alarm[0] = 1;
}

