// The EBook Challenge

// Create the EBook class that extends Book.
// Add a new property: double fileSize (to represent MB).
// Create the constructor: Use the super parameter shorthand (super.title, super.pages) and include this.fileSize.
// Override desc(): Use the @override keyword. Inside the method, call super.desc() first to print the standard info, then add a second print statement for the file size.
import 'dart:io';

class Book {
  String title;
  int pages;

  Book({required this.title, required this.pages});

  String desc() {
    return "${this.title} has ${this.pages} pages.";
  }

  @override
  String toString() {
    return desc();
  }
}

class Ebook extends Book {
  double fileSize;

  Ebook({required super.title, required super.pages, required this.fileSize});

  @override
  String desc() {
    return "${super.desc()} and ${this.fileSize}MB.";
  }
}

// We can use <T extends num> to tell Dart: "This function works with any type of number."
// T is our placeholder for the Type
T getNumber<T extends num>({required num limit, required String prompt}) {
  T? value;

  while (value == null) {
    stdout.write(prompt);
    String input = stdin.readLineSync() ?? "";

    // 1. try to parse as a general number
    var parsed = num.tryParse(input);

    // 2. check if the parsed number is the type we want
    if (parsed is T) {
      if (parsed > 0 && parsed <= limit) {
        value = parsed;
      } else {
        print("Please enter a number between 1 and $limit.");
      }
    } else {
      print(
        "Invalid input type. Please enter a valid ${T.toString().toLowerCase()}.",
      );
    }
  }
  return value;
}

String getTitle() {
  String? title;
  while (title == null || title.trim().isEmpty) {
    stdout.write("what is the title: ");
    title = stdin.readLineSync();
    if (title == null || title.trim().isEmpty) {
      print("title cannot be empty");
      continue;
    }
  }
  return title.trim();
}

bool isEBook() {
  String? answer;
  do {
    stdout.write("ebook? y/n only: ");
    answer = stdin.readLineSync()?.trim();
    if (answer != null) {
      if (answer.toLowerCase() == "y") {
        return true;
      } else if (answer.toLowerCase() == "n") {
        return false;
      } else {
        print("'y' or 'n' answers only please'");
      }
    }
  } while (true);
}

void main() {
  List<Book> library = [];
  // input the number of books between 1 and 10
  var numBooks = getNumber(
    limit: 10,
    prompt: "How many books between 1 and 10: ",
  );
  for (var i = 0; i < numBooks; i++) {
    bool ebook = isEBook();
    if (ebook) {
      library.add(
        Ebook(
          title: getTitle(),
          pages: getNumber(
            limit: 5000,
            prompt: "How many pages between1 and 5000: ",
          ),
          // In your code, your fileSize property was likely throwing an error because getInputNumber returns an int. Since the Ebook constructor expects a double, you have to convert it on the fly.
          fileSize: getNumber(
            limit: 512,
            prompt: "What size in MB? Enter a number between 1 and 512: ",
          ).toDouble(),
        ),
      );
    } else {
      library.add(
        Book(
          title: getTitle(),
          pages: getNumber(
            limit: 5000,
            prompt: "How many pages between1 and 5000:",
          ),
        ),
      );
    }
  }

  print("Library contains: ");
  library.forEach((book) => print(book));
}
