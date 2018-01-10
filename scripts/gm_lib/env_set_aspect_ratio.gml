///env_set_aspect_ratio()

/*** Set Apsect Ratio ***/

var base_w = RES_WIDTH;
var base_h = RES_HEIGHT;
var aspect = base_w / base_h ; // get the GAME aspect ratio

if ( display_get_width() < display_get_height() )
{
    // portrait
    var ww = min( base_w, display_get_width() );
    var hh = ww / aspect;
}
else
{
    // landscape
    var hh = min( base_h, display_get_height() );
    var ww = hh * aspect;
}

surface_resize( application_surface, ww, hh );
