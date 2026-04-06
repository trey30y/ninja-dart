// The "Library" Challenge

// Create a List of Book objects.

// Add 3 different books to that list (using your new Book class).
// Use a For-in Loop to go through the list.
// Inside the loop, call the .read() method for each book.

import 'dart:io';

class Book {
  String title;
  int pages;

  Book({required this.title, required this.pages});

  void desc() {
    print("Book ${title} has ${pages} pages");
  }
}

int getNum({required String kind}) {
  int? num;
  // Users are unpredictable! They might type "banana" instead of "5". To handle this safely, we use int.tryParse().
  // int.parse(): Crashes your app if the input isn't a number.
  // int.tryParse(): Returns null if the input isn't a number (much safer!).
  int limit;
  if (kind == "numOfBooks") {
    limit = 10;
  } else {
    limit = 2000;
  }
  while (num == null || num <= 0 || num > limit) {
    if (kind == "numOfBooks") {
      stdout.write("Write a positive number of books below $limit: ");
    } else {
      stdout.write("Write a positive number of pages below $limit: ");
    }
    // read the line, the '?' is because the user might send nothing(null)
    String? input = stdin.readLineSync();
    // Expression A ?? Expression B Null-Coalescing operator
    // Dart looks at Expression A.
    // If A is NOT null, it uses A and ignores B.
    // If A IS null, it uses B.
    num = int.tryParse(input ?? "");
    if (num == null || num <= 0 || num > limit) {
      print("Invalid input! Please try again.");
    }
  }
  return num;
}

void main() {
  int numOfBooks = getNum(kind: "numOfBooks");
  List<Book> bookList = [];
  for (var i = 1; i <= numOfBooks; i++) {
    stdout.write("Book $i title:");
    String? title = stdin.readLineSync();
    while (title == "") {
      stdout.write("Book $i title:");
      if (title == "") {
        print("Title cannot be empty.");
      }
      title = stdin.readLineSync();
    }
    int numOfPages = getNum(kind: "numOfPages");
    //   This operator ?? is called the Null-Coalescing Operator (or the "If-Null" operator).
    // Think of it as a safety net or a default value creator. It’s like saying: "Try to use the value on the left, but if that value is missing (null), catch it with the value on the right instead."
    bookList.add(Book(title: title ?? "unknown title", pages: numOfPages));
  }
  // print the booklist
  for (var book in bookList) {
    print("${book.title} has ${book.pages} pages");
  }
}
