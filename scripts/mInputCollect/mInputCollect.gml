///@description Standard input collection. Used for normal gameplay.
with (oInputHandler)
{
	inputRight = keyboard_check(ord("D"));
	inputLeft = keyboard_check(ord("A"));
	inputUp = keyboard_check(ord("W"));
	inputDown = keyboard_check(ord("S"));
	inputLeftClick = mouse_check_button_pressed(mb_left);
	inputSpace = keyboard_check_pressed(vk_space);
	inputInventory = keyboard_check_pressed(ord("I"));
}