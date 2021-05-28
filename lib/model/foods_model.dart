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

List<Foods> foods = [
  Foods(
    name: 'Pizza',
    description: "Our very own! Smashed Burger",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/pizza.png',
    imageBig: 'images/tes.jpg',
    price: "49.999",
  ),
  Foods(
    name: 'Hamburger',
    description: "Our very own! Smashed Burger",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/hamburger.png',
    imageBig: 'images/tes.jpg',
    price: "59.999",
  ),
  Foods(
    name: 'Double Hot Dog',
    description: "Our very own! Smashed Burger",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/doublehotdog.png',
    imageBig: 'images/tes.jpg',
    price: "12.000",
  ),
  Foods(
    name: 'Pasta Crunchy',
    description: "Our very own! Smashed Burger",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/pizza.png',
    imageBig: 'images/tes.jpg',
    price: "12.000",
  ),
  Foods(
    name: 'Menantea',
    description: "Our very own! Smashed Burger",
    title: "Top 2021",
    imageIcon: 'images/foods/pizza.png',
    imageBig: 'images/tes.jpg',
    price: "12.000",
  ),
  Foods(
    name: 'Es Teh Hangat',
    description: "Our very own! Smashed Burger",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/pizza.png',
    imageBig: 'images/tes.jpg',
    price: "34.999",
  ),
  Foods(
    name: 'Gorengan Sultan',
    description: "Our very own! Smashed Burger",
    title: "Delicious Food 2020",
    imageIcon: 'images/foods/pizza.png',
    imageBig: 'images/tes.jpg',
    price: "12.000",
  ),
];
