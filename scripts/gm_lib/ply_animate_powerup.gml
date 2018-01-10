///ply_animate_powerup()

/*** Set Animation Obj To test_powerup_spr ***/


// target the nearest enemy and play powerup animation
var nearest_enm = instance_nearest( x, y, test_enm_obj ); 
with ( nearest_enm )
{
    with ( instance_create( x, y, ply_animation_obj ))
    {
        sprite_index = test_mondo_swing_spr;
        image_index = 0;
        image_speed = .5;
        depth = -100;
        // image_angle = point_direction( test_ply_obj.x, test_ply_obj.y, ply_animation_obj.nearest.x, ply_animation_obj.nearest.y );         
    }
}
