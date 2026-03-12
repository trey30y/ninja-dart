void main() {
  List<int> scores = [50, 75, 20, 99, 100, 30];
  // for (var i = 0; i < scores.length; i++) {
  //   print(scores[i]);
  // }
  // for (int score in scores) {
  //   if (score >= 50) {
  //     print(score);
  //   } else {
  //     print("$score not high enough");
  //   }
  // }

  // .where() method expects you to give it a function that returns a Boolean (true/false). This is called a Predicate.
  for (int score in scores.where((s) => s >= 50)) {
    print("$score");
  }

  // print the even numbers
  for (int even in scores.where((s) => s % 2 == 0)) {
    print("$even is even");
  }
}
