var keyLeft, keyRight, keyUp, keyDown , keyAction;
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyAction = keyboard_check(ord("Z"));

if(global.gameState == "run"){
	
	#region Inventory
		for(var i = 0; i < ds_list_size(inventory); i++){
			var value = inventory[| i];
			if(value.durability != "infinite"){
				if(value.durability <= 0 or value.count == 0){
					ds_list_delete(inventory,i);
					if(i == 0) currentObject = noone;
				}
			}
		}
	#endregion
	
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
					}
					
					break;	
				}
			}
		}else{
			strength = initialStats.strength;
			defense = initialStats.defense;
		}
	#endregion

	#region Move
		//Grid Move
		if(place_snapped(16,16)){
			xx = 0;
			yy = 0;
			
			if(keyLeft) xx = -1 * velocity;
			else if(keyRight) xx = 1 * velocity;
			else if(keyUp) yy = -1 * velocity;
			else if(keyDown) yy = 1 * velocity;
	
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
		if(item != noone && ds_list_size(inventory) <= inventoryMaxItems ){
			var isGet = false;
		
			for(var i = 0; i < ds_list_size(inventory); i++){
				if(inventory[| i].idItem == item.data_object.idItem){
					if(item.data_object.type != "item-only"){
						inventory[| i].count = inventory[| i].count + item.amount;
						isGet = true;
						break;
					}
					
					isGet = false;
					break;
				}
			}
		
			if(!isGet){
				var newItem = item.data_object;
				newItem.count = item.amount;
				ds_list_add(inventory,newItem);

				#region ¿Item Obtained?
					var isObtained = false;
					
					if(ds_list_size(itemsObtained) > 0){
						for(var i = 0; i < ds_list_size(itemsObtained); i++){
							var value = itemsObtained[| i];
							if(newItem.idItem == value){
								isObtained = true;
								break;
							}
							
							isObtained = false;
						}
					}
			
					if(!isObtained){
						ds_list_add(itemsObtained,newItem.idItem);
						global.newItemData = newItem;
						global.gameState = "new-item-player";
					}
				#endregion
			}
		
			with(item){ instance_destroy(); }
		}
	#endregion

	x += xx;
	y += yy;
}else{
	image_speed = 0;	
}