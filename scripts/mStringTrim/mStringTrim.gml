///@arg stringToTrim

var str = string(argument0)

//Handle the left side of the string
while (string_char_at(str, 1) == " " || string_char_at(str, 1) == "#"
	|| string_char_at(str, 1) == "\r" || string_char_at(str, 1) == "\t"
	|| string_char_at(str, 1) == "\n" || string_char_at(str, 1) == "\v"
	|| string_char_at(str, 1) == "\b" || string_char_at(str, 1) == "\f") 
{
	str = string_delete(str, 1, 1);
}

//Handle the right side of the string
while (string_char_at(str, string_length(str)) == " " || string_char_at(str, string_length(str)) == "#" 
	|| string_char_at(str, string_length(str)) == "\r" || string_char_at(str, string_length(str)) == "\t"
	|| string_char_at(str, string_length(str)) == "\n" || string_char_at(str, string_length(str)) == "\v"
	|| string_char_at(str, string_length(str)) == "\b" || string_char_at(str, string_length(str)) == "\f")
{
	str = string_delete(str, string_length(str), 1);
}

return str;
























//    var start = 0
//    for(i = 1; i <= string_length(new_str);i++){
//        if string_char_at(new_string, i) != char{
//            _start = i - 1
//            break
//        }
//    }
//    if _start != 0{new_string = string_delete(new_string,1,_start)}
//}
//if side == "right" or side == "both"{
//    var _end = 0
//    for(i=string_length(new_string);i > 0;i--){
//        if string_char_at(new_string, i) != char{
//            _end = i + 1
//            break
//        }
//    }
//    if _end != 0{new_string = string_delete(new_string,_end,string_length(new_string))}
//}
//return new_string