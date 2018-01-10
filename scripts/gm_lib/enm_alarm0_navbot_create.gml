///enm_alarm0_navbot_create()

/*** Create Nav Bot and Send Towards Player ***/

if ( !instance_exists( shr_navigation_bot_obj ))
{
    with ( instance_create( x, y, shr_navigation_bot_obj ))
    {
        shr_move_to_point_on_path( test_ply_obj.x, test_ply_obj.y, test_enm_obj.enm_speed );
    }
}

// reset alarm
alarm[0] = -1;

