///enm_shoot()

/*** Enemy Shoot ***/

 if ( can_attack == true )
{
    can_attack = false;
    fire_ball_count++;
    var shoot_cooldown;
    instance_create( x, y, test_fireball_obj );
    
    var odds = 2;
    var fire_ball_max;
    if ( irandom( odds ) == odds )
    {
        fire_ball_max = 4;
    }
    else fire_ball_max = 2;
    
    if ( fire_ball_count <= fire_ball_max )
    {
        shoot_cooldown = .20;
    }
    else
    {
        fire_ball_count = 0;
        shoot_cooldown = .75;
    }
    
    // set attack cool down
    if ( alarm[1] == -1 )
    {
        alarm[1] = shoot_cooldown * room_speed;
    }
}
