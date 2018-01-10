///env_create_room()

/*** Generate Random Tile tile_grid ***/

// room size
room_width  = (CELL_WIDTH / 32) * 720; // 512;
room_height = (CELL_HEIGHT / 32) * 720; // 384;

// set grid dimensions
var grid_w = room_width div CELL_WIDTH;
var grid_h = room_height div CELL_HEIGHT;

// create the tile grid
tile_grid = ds_grid_create( grid_w, grid_h );

// create the navigation grid
navigation_grid = mp_grid_create( 0, 0, grid_w, grid_h, CELL_WIDTH, CELL_HEIGHT );

// fill the tile_grid with empty spaces and seed ranom number
ds_grid_set_region( tile_grid, 0, 0, (grid_w - 1), (grid_h - 1), VOID );

// determine which room we are in and weather or not we've been there before 
var room_seed;
var room_type = 1000; // default so we don't crash if we <enter> to restart the game

ini_open( "room_seed_table.ini" );
if ( room == rm_1 )
{
    if ( ini_key_exists("rooms", "rm_1") )
    {  
        room_seed = env_get_room_seed( "rm_1" );
    }
    else
    {
        room_type = 750;
        room_seed = random( 1000 );
        env_save_room_seed( "rm_1" );
    }
}
else if ( room == rm_2 )
{
    if ( ini_key_exists("rooms", "rm_2") )
    {  
        room_seed = env_get_room_seed( "rm_2" );
    }
    else
    {
        room_type = 40;
        room_seed = random( 100 );
        env_save_room_seed( "rm_2" );
    }
}
else if ( room == rm_3 )
{
    if ( ini_key_exists("rooms", "rm_3") )
    {  
        room_seed = env_get_room_seed( "rm_3" );
    }
    else
    {
        room_type = 850;
        room_seed = random( 1000 );
        env_save_room_seed( "rm_3" );
    }
}
else show_message( "Seriously, where the hell is the room!?" );
ini_close();

// generate random value based on room_seed
random_set_seed( room_seed );


// create the tile controller
var tile_controller_x = grid_w div 2; // center x
var tile_controller_y = grid_h div 2; // center y

// load the player
instance_create( (tile_controller_x * CELL_WIDTH + (CELL_WIDTH / 2)), (tile_controller_y * CELL_HEIGHT + (CELL_HEIGHT / 2)), test_ply_obj );

// give controller random direction
var tile_controller_dir = irandom( 3 );
var odds = 2;

// create the level using 1000 steps
repeat ( room_type ) // <--------------------------------------------------------------------------------------------- make macros for types of rooms i.e. HALL = 10 or so
{
    tile_grid[# tile_controller_x, tile_controller_y] = FLOOR; // set the tile value to FLOOR where ever the tile controller lands
    
    // 1 in 2 chance at changing the tile controllers direction
    if ( irandom( odds ) == odds )
    {
        tile_controller_dir = irandom( 3 );
    }
    
    // move the tile controller
    var xdir = lengthdir_x( 1, tile_controller_dir * 90 ); // either 0, 90, 180, 360 
    var ydir = lengthdir_y( 1, tile_controller_dir * 90 ); // either 0, 90, 180, 360 
    tile_controller_x += xdir;
    tile_controller_y += ydir;
    
    // keep tile controller from placing a floor tile on the edge of the room
    tile_controller_x = clamp( tile_controller_x, 1, (grid_w - 2) );
    tile_controller_y = clamp( tile_controller_y, 1, (grid_h - 2) ); 
}

/*** Draw Tiles in Place ***/

// place a wall marker next to all floor tiles
for ( var yy = 0; yy < (grid_h - 1); yy++ )
{
    for ( var xx = 0; xx < (grid_w - 1); xx++ )
    {
        if ( tile_grid[# xx, yy] == FLOOR )
        {
            if ( tile_grid[# (xx + 1), yy] != FLOOR ) tile_grid[# (xx + 1), yy] = WALL; // check right                    
            if ( tile_grid[# (xx - 1), yy] != FLOOR ) tile_grid[# (xx - 1), yy] = WALL; // check left
            if ( tile_grid[# xx, (yy + 1)] != FLOOR ) tile_grid[# xx, (yy + 1)] = WALL; // check down
            if ( tile_grid[# xx, (yy - 1)] != FLOOR ) tile_grid[# xx, (yy - 1)] = WALL; // check up
        }
    }
}

// add floor tiles and enemies
for ( var yy = 0; yy < grid_h; yy++ )
{
    for ( var xx = 0; xx < grid_w; xx++ )
    {
        if ( tile_grid[# xx, yy] == FLOOR ) // add a floor tile
        {
            tile_add( floor_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx * CELL_WIDTH), (yy * CELL_HEIGHT), 0 );
            
            // add enemeies
            var odds = 60; // one enm per room
            var enm_x = (xx * CELL_WIDTH) + (CELL_WIDTH / 2);
            var enm_y = (yy * CELL_HEIGHT) + (CELL_HEIGHT / 2);
            // 1 : 60 chance of spawning an emeny at least 80 px away
            if ( point_distance( enm_x, enm_y, test_ply_obj.x, test_ply_obj.y) > 80 && irandom( odds ) == odds )
            {
                if ( instance_number( test_enm_obj ) <= 4 ) // 12 max enemies
                { 
                    instance_create( enm_x, enm_y, test_enm_obj );
                }
            }
        }
        else // mark as un-walkable for navigation grid
        {
            mp_grid_add_cell( navigation_grid, xx, yy );
        }
    }
}

// get tile size
var tile_w = CELL_WIDTH / 2;
var tile_h = CELL_HEIGHT / 2;

// add wall tiles
for ( var yy = 0; yy < grid_h * 2; yy++ )
{
    for ( var xx = 0; xx < grid_w * 2; xx++ )
    {
        if ( tile_grid[# xx div 2, yy div 2] == FLOOR )
        {
            // get tile position
            var tile_x = xx * tile_w;
            var tile_y = yy * tile_h;
            
            // check for appropriate tile type to set
            var right = tile_grid[# (xx + 1) div 2, yy div 2] != FLOOR;
            var left = tile_grid[# (xx - 1) div 2, yy div 2] != FLOOR;
            var top = tile_grid[# xx div 2, (yy - 1) div 2] != FLOOR;
            var bottom = tile_grid[# xx div 2, (yy + 1) div 2] != FLOOR;            
            var top_right = tile_grid[# (xx + 1) div 2, (yy - 1) div 2] != FLOOR;                     
            var top_left = tile_grid[# (xx - 1) div 2, (yy - 1) div 2] != FLOOR;
            var bottom_right = tile_grid[# (xx + 1) div 2, (yy + 1) div 2] != FLOOR;
            var bottom_left = tile_grid[# (xx - 1) div 2, (yy + 1) div 2] != FLOOR;

            // apply coorect tile based on tile sheet coordinate
            if ( right ) 
            {
                if ( bottom ) 
                {
                    tile_add( tiles_32, (tile_w * 4), (tile_h * 1), 
                        tile_w, tile_h, (tile_x + tile_w), tile_y, -tile_y );
                }
                else if ( top )
                {
                    if ( top_right ) 
                    {
                        tile_add( tiles_32, (tile_w * 4), (tile_h * 0), 
                           tile_w, tile_h, (tile_x + tile_w), (tile_y - tile_h), -tile_y );
                    }
                    else 
                    {
                        tile_add( tiles_32, (tile_w * 3), (tile_h * 0), 
                            tile_w, tile_h, tile_x, (tile_y - tile_h), -tile_y );
                    }
                    tile_add( tiles_32, (tile_w * 0), (tile_h * 1), 
                        tile_w, tile_h, (tile_x + tile_w), tile_y, -tile_y );
                } 
                else 
                {
                    tile_add( tiles_32, (tile_w * 0), (tile_h * 1), 
                       tile_w, tile_h, (tile_x + tile_w), tile_y, -tile_y );
                }
            }            
            if ( left )
            {
                if ( bottom )
                {
                    tile_add( tiles_32, (tile_w * 3), (tile_h * 1), 
                       tile_w, tile_h, (tile_x - tile_w), tile_y, -tile_y );
                } 
                else if ( top )
                {
                    if ( top_left )
                    {
                        tile_add( tiles_32, (tile_w * 3), (tile_h * 0), 
                            tile_w, tile_h, (tile_x - tile_w), (tile_y - tile_h), -tile_y );
                    } 
                    else 
                    {
                        tile_add( tiles_32, (tile_w * 4), (tile_h * 0), 
                            tile_w, tile_h, tile_x, (tile_y - tile_h), -tile_y );
                    }
                    tile_add( tiles_32, (tile_w * 2), (tile_h * 1), 
                        tile_w, tile_h, (tile_x - tile_w), tile_y, -tile_y );
                } 
                else 
                {
                    tile_add( tiles_32, (tile_w * 2), (tile_h * 1), 
                       tile_w, tile_h, (tile_x - tile_w), tile_y, -tile_y );
                }
            }           
            if ( top ) 
            {
                if ( !top_right ) 
                {
                    tile_add( tiles_32, (tile_w * 2), (tile_h * 2), 
                       tile_w, tile_h, tile_x, (tile_y - tile_h), -tile_y );
                } 
                else if ( !top_left ) 
                {
                    tile_add( tiles_32, (tile_w * 0), (tile_h * 2), 
                        tile_w, tile_h, tile_x, (tile_y - tile_h), -tile_y );
                } 
                else 
                {
                    tile_add( tiles_32, (tile_w * 1), (tile_h * 2), 
                       tile_w, tile_h, tile_x, (tile_y - tile_h), -tile_y );
                }
            }            
            if ( bottom ) 
            {
                if ( !bottom_right ) 
                {
                    tile_add( tiles_32, (tile_w * 2), (tile_h * 0), 
                       tile_w, tile_h, tile_x, tile_y, (-tile_y -tile_w) );
                } 
                else if ( !bottom_left ) 
                {
                    tile_add(tiles_32, ( tile_w * 0), (tile_h * 0), 
                        tile_w, tile_h, tile_x, tile_y, (-tile_y -tile_w) );
                } 
                else 
                {
                    tile_add( tiles_32, (tile_w * 1), (tile_h * 0), 
                       tile_w, tile_h, tile_x, tile_y, (-tile_y -tile_w) );
                }
            }                     
        }
    }
}


























