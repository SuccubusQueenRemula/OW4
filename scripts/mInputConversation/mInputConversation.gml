with (oInputHandler)
{
inputRight = false;
inputLeft = false;
inputUp = keyboard_check(ord("W"));
inputDown = keyboard_check(ord("S"));
inputLeftClick = mouse_check_button_pressed(mb_left);
inputSpace = keyboard_check_pressed(vk_space);

inputMouseWheelUp = mouse_wheel_up();
inputMouseWheelDown = mouse_wheel_down();
}