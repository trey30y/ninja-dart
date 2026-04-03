void main() {
  var noodles = MenuItem(title: 'veg noodles', price: 9.99);
  var pizza = Pizza(
    toppings: ["mushroom", "peppers"],
    title: "pizza volcano",
    price: 15.99,
  );
  print(noodles);
  print(pizza);
}

class MenuItem {
  String title;
  double price;

  MenuItem({required this.title, required this.price});

  String format() {
    return "${this.title} --> ${this.price}";
  }

  @override
  String toString() {
    return format();
  }
}

// Pizz class will inherit any methods and properties from the MenuItem class
class Pizza extends MenuItem {
  List<String> toppings;

  // when you use inheritance with named parameters, the super call must also use the names of the variables
  // Notice how in the Pizza constructor, we didn't use this.title? That's because title belongs to the Parent (MenuItem). We take it as a regular String title and then "hand it up" to the parent using super(title: title)
  // Before Super Parameters, we had to catch the variable and manually "hand it up" like this: Pizza({required String title}) : super(title: title);
  Pizza({required this.toppings, required super.title, required super.price});
  @override
  String format() {
    var formattedToppings = 'Contains: ';
    toppings.forEach(
      (topping) => formattedToppings = '$formattedToppings $topping',
    );
    return '$title -> $price, $formattedToppings';
  }

  @override
  String toString() {
    return format();
  }
}
