class Foods {
  String name;
  String description;
  String title;
  String imageIcon;
  String imageBig;
  String price;

  Foods({
    required this.name,
    required this.description,
    required this.title,
    required this.imageIcon,
    required this.price,
    required this.imageBig,
  });
}

var foods = [
  Foods(
    name: 'Pizza Hot',
    description: "Sausage, pepper, pizza, we made it for you!",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/pizza.png',
    imageBig: 'images/foods/bigpizza.png',
    price: "49.999",
  ),
  Foods(
    name: 'Hamburger',
    description: "Our very own! Smashed beef burgers",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/hamburger.png',
    imageBig: 'images/foods/bighamburger.png',
    price: "59.999",
  ),
  Foods(
    name: 'Double Hot Dog',
    description: "Double Beef Double Delicious",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/doublehotdog.png',
    imageBig: 'images/foods/bigdoublehotdog.png',
    price: "12.000",
  ),
  Foods(
    name: 'Sandwich',
    description: "Best food for ",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/sandwich.png',
    imageBig: 'images/foods/bigsandwich.png',
    price: "12.000",
  ),
  Foods(
    name: 'Sausage',
    description: "Grilled Sausage with sweet and sour spices",
    title: "Top 2021",
    imageIcon: 'images/foods/sausage.png',
    imageBig: 'images/foods/bigsausage.png',
    price: "12.000",
  ),
];
