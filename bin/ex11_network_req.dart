import 'package:http/http.dart' as http;

// factory Uri.https(
//   String authority, [
//   String unencodedPath,
//   Map<String, dynamic>? queryParameters,
// ]) = _Uri.https;

// https://jsonplaceholder.typicode.com/posts/1
void main() {
  fetchPost();
}

// because we are not returning a value right away from this function
Future<void> fetchPost() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
  try {
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    print(response.body);
  } catch (e) {
    print("Caught an error: $e");
  }
}

class Post {
  String title;
  int userId;
  Post(this.title, this.userId);
  String format() {
    return "$title --> userId: $userId";
  }

  @override
  toString() {
    return format();
  }
}
