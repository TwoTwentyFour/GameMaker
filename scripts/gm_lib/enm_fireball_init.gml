///enm_fireball_init()

/*** Fireball Init ***/

image_speed = .5;

// target players position at time of fireball creation
if ( instance_exists( test_ply_obj ))
{
    dir = point_direction( x, y, test_ply_obj.x, test_ply_obj.y)
    fireball_speed = 4;
}


