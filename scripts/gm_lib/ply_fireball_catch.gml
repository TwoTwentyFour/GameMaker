///ply_fireball_catch()

/*** Add to Dodge Count and Destroy Fireball ***/
//called in ply_trail_forcefield_obj collision with test_firball_obj

test_ply_obj.ply_dodge_count++;

// destroy the fireball that touches the vapor trail
with ( other )
{
    instance_destroy();
}

// destroy the vapor trail
instance_destroy();

