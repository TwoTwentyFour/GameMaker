///ply_dash()

/*** Dash ***/

instance_create( x, y, ply_trail_forcefield_obj );      
ply_speed *= ply_dash_length;
ply_dash_cool_down = true;

// set dash cool down period
if ( alarm[0] == -1 )
{
    alarm[0] = .05 * room_speed;  
    if ( alarm[1] == -1 )
    {
        alarm[1] = .5 * room_speed;
    }                
}
