void main() {
  const String name = "mario";
  print(name);

  int age = 25;
  age = 30;
  print(age);

  bool isOpen = true;
  isOpen = false;
  print(isOpen);

  double average = 4.66;
  average += 5.55;
  print(average);

  // when we use type annotations to declare a variable, the variable cannot be null before it's used.
  // It's non-nullable by default, This means a variable cannot be `null` unless you specifically allow it.

  int point;
  // print(point); - null safety error
  int? anotherPoint;
  print(anotherPoint); // null
}
