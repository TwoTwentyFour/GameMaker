///ply_animatoin_state()

/*** Animate Player Sprite Based on State ***/                              
/*** NOTE: Do I need this? Can I set animation within the action scripts? ***/

// animate condition state
switch ( ply_condition_state )
{
    case ply_condition_state.NORMAL: // -------- normal
        image_blend = original_blend;
        image_alpha = (hp / 10);
    break;
    case ply_condition_state.GETTING_HIT: // --- getting hit
        image_blend = c_red;
    break;
    case ply_condition_state.BLOCK_STREAK:
        image_blend = c_red;
    break;
    case ply_condition_state.KILL_STREAK:
    
    break;
    case ply_condition_state.POWER_UP: // ------ power up
         image_blend = c_lime;
    break;
    case ply_condition_state.WIN: // ----------- win
    
    break; 
}

// animate action state
switch ( ply_action_state )
{
    case ply_action_state.IDLE: // -------- idle
    
    break;
    case ply_action_state.MOVING: // ------ moving
    
    break;
    case ply_action_state.ATTACKING: // --- attacking
        with ( instance_create( obj_to_animate.x, obj_to_animate.y, ply_animation_obj ))
        {
            if ( test_ply_obj.obj_to_animate == ply_damage_obj )            
            {
                sprite_index = test_new_swing_spr;
            }
            else if ( test_ply_obj.obj_to_animate == ply_mondo_damage_obj )
            {
                sprite_index = test_mondo_swing_spr;
            }
        
            image_index = 0;
            image_speed = .5;
            depth = 2;
            depth *= -y;
            mask_index = test_damage_spr;
            image_angle = point_direction( test_ply_obj.x, test_ply_obj.y, mouse_x, mouse_y ); 
        }
    break;
    case ply_action_state.DASHING: // ----- dashing
        with ( instance_create( x, y, ply_animation_obj ))
        {
            sprite_index = test_dash_spr;
            image_index = 0;
            image_speed = .25;
            image_alpha = test_ply_obj.image_alpha;
            depth = -y;        
        }
    break;
}
