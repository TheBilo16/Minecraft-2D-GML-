draw_self();

if(distance_to_object(obj_player) < 16){
	draw_set_halign(fa_center);
	draw_text(x + sprite_get_width(sprite_index) / 2,y - 12,durability);
	draw_set_halign(fa_left);
}