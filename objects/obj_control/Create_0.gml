global.custom_font = font_add_sprite_ext(custom_font," ABCDEFGHIJQLMNOPQRSTUVWXYZ0123456789.,;:!¡-",true,2);
global.gameState = "run";

#region Game Items
	items = [
		{
			idItem : 0,
			name : "HACHA DE ROCA NEGRA",
			durability : 25,
			sprite : spr_axe_blackstone,
			type : "item-only",
			powerup : {
				key : "strength",
				value : 1.5
			}
		},
		{
			idItem : 1,
			name : "PICO DE ROCA NEGRA",
			durability : 50,
			sprite : spr_pickage_blackstone,
			type : "item-variable",
			powerup : {
				key : "strength",
				value : 0.5
			}
		},
		{
			idItem : 2,
			name : "RAMA",
			durability : "infinite",
			sprite : spr_branch,
			type : "item-variable",
			powerup : {
				key : "",
				value : 0
			}
		}
	]
#endregion