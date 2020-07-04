if(global.gameState != "run"){
	drawDarkScreen(0.8);	
}

switch(global.gameState){
	case "new-item-player":
		if(global.newItemData != noone){
			var item = global.newItemData,
				index = sprite_get_number(item.sprite) > 1 ? 1 : 0,
				xx = view_wport[0] / 2,
				yy = view_hport[0] / 2;
				
			draw_set_halign(fa_center);
			draw_text(xx,yy - (16 * 3),"NUEVO OBJETO OBTENIDO");
			draw_set_halign(fa_left);
			draw_sprite_ext(item.sprite,index,xx - 16,yy - 16,3,3,0,-1,1);	
		}
		break;
}