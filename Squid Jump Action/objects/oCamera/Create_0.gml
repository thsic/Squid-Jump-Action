
resWidth = 248;//990
resHeight = 135;//540
resScale = 4;

cameraSmooth = 0.1;

//viewを有効に
view_enabled = true;
view_visible[0] = true;

//camera生成
camera = camera_create_view(0, 0, resWidth, resHeight);

//viewと紐付け
view_set_camera(0, camera);

//リサイズ
window_set_size(resWidth * resScale, resHeight * resScale);
surface_resize(application_surface, resWidth * resScale, resHeight * resScale);

display_set_gui_size(resWidth, resHeight);

//ウィンドウの位置をセンターに
var _displayWidth = display_get_width();
var _displayHeight = display_get_height();

var _winWidth = resWidth * resScale;
var _winHeight = resHeight * resScale;

window_set_position(_displayWidth/2 - _winWidth/2, _displayHeight/2 - _winHeight/2);
