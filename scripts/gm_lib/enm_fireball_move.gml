///enm_fireball_move()

/*** Move Fireball ***/

// set depth
depth = -y;

// move towards players last position
phy_position_x += lengthdir_x( fireball_speed, dir );
phy_position_y += lengthdir_y( fireball_speed, dir );

// check for inbounds
if ( x < 0 || x > room_width ||
     y < 0 || y > room_height )
{
    instance_destroy();
}

// check for collision with wall tile
if ( shr_grid_place_meeting( phy_position_x , phy_position_y )) // horizontal collision
{
    enm_fireball_explode();
}
if ( shr_grid_place_meeting( phy_position_x, phy_position_y )) // vertical collision
{
    enm_fireball_explode();
}
