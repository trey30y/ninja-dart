// type castinc
import 'dart:ffi';

void main() {
  String input = "100";
  // conversion
  int score = int.parse(input);
  print("The score is ${score}");

  var name = "Pepe";
  name = "Petru";
  print(name);

  // final - The value can be decided while the program is running (like the current time or a user's name), but once it's set, it stays set.
  final Int age;
  const isOpen = true;
}
