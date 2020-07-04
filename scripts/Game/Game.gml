function saveGame(){
	ini_open("minecraftsav.ini");
	
	var inventorySave = ds_list_create();
	
	for(var i = 0; i < ds_list_size(obj_player.inventory); i++){
		//Map Create
		var save = ds_map_create();
		ds_map_add(save,"id",obj_player.inventory[| i].idItem);
		ds_map_add(save,"count",obj_player.inventory[| i].count);
		ds_map_add(save,"durability",obj_player.inventory[| i].durability);
		
		//Convert to Json and add List
		ds_list_add(inventorySave,json_encode(save));
		ds_map_clear(save);
	}
	
	//Save Data
	var str = ds_list_write(inventorySave);
	ini_write_string("player","inventory",str);
	ini_close();
}

function loadGame(){
	ini_open("minecraftsav.ini");

	var inventory	= ini_read_string("player","inventory","");
	
	if(inventory != ""){
		//Load Data to List
		var loadInventory = ds_list_create();
		ds_list_read(loadInventory,inventory);
		
		for(var i = 0; i < ds_list_size(loadInventory); i++){
			//Decode JSON
			var json = json_decode(loadInventory[| i]);
			
			for(var e = 0; e < array_length(obj_control.items); e++){
				if(json[? "id"] == obj_control.items[e].idItem){
					var loadData = obj_control.items[e];
					loadData.count = json[? "count"];
					loadData.durability = json[? "durability"];
					
					//Set Data to Player
					ds_list_add(obj_player.inventory,loadData);
				}
			}
		}
	}

	ini_close();
	
	show_debug_message("Game load");
}

function deleteData(){
	if(file_exists("minecraftsav.ini")){
		file_delete("minecraftsav.ini");	
	}
}