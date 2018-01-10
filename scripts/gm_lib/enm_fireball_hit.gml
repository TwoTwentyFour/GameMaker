///enm_fireball_hit()

/*** Fireball Hit Player ***/

// create damage object and destroy self
instance_create( x, y, test_enm_damage_obj );

instance_destroy();
