class Book {
  // properties
  String title;
  int pages;
  // constructor: Why use required?
  // Because we put { } around the parameters, they become optional by default. But a Book needs a title! The required keyword tells Dart: "Don't let the developer create a Book unless they provide these specific pieces of info."
  Book({required this.title, required this.pages});

  // methods
  void desc() {
    print("The book '${title}' has ${pages} pages");
  }
}

void main() {
  Book myBook = Book(title: 'Dart for Ninjas', pages: 200);
  myBook.desc();
}
