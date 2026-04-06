void main() {
  var noodles = MenuItem("veg noodles", 9.99);
  var pizza = Pizza("pizza volcano", 15.99, ["mushrooms", "peppers"]);
  var roast = MenuItem("roast dinner", 12.49);
  var kebab = MenuItem("doner kebab", 7.49);

  var foods = Collection<MenuItem>('Menu Items', [
    noodles,
    pizza,
    roast,
    kebab,
  ]);
  var random = foods.randomItem();
  print(random);
}

class MenuItem {
  String title;
  double price;
  MenuItem(this.title, this.price);
  String format() {
    return "$title --> $price";
  }

  @override
  String toString() {
    return format();
  }
}

class Pizza extends MenuItem {
  List<String> toppings;
  Pizza(super.title, super.price, this.toppings);

  @override
  String format() {
    var formattedToppings = "Contains: ";
    for (var topping in toppings) {
      formattedToppings = "$formattedToppings $topping";
    }
    return '$title --> $price \n$formattedToppings';
  }

  @override
  String toString() {
    return format();
  }
}

class Collection<T> {
  String name;
  List<T> data;

  // The "Shadowing" Rule
  // You must use this only when there is a local variable (like a parameter) with the exact same name as your property. This is called Shadowing.
  Collection(this.name, this.data);

  // returns a random item from the data property
  T randomItem() {
    // If there is no other variable named data inside your randomItem() method, Dart already knows you are talking about the property defined at the top of the class. Adding this. is considered "extra noise."

    // Because data is unique in that "scope," Dart doesn't need a map. It already knows that when you say data, you must be talking about the property you defined at the top of the class.
    data.shuffle();
    return data[0];
  }
}
