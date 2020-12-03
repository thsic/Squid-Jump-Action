
resWidth = 990;//990
resHeight = 540;//540
resScale = 2;

cameraSmooth = 0.1;

//viewを有効に
/*view_set_wport(0, resWidth/resScale);
view_set_hport(0, resHeight/resScale);*/
view_enabled = true;
view_visible[0] = true;

//camera生成(表示する範囲)
camera = camera_create_view(0, 0, resWidth/resScale, resHeight/resScale);

//viewと紐付け
view_set_camera(0, camera);


//リサイズ
window_set_size(resWidth, resHeight);

//ピクセルパーフェクト(cameraをどの解像度で表示するか)
surface_resize(application_surface, resWidth/resScale, resHeight/resScale);

display_set_gui_size(resWidth/resScale, resHeight/resScale);

//ウィンドウの位置をセンターに
var _displayWidth = display_get_width();
var _displayHeight = display_get_height();

var _winWidth = resWidth;
var _winHeight = resHeight;

window_set_position(_displayWidth/2 - _winWidth/2, _displayHeight/2 - _winHeight/2);



/*
camera_w = GAMESCREEN_WSIZE;
camera_h = GAMESCREEN_HSIZE;

//viewを有効にする
view_enabled = true;
view_visible[0] = true;

camera = camera_create_view(0, 0, camera_w, camera_h);

view_set_camera(0, camera);

//ウィンドウのリサイズはbootMgrでやってる

//surface_resize(application_surface, camera_w, camera_h);

//下のはピクセルパーフェクトじゃないバージョン
var _win_scale = global.window_magnification;
//surface_resize(application_surface, camera_w*_win_scale, camera_h*_win_scale);

display_set_gui_size(camera_w, camera_h);
