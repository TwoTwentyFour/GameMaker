///shr_navbot_room_end()

/*** On Room End ***/

// delete navigation path
if ( path_exists( navigation_path ))
{
    path_delete( navigation_path );
}
