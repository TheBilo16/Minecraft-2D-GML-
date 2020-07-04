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
	var inventory = ds_list_write(inventorySave),
		itemsObtained = ds_list_write(obj_player.itemsObtained);
	
	ini_write_string("player","inventory",inventory);
	ini_write_string("player","items-obtained",itemsObtained);
	ini_write_real("player","x",obj_player.x);
	ini_write_real("player","y",obj_player.y);
	ini_close();
	
	show_debug_message("Game save");
}

function loadGame(){
	ini_open("minecraftsav.ini");

	var inventory	= ini_read_string("player","inventory",""),
		itemsObtained = ini_read_string("player","items-obtained",""),
		xx = ini_read_real("player","x",-1),
		yy = ini_read_real("player","y",-1);
		
	ini_close();
	
	if(inventory != ""){
		//Load Data to List
		var loadInventory = ds_list_create();
		ds_list_read(loadInventory,inventory);
		
		for(var i = 0; i < ds_list_size(loadInventory); i++){
			//Decode JSON
			var json = json_decode(loadInventory[| i]),
				items = new Items().normal;
			
			if(json != -1){
				for(var e = 0; e < array_length(items); e++){
					if(json[? "id"] == items[e].idItem){
						var loadData = items[e];
						loadData.count = json[? "count"];
						loadData.durability = json[? "durability"];
					
						//Set Data to Player
						ds_list_add(obj_player.inventory,loadData);
					}
				}
			}
		}
	}
	
	if(itemsObtained != ""){
		var loadItemsObtained = ds_list_create();
		ds_list_read(loadItemsObtained,itemsObtained);
		obj_player.itemsObtained = loadItemsObtained;
	}
	
	if(xx != -1) obj_player.x = xx;
	if(yy != -1) obj_player.y = yy;
	
	show_debug_message("Game load");
}

function deleteData(){
	if(file_exists("minecraftsav.ini")){
		file_delete("minecraftsav.ini");	
		
		show_debug_message("Game delete");
	}
}