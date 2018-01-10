///ply_move( haps, vspd )

/*** Check for Collision and Move Test Player ***/

var hspd = argument[0];
var vspd = argument[1];

// check for collision with wall tile
if ( utl_grid_place_meeting( (phy_position_x + hspd), phy_position_y )) // horizontal collision
{
    while ( !utl_grid_place_meeting( (phy_position_x + sign(hspd)) , phy_position_y) )
    {
        phy_position_x += sign( hspd );
    }
    hspd = 0;
}
if ( utl_grid_place_meeting( phy_position_x, (phy_position_y + vspd) )) // vertical collision
{
    while ( !utl_grid_place_meeting( phy_position_x , (phy_position_y + sign(vspd)) ))
    {
        phy_position_y += sign( vspd );
    }
    vspd = 0;
}

// diaganol check
if ( hspd != 0 && vspd != 0 )
{
    // for diagonol movement, multipy speed by the sqr of 2, causes obj jutter
    hspd *= 0.707186781187;
    vspd *= 0.707186781187;
}

// update movement
phy_position_x += hspd; 
phy_position_y += vspd; 


