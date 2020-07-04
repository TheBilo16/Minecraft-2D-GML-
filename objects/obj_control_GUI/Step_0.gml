var keyAction,keyCancel;
keyAction = keyboard_check_pressed(ord("Z"));
keyCancel = keyboard_check_pressed(ord("X"));

switch(global.gameState){
	case "new-item-player":
		if(keyCancel) global.gameState = "run";
		break;
}