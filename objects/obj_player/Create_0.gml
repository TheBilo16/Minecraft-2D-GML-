#region	Player Variables
	xx = 0;
	yy = 0;
	currentDirection = "right";
	currentState = "stopped";
#endregion

#region Stats
	initialStats = {
		strength : 1,
		defense : 1,
		velocity : 1
	}

	strength = initialStats.strength;
	defense = initialStats.defense;
	velocity = initialStats.velocity;
#endregion

#region Inventory
	currentObject = noone;
	inventory = ds_list_create();
#endregion

#region Sprites
	sprite = spr_player_right;
	sprite_atack = spr_player_right;
#endregion

#region Object Variables
	image_speed = 0;
	image_index = 0;
#endregion