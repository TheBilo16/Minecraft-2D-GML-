if(durability < 0){
	var ps , part , emitter;
	ps = part_system_create();
	part = part_type_create();
	
	part_type_size(part,1,2,0.01,false);
	part_type_color1(part,c_white);
	part_type_speed(part,1,3,0.03,false);
	part_type_gravity(part,0.2,270);
	part_type_direction(part,0,180,0,0);
	part_type_life(part,room_speed * 2, room_speed * 5);
	
	var xx = x + 8, yy = y + 16;
	
	emitter = part_emitter_create(ps);
	part_emitter_region(ps,emitter,xx - 1, xx + 1 , yy - 1, yy + 1,ps_shape_line,ps_distr_gaussian);
	part_emitter_burst(ps,emitter,part,10);
	
	instance_create_depth(x,y + 16,0,obj_branch);
	instance_destroy();	
}