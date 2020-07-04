particleSystem = part_system_create_layer("Instances",false);

particle = part_type_create();

part_type_direction(particle,0,360,0,0);
part_type_speed(particle,2,6,-0.05,0);
part_type_color_mix(particle,c_red,c_red);
part_type_life(particle,room_speed,room_speed * 2);
part_type_scale(particle,2,2);

emitter = part_emitter_create(particle);
part_emitter_region(particleSystem,emitter,x - 1,x + 1,y - 1, y + 1,ps_shape_line,ps_distr_gaussian)
part_emitter_stream(particleSystem,emitter,particle,10);