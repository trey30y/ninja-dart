void main() async {
  // Futures represents Async Operations. It is used for tasks that take time such as: fetching data from the internet, reading a large file from a disk, quering a database
  // A Future can be completed or uncompleted
  // Completed - with value(everything went well) or with error(something went wrong)
  // fetchPost().then((p) => {print(p)});
  final post = await fetchPost();
  print(post);
}

// because we are not returning a value right away from this function
Future<Post> fetchPost() {
  const delay = Duration(seconds: 3);
  // creating a delay in the code, delayed() accepts a Duration object and a callback that runs after Duration ended
  // A callback function is a function that you pass as an argument to another function, with the expectation that it will be "called back" (executed) at a later time.
  // A future is a result of an async function, something that takes some time
  return Future.delayed(delay, () {
    return Post('my post', 123);
  });
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
