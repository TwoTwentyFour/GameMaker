///shr_move_to_point_on_path( xx, yy, spd )

/*** Move the Calling Object Towards xx, yy Along A Path ***/

// get exact x, y
var xx = argument[0];
var yy = argument[1];
var spd = argument[2];

// get relative x, y based on the tile grid
var rel_x = (xx div CELL_WIDTH) * CELL_WIDTH + (CELL_WIDTH / 2);
var rel_y = (yy div CELL_HEIGHT) * CELL_HEIGHT + (CELL_HEIGHT / 2);

// move calling object towrds rel_x, rel_y
if ( mp_grid_path( env_level_obj.navigation_grid, 
                   navigation_path, x, y,
                   rel_x, rel_y, true))
{ 
    path_start( navigation_path, spd, path_action_stop, false );
}
                

