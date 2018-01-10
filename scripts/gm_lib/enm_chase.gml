///enm_chase()

/*** Chase ***/

// load nav bot, send towards the player
if ( instance_number( shr_navigation_bot_obj ) <= instance_number( test_enm_obj ))
{
    with ( instance_create( x, y, shr_navigation_bot_obj ))
    {
        shr_move_to_point_on_path( test_ply_obj.x, test_ply_obj.y, test_enm_obj.enm_speed );
        if ( alarm[0] == -1 )
        {
            alarm[0] = 2 * room_speed;
        }
    }
}

// move towards player using navigation path
if ( instance_exists( shr_navigation_bot_obj ))
{
    var nearest_nav_bot = instance_nearest( x, y, shr_navigation_bot_obj );
    var hspd = sign( nearest_nav_bot.x - x ) * enm_speed;
    var vspd = sign( nearest_nav_bot.y - y ) * enm_speed;
    shr_move_lifeform( hspd, vspd ); 
}

// creating the nav object bot after 1 second           
if ( alarm[0] == -1 )
{
    alarm[0] = 1 * room_speed;
}
