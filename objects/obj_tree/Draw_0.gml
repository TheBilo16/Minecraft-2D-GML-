draw_self();
draw_set_font(global.custom_font);
draw_set_halign(fa_center);
draw_text(x + sprite_get_width(sprite_index) / 2,y - 12,durability);
draw_set_halign(fa_left);