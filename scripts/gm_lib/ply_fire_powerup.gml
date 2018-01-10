///ply_powerup_hit()

/*** Fire Powerup Move ***/

ply_dodge_count = 3; // keeping the dodge count value at a max of 3
if ( keyboard_check_pressed( ord('E') ))
{
    ply_dodge_count = 0;
    
    /// TODO: replace with the dash movement code
    var nearest_enm     = instance_nearest( x, y, test_enm_obj );
    var power_up_speed  = distance_to_object( nearest_enm );
    dir                 = point_direction( x, y, nearest_enm.x, nearest_enm.y)
    phy_position_x += lengthdir_x( power_up_speed, dir );
    phy_position_y += lengthdir_y( power_up_speed, dir );
    instance_create( nearest_enm.x, nearest_enm.y, ply_mondo_damage_obj );
}
