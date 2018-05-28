gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

with (oCombatActor)
{
	if (sprite_exists(sprite_index))
	{
		gpu_set_fog(true, c_blue, 0, 1);
		draw_self();
	}
}
gpu_set_fog(false, c_white, 0, 0);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

if (instance_exists(oHurtBox))
{
	draw_set_color(c_blue);
	draw_rectangle(oHurtBox.x, oHurtBox.y, oHurtBox.x, oHurtBox.y, false);
	draw_set_color(c_yellow);
	draw_rectangle(oHurtBox.x - 1, oHurtBox.y - 1, oHurtBox.x + 1, oHurtBox.y + 1, true);
}