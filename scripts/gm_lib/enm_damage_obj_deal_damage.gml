///enm_damage_obj_deal_damage()

/*** Deal Damage to Objects ***/

test_ply_obj.hp -= damage;
test_ply_obj.was_hit = true;
 
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




