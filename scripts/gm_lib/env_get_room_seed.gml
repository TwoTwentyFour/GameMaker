///env_get_room_seed( room_key )

/*** Grab Seed from Previous Room from the .ini File ***/

ini_open( "room_seed_table.ini" );
var room_key = argument[0];
var seed_value = ini_read_real( "rooms", room_key, 1 );
ini_close();

return seed_value;
