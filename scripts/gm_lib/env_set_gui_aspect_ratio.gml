///env_set_gui_aspect_ratio()

/*** Set GUI Aspect Ratio ***/

var gui_base_w = RES_WIDTH;
var gui_base_h = RES_HEIGHT;
var gui_aspect = display_get_width() / display_get_height();

if ( gui_aspect > 1 )
{
    // landscape
    display_set_gui_size( gui_base_h * gui_aspect, gui_base_h );
}
else
{
    // portrait
    display_set_gui_size( gui_base_w, gui_base_w / gui_aspect );
}
