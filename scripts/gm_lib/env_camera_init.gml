///env_camera_init()

/*** Start Over the Player and Smooth Camera Stop ***/

// start camera over the player
if ( instance_exists( test_ply_obj) )
{
    x = test_ply_obj.x;
    y = test_ply_obj.y;
}
else 
{
    x = mouse_x;
    y = mouse_y;
}

// stop the camera from moving
view_xview = (x - view_wview) / 2;
view_yview = (y - view_hview) / 2;

// for screen shake
shake = 0;
