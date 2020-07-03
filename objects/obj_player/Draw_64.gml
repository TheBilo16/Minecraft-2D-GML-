draw_text(10,10,currentObject != noone ? currentObject.name : "--EMPTY--");

var yy = 30;
for(var i = 0; i < ds_list_size(inventory); i++){
	draw_text(10,yy,"- " + inventory[| i].name + "   ->   " + string(inventory[| i].durability));	
	yy += 10;
}