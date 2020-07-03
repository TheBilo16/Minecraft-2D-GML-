function checkCollisionTree(instance){
	var collisionTree, factory;
	factory = instance.currentDirection == "left" ? -1 : 1;
	collisionTree = instance_place(x + factory,y,obj_tree);
	
	if(collisionTree != noone && instance.currentState == "player-action"){
		collisionTree.durability -= instance.strength / room_speed; 
		if(instance.currentObject != noone){
			var durability = instance.inventory[| 0].durability;
			instance.inventory[| 0].durability = durability - instance.strength / room_speed;	
		}
	}
}