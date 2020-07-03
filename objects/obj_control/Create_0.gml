global.custom_font = font_add_sprite_ext(custom_font," ABCDEFGHIJQLMNOPQRSTUVWXYZ0123456789.,;:!¡-",true,2);

#region
	items = [
		{
			idItem : 0,
			name : "HACHA DE ROCA NEGRA",
			durability : 15,
			sprite : spr_axe_blackstone,
			type : "item-only",
			powerup : {
				key : "strength",
				value : 1
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
		}
	]
#endregion