// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createOtherItem(){
	repeat(5){
		var _itemId = irandom(2);
		if(_itemId != oGameMgr.prevOtherItem){
			//前回と同じアイテムidはほぼ選ばれない
			break;
		}
	}
	
	//生成
	oGameMgr.prevOtherItem = _itemId;
	switch(_itemId){
	case 0:
	case 1:
		var _itemObject = oRandomEventItem;
	break
	case 2:
		var _itemObject = oInfiniteJumpItem;
	break
	}
	var _spriteSize = sprite_get_width(object_get_sprite(_itemObject));
	var _y = irandom_range(_spriteSize/2, room_height-_spriteSize/2);
	instance_create_layer(room_width+_spriteSize/2, _y, "Items", _itemObject);
	
}