///ply_get_user_input()

/*** Get User Input ***/

// move
ply_input_x = (keyboard_check(ord('D')) - keyboard_check(ord('A')));
ply_input_y = (keyboard_check(ord('S')) - keyboard_check(ord('W')));

// attack
ply_input_attack = mouse_check_button_pressed( mb_left );

//dash
ply_input_dash = mouse_check_button_pressed( mb_right ) || 
                 keyboard_check_pressed( vk_space );
