draw_text(10,40,currentObject != noone ? currentObject.name : "--EMPTY--");

for(var i = 0; i < ds_list_size(inventory); i++){
	var yy = 55 + (10 * (i + 1)),
		value = inventory[| i];
		
	draw_text(10,yy,"- " + value.name + "  -  " + string(value.count)  + "  -  " + string(value.durability));	
}

if(currentObject != noone){
	var xx , yy , scale;
	scale = 3;
	xx = view_wport[0] - (sprite_get_width(currentObject.sprite) * scale) - 10;
	yy = view_hport[0] - (sprite_get_height(currentObject.sprite) * scale) - 10;
	
	draw_sprite_ext(currentObject.sprite,0,xx,yy,scale,scale,0,-1,1);
}