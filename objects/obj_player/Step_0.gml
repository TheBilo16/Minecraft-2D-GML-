#region Current Object
	if(currentObject == noone){
		for(var i = 0; i < ds_list_size(inventory); i++){
			if(inventory[| i].count > 0){
				currentObject = inventory[| i];
				switch(inventory[| i].powerup.key){
					case "strength":
						strength += inventory[| i].powerup.value;
						break;
					case "defense":
						defense += inventory[| i].powerup.value;
						break;
					case "velocity":
						velocity += inventory[| i].powerup.value;
						break;
				}
				
				break;	
			}
		}
	}else{
		strength = initialStats.strength;
		defense = initialStats.defense;
		velocity = initialStats.velocity;
	}
#endregion

#region Inventory
	for(var i = 0; i < ds_list_size(inventory); i++){
		if(inventory[| i].durability <= 0 or inventory[| i].count == 0){
			ds_list_delete(inventory,i);
			if(i == 0) currentObject = noone;
		}
	}
#endregion

#region Move
	var keyLeft, keyRight, keyUp, keyDown , keyAction;
	keyLeft = -keyboard_check(vk_left);
	keyRight = keyboard_check(vk_right);
	keyUp = -keyboard_check(vk_up);
	keyDown = keyboard_check(vk_down);
	keyAction = keyboard_check(ord("Z"));

	//Grid Move
	if(place_snapped(16,16)){
		xx = (keyLeft + keyRight) * velocity;
		yy = (keyUp + keyDown) * velocity;
	
		if(keyAction){
			currentState = "player-action";
			xx = 0;
			yy = 0;
		}else{
			if(xx != 0 or yy != 0) currentState = "walking";
			else if(xx == 0 and yy == 0) currentState = "stopped";
		}
	}
#endregion

#region Direction
	if(xx > 0) currentDirection = "right";
	else if(xx < 0) currentDirection = "left";
	
	switch(currentDirection){
		case "left":
			sprite = spr_player_left;
			//sprite_atack = spr_player_atack_left;
			break;
		case "right":
			sprite = spr_player_right;
			//sprite_atack = spr_player_atack_right;
			break;
	}
#endregion

#region Base Collision

	if(place_meeting(x + xx,y, obj_block)) xx = 0;
	if(place_meeting(x,y + yy, obj_block)) yy = 0;

#endregion

#region Machine State

	switch(currentState){
		case "stopped":
			image_speed = 0;
			image_index = 0;
			sprite_index = sprite;
			break;
		case "walking":
			image_speed = 1;
			sprite_index = sprite;
			break;
		case "player-action":
			image_speed = 0;
			image_index = 1;
			break;
	}
	
#endregion

#region Actions Collision
	checkCollisionTree(self);
	
	//Colision Item
	var item = instance_place(x,y,obj_item_dropeable);
	if(item != noone){
		var get = false;
		
		for(var i = 0; i < ds_list_size(inventory); i++){
			if(inventory[| i] == item.data_object){
				if(item.data_object.type != "item-only"){
					inventory[| i].count += 1;
					get = true;
					break;
				}
					
				get = false;
				break;
			}
		}
		
		if(!get){
			var newItem = item.data_object;
			newItem.count = 1;
			
			ds_list_add(inventory,newItem);
		}
		
		with(item) instance_destroy();
	}
#endregion

x += xx;
y += yy;

//Debuging
if(keyboard_check_pressed(vk_enter)){
	deleteData();
}