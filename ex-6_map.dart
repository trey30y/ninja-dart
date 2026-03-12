// .map() is a bit "sneaky." You might expect it to return a List, but it actually returns something called an Iterable.

void main() {
  List<int> rawScores = [45, 88, 12, 92, 55, 70];

  // 1. .where() filters them
  // 2. .map() transforms them
  // 1. Filter it to keep only the High Scores (greater than 60).
  // 2. Transform those numbers into a String that says "Top Score: X".
  print(rawScores.where((s) => s > 60).map((s) => "Top score: ${s}"));

  // Can you write a chain that:
  // Filters for names that start with 'm'? (Hint: name.startsWith('m'))
  // Maps them to Upper Case? (Hint: name.toUpperCase())
  List<String> players = ['mario', 'luigi', 'peach', 'bowser'];
  List<String> mPlayers = players
      .where((player) => player.startsWith('m'))
      .map((player) => player.toUpperCase())
      .toList();
  print(mPlayers);

  // by default {} creates an empty map, if we want a Set we need to annotate it
  var planets = {1: "Mercury", 2: "Venus", 3: "Earth", 4: "Mars", 5: "Jupiter"};
  print(
    "The planets are: \n$planets",
  ); // {1: Mercury, 2: Venus, 3: Earth, 4: Mars, 5: Jupiter}
  print(planets[3]); // Earth
  planets[5] = "Jupiter Big Boi";
  planets[6] = "Uranus";
  print(
    "The planets are: \n$planets",
  ); // {1: Mercury, 2: Venus, 3: Earth, 4: Mars, 5: Jupiter Big Boi, 6: Uranus}
  // check if a key exists in a map
  print(planets.containsKey(4)); // true
  planets.remove(3);
  print(
    planets,
  ); // {1: Mercury, 2: Venus, 4: Mars, 5: Jupiter Big Boi, 6: Uranus}
  print("the keys: ${planets.keys} \nthe values: ${planets.values}");
  // the keys: (1, 2, 4, 5, 6)
  // the values: (Mercury, Venus, Mars, Jupiter Big Boi, Uranus)}
}
