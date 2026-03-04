/// This exercise demonstrates different types of for loops in Dart.
///
/// Dart supports traditional C-style for loops, for-in loops for collections,
/// and the .forEach method for a more functional approach.
void main() {
  // 1. Traditional for loop
  // Best when you need the index or a specific count.
  print('--- Traditional For Loop ---');
  for (var i = 1; i <= 3; i++) {
    print('Iteration $i');
  }

  // 2. For-in loop
  // The idiomatic way to iterate over elements in a collection.
  print('\n--- For-in Loop ---');
  final colors = ['Red', 'Green', 'Blue'];
  for (final color in colors) {
    print('Color: $color');
  }

  // 3. forEach method
  // A functional approach often used with collection literals or streams.
  print('\n--- .forEach() Method ---');
  colors.forEach((color) => print('Functional Color: $color'));

  print('\n--- CHALLENGE ---');
  print('Try modifying this file to print only even numbers from 1 to 10!');
  for (var i = 1; i <= 10; i++) {
    print('Number $i');
  }
}
