///ply_attack()

/*** Player Attack ***/

// update attack status
attack_reset = true;
ply_attack_cool_down = true;
ply_slash_count++;

// get the angle of the mouse from the player
var degs_to_mouse = (point_direction( x, y, mouse_x, mouse_y ) * -1);
var rads_to_mouse = degtorad( degs_to_mouse );
var cos_mouse = cos( rads_to_mouse );
var sin_mouse = sin( rads_to_mouse );

// vars used to calculate attack direction and dash length
var dmg_obj_rad = 48;
var attack_dash_length;
var rad_belt;
var dmg_obj;
var attack_cooldown;

// set attack dash length, cooldown and damage value
var attack_reset_timing;
if ( fireball_block_count < 3 ) // <------------------------------------------------- TODO! add action for kill streak
{       
    attack_dash_length = (ply_speed + (dmg_obj_rad / 2)) * 2;
    rad_belt           = dmg_obj_rad;   
    dmg_obj            = ply_damage_obj;
    obj_to_animate     = dmg_obj;
    attack_cooldown    = .5;   
}
else // use mondo damage obj if the player has cuaght 3 fireballs without getting hit
{
    fireball_block_count   = 0;
    attack_dash_length     = (ply_speed + dmg_obj_rad * 2);
    rad_belt               = dmg_obj_rad * 2;
    dmg_obj                = ply_mondo_damage_obj;
    obj_to_animate         = dmg_obj;
    attack_cooldown        = 1;
}

// dash to wards the mouse
var x_force = (attack_dash_length * cos_mouse) * global.seconds_passed;
var y_force = (attack_dash_length * sin_mouse) * global.seconds_passed;
// <---------------------------------------------------------------------- TODO!
// apply push effect

// create damage object
var xx = x + (rad_belt * cos_mouse);
var yy = y + (rad_belt * sin_mouse);
instance_create( xx, yy, dmg_obj );

if ( alarm[2] == -1 )
{
    alarm[2] = attack_cooldown * room_speed;
} 

