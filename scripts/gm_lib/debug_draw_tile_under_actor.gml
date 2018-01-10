///debug_draw_tile_under_actor( actor )

/*** Draw Yellow Block Underneath Cursor position ***/

var actor = argument[0];
var debug_tile_depth = -9; 

// get relative tile position for the actor
var new_rel_actor_x = (actor.x div CELL_WIDTH) * CELL_WIDTH;
var new_rel_actor_y = (actor.y div CELL_WIDTH) * CELL_WIDTH;

// highlight tile underneath the actor
tile_add( debug_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, 
          new_rel_actor_x, new_rel_actor_y, debug_tile_depth );
               
// delete tile at actor's old position
if ( old_rel_actor_x == new_rel_actor_x || old_rel_actor_y == new_rel_actor_y )
{
    old_tile = tile_layer_find( debug_tile_depth, old_rel_actor_x, old_rel_actor_y );    
    if ( tile_exists( old_tile ))
    {
        tile_delete( old_tile );
    }
}

// update actor position
old_rel_actor_x = new_rel_actor_x;
old_rel_actor_y = new_rel_actor_y;

