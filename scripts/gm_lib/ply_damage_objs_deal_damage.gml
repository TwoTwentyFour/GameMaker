///ply_damage_objs_deal_damage()

/*** Deal Damage to Objects that are not the Caller ***/
     
other.hp -= damage;
other.was_hit = true;

with ( other )
{
    if ( hp <=0 )
    {
        test_ply_obj.ply_kill_streak_count++;
    }
}

    // knockback
/*  var dir = point_direction( x, y, other.x, other.y );
    var xforce = lengthdir_x( knockback, dir );
    var yforce = lengthdir_y( knockback, dir );
    with ( other )
    {
        
        // <----------------------------------------------------- TODO!!!
        // add push back effect
    }
*/    
// apply screen shake
env_camera_obj.shake = screen_shake;




