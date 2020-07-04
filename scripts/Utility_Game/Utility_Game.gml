function getItemData(name){
	for(var i = 0; i < array_length(obj_control.items); i++){
		var itemName = string_lower(obj_control.items[i].name);
		if(itemName == string_lower(name)){
			return obj_control.items[i];	
		}
	}
	
	return {};
}

function forEach(array,callback){
	var size = typeof(array) == "array" ? array_length(array) : ds_list_size(array);
	
	for(var i = 0; i < size; i++){
		try{
			callback(array[i],i);	
		}catch(e){
			callback(array[| i],i);	
		}
	}
}

function drawDarkScreen(alpha){
	draw_set_alpha(alpha);
	draw_set_color(c_black);
	draw_rectangle(0,0,view_wport[0],view_hport[0],false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}