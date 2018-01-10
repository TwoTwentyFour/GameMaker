///shr_grid_place_meeting()

/*** Check if new postion is inside a wall tile ***/

var new_x = argument[0];
var new_y = argument[1];

// origin position
var origin_x = x;
var origin_y = y;

// update position for bbox calculations
x = new_x;
y = new_y;

// check for x meeting
var x_meeting = ( env_level_obj.tile_grid[# bbox_right div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR ) ||
                ( env_level_obj.tile_grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR );
                           
// check for y meeting
var y_meeting = ( env_level_obj.tile_grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR ) ||
                ( env_level_obj.tile_grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR );
                           
// check for center meeting                
var center_meeting = env_level_obj.tile_grid[# new_x div CELL_WIDTH, new_y div CELL_HEIGHT] != FLOOR;

// move back to original position
x = origin_x;
y = origin_y;

// return either true or false
return x_meeting || y_meeting || center_meeting;
