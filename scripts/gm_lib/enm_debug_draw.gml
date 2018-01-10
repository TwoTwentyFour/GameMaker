///enm_debug_draw()

/*** Draw Debug Info ***/

// agro radius
draw_set_colour( c_red );
for ( var i = 0; i < instance_number( test_enm_obj ); i++ )
{
   enm_instance[i] = instance_find( test_enm_obj, i );
   draw_circle( enm_instance[i].x, enm_instance[i].y, idle_range, true );
   draw_circle( enm_instance[i].x, enm_instance[i].y, shoot_range, true );
}

