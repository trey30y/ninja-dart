void main() {
  // if we declare with var scores = [10, 20]; we can't add strings later
  List<int> scores = [50, 75, 20, 99, 20];
  scores[0] = 25;
  scores.add(100);
  print("adding 100: $scores");
  // scores.remove(20); // removes the first instance of the 20 that it finds
  print("removing the first instance of 20: $scores");
  // print("removing the last element: ${scores.removeLast()} => $scores");
  print("the length of $scores is ${scores.length}");
  print("before shuffle: $scores");
  scores.shuffle();
  print("after shuffle: $scores");
  print("index of 99: ${scores.indexOf(99)}");

  // unlike lists sets are not ordered and cannot hold duplicates of any given value
  Set<String> names = {"mario", "luigi", "peach"};
  print(names);
  names.add("bowser");
  print(names);
  print("names have a length of $names.length");
  // names.remove("luigi");
}
