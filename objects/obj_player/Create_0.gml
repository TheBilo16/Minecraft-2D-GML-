#region	Player Variables
	xx = 0;
	yy = 0;
	currentDirection = "right";
	currentState = "stopped";
	name  = "";
#endregion

#region Stats
	initialStats = {
		strength : 1,
		defense : 1
	}

	strength = initialStats.strength;
	defense = initialStats.defense;
	velocity = 1;
#endregion

#region Inventory
	currentObject = noone;
	inventoryMaxItems = 10;
	inventory = ds_list_create();
	itemsObtained = ds_list_create();
#endregion

#region Sprites
	sprite = spr_player_right;
	sprite_atack = spr_player_right;
#endregion

#region Object Variables
	image_speed = 0;
	image_index = 0;
#endregion