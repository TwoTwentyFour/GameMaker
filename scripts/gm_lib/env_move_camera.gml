///env_move_camera()

/*** Move Camera with Mouse and Player ***/

// keep camera centered relative to the player
depth = -y; // set depth 
if ( instance_exists(test_ply_obj) )
{
    view_xview[0] = test_ply_obj.x - (view_wview[0] / 2); // keep player in the center of the camera
    view_yview[0] = test_ply_obj.y - (view_hview[0] / 2); // keep player in the center of the camera
}
else 
{
    view_xview[0] = mouse_x - (view_wview[0] / 2); // target the mouse while in menu mode
    view_yview[0] = mouse_y - (view_hview[0] / 2); // target the mouse while in menu mode
}

// face the camera towards the mouse
move_towards_point( mouse_x, mouse_y, 0 );

// update camera position and keep the view in a 96 unit radius around the player
if ( instance_exists(test_ply_obj) )
{
    var new_cam_x = test_ply_obj.x + lengthdir_x( min( 96, distance_to_point( mouse_x, mouse_y )), direction );
    var new_cam_y = test_ply_obj.y + lengthdir_y( min( 96, distance_to_point( mouse_x, mouse_y )), direction );
}
else 
{
    var new_cam_x = (view_wview[0] / 2) + lengthdir_x( min( 96, distance_to_point( mouse_x, mouse_y )), direction );
    var new_cam_y = (view_hview[0] / 2) + lengthdir_y( min( 96, distance_to_point( mouse_x, mouse_y )), direction );
}

// slow camera to a stop instead of snapping to a position
x += (new_cam_x - x) / 12;
y += (new_cam_y - y) / 12;

// make the room view follow the camera object. Divide by two to keep the camera centered
view_xview = -(view_wview / 2) + x;
view_yview = -(view_hview / 2) + y;

// handle screen shake event
view_xview += random_range( -shake, shake );
view_yview += random_range( -shake, shake );
shake *= 0.9;

