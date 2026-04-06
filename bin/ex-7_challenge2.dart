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
    return "${title} has ${pages} pages.";
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
    return "${super.desc()} and ${fileSize}MB.";
  }
}

int getInputNumber({required int limit}) {
  // int? (Nullable): The box is allowed to be empty. This is useful when you're waiting for user input, because before the user types anything, the box has nothing in it.
  int? num;
  while (num == null || num < 0 || num > limit) {
    // read the line, the '?' is because the user might send nothing(null)
    if (limit > 10) {
      stdout.write("Number of pages between 1 and 5000: ");
    } else {
      stdout.write("Number of books between 1 and 10: ");
    }
    String? input = stdin.readLineSync();
    num = int.tryParse(input ?? "");
    if (num == null || num == "") {
      print("Invalid input! Please try again.");
    } else if (num <= 0) {
      print("input number cannot be less/equal than 0.");
      num = null;
    } else if (num > limit) {
      print("input number cannot be greater than $limit.");
      num = null;
    }
  }
  return num;
}

double getDoubleNumber({required int limit}) {
  // int? (Nullable): The box is allowed to be empty. This is useful when you're waiting for user input, because before the user types anything, the box has nothing in it.
  double? num;
  while (num == null || num < 0 || num > limit) {
    // read the line, the '?' is because the user might send nothing(null)
    // String input = stdin.readLineSync() ?? "";
    stdout.write("size in MB greater than 0 and under 512MB: ");
    String input = stdin.readLineSync() ?? "";
    num = double.tryParse(input);
    if (num == null) {
      print("Invalid input! Please try again.");
    } else if (num <= 0) {
      print("input number cannot be less than 0.");
      num = null;
    } else if (num > limit) {
      print("input number cannot be greater than $limit.");
      num = null;
    }
  }
  return num;
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
  var numBooks = getInputNumber(limit: 10);
  for (var i = 0; i < numBooks; i++) {
    bool ebook = isEBook();
    if (ebook) {
      library.add(
        Ebook(
          title: getTitle(),
          pages: getInputNumber(limit: 5000),
          fileSize: getDoubleNumber(limit: 512),
        ),
      );
    } else {
      library.add(Book(title: getTitle(), pages: getInputNumber(limit: 5000)));
    }
  }

  print("Library contains: ");
  for (var book in library) {
    print(book);
  }
}
