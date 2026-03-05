void main() {
  // you are telling Dart: "I’m going to run this function once, grab the result, and lock it into this variable forever. Don't let me (or anyone else) change it later."
  final greeting = greet("mario", 34);
  print(greeting);
  final say_goodbye = goodbye(name: "luigi", surname: "Gianluca");
  print(say_goodbye);
}

// positional arguments
String greet(String name, int age) {
  return "Hi, my name is $name and I am $age.";
}

// to use named parameters {}, we have to mark those parameters as either optional or required
// "?"meaning if we don't pass an argument it will default to null
String goodbye({required String name, String? surname}) {
  // assigns a value only if the variable is currently null. This is the Null-Aware Assignment operator
  // surname ??= "";
  return "Goodbye $name ${surname ?? ""}!";
}
