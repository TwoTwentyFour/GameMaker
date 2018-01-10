///env_save_room_seed( room_key )

/*** Save Current Room Seed in Ooutput File ***/

ini_open( "room_seed_table.ini" );
var room_key = argument[0];
var seed_value  = random_get_seed();
ini_write_real( "rooms", room_key, seed_value );
ini_close();
