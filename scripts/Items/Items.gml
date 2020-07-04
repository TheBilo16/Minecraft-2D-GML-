function Items() constructor{
	normal = [
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
			type : "item-only",
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
	];
	
	combat = [];
}