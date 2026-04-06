import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// factory Uri.https(
//   String authority, [
//   String unencodedPath,
//   Map<String, dynamic>? queryParameters,
// ]) = _Uri.https;

// https://jsonplaceholder.typicode.com/posts/1
void main() async {
  print('starting request...');
  try {
    Post p = await fetchPost();
    print("post received:  $p");
  } catch (e) {
    print("Caught error: $e");
  }
}

// because we are not returning a value right away from this function
Future<Post> fetchPost() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(
    url,
    headers: {'User-Agent': 'Dart-Console-App', 'Accept': 'application/json'},
  );
  if (response.statusCode == 200) {
    // Map<String, dynamic> data = convert.jsonDecode(response.body);
    // return Post(data["title"], data["userId"]);
    return Post.fromJson(convert.jsonDecode(response.body));
  } else {
    // If it failed (like a 404), throw an error instead of crashing the parser
    throw Exception('Failed to load post. Status: ${response.statusCode}');
  }
}

class Post {
  String title;
  int userId;

  Post({required this.title, required this.userId});

  // Instead of manually typing data['title'] everywhere in your app, you can create a Factory Constructor. This is a special constructor that "magically" turns a JSON Map into a Post object.
  // The 'Factory' constructor: it takes a Map and returns a Post

  // factory: Unlike a normal constructor that always creates a new instance, a factory constructor can return an existing instance or even a subclass. In this context, it's used for Data Mapping.

  // .fromJson: This is a Named Constructor. Dart allows you to have multiple constructors with different names. This makes it very clear to other programmers: "Use this constructor specifically when you have JSON data."

  // Why go through all this trouble?
  // Without this factory, every time you wanted to use a post from the web, you'd have to write:
  // print(myResponseData['title']);
  // The Problem: What if the API changes and title becomes post_title? You'd have to find and change that string in 50 different places in your app.
  // The Solution: With the factory, you change it one time in one line, and the rest of your app stays exactly the same.
  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(title: data['title'], userId: data['userId']);
  }

  // Standard Constructor: Post(this.title, this.userId);
  // Named Constructor: Post.anythingYouWant(parameters);

  @override
  String toString() => 'Post: $title (User: $userId)';
}
