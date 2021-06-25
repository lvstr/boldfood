class Food {
  String name;
  String description;
  String title;
  String image;
  String imageIcon;
  String price;

  Food({
    required this.name,
    required this.description,
    required this.title,
    required this.image,
    required this.imageIcon,
    required this.price,
  });
}

List<Food> foods = [
  Food(
    name: 'Pizza Hot',
    description: "Sausage, pepper, pizza, we made it for you!",
    title: "Delicious Food 2020",
    image: 'images/foods/pizzahot.png',
    imageIcon: 'images/icons/pizzahot.png',
    price: "49.999",
  ),
  Food(
    name: 'Hamburger',
    description: "Our very own! Smashed beef burgers",
    title: "Delicious Food 2020",
    image: 'images/foods/hamburger.png',
    imageIcon: 'images/icons/hamburger.png',
    price: "59.999",
  ),
  Food(
    name: 'Double Hot Dog',
    description: "Double Beef Double Delicious",
    title: "Delicious Food 2020",
    image: 'images/foods/doublehotdog.png',
    imageIcon: 'images/icons/doublehotdog.png',
    price: "12.000",
  ),
  Food(
    name: 'Sandwich',
    description: "Best Food when you wake up",
    title: "Delicious Food 2020",
    image: 'images/foods/sandwich.png',
    imageIcon: 'images/icons/sandwich.png',
    price: "12.000",
  ),
  Food(
    name: 'Sausage',
    description: "Grilled Sausage with sweet and sour spices",
    title: "Top 2021",
    image: 'images/foods/sausage.png',
    imageIcon: 'images/icons/sausage.png',
    price: "12.000",
  ),
];

List<Food> desserts = [
  Food(
    name: 'Peppermint Brownies',
    description: "Brownies is black, peppermint is blue, we made it for you!",
    title: "Delicious Food 2020",
    image: 'images/foods/brownies.png',
    imageIcon: 'images/icons/brownies.jpg',
    price: "39.999",
  ),
  Food(
    name: 'Maple Pecan Ice Cream',
    description: "Toasty flavour of great maple syrup",
    title: "Delicious Food 2021",
    image: 'images/foods/icecream.png',
    imageIcon: 'images/icons/icecream.jpg',
    price: "29.999",
  ),
  Food(
    name: 'Spiced Pumpkin Ice Cream',
    description: " All the savour of an awesome pumpkin pie",
    title: "Delicious Food 2020",
    image: 'images/foods/pumpkinicecream.png',
    imageIcon: 'images/icons/pumpkinicecream.jpg',
    price: "29.999",
  ),
  Food(
    name: 'Nutella Panna Cotta',
    description: "Call it a milk chocolate and hazelnut panna cotta",
    title: "Delicious Food 2020",
    image: 'images/foods/nutella.png',
    imageIcon: 'images/icons/nutella.jpg',
    price: "30.999",
  ),
];

List<Food> drinks = [
  Food(
    name: 'Mineral Water',
    description: "What your body need!",
    title: "Best Seller Drink",
    image: 'images/foods/water.png',
    imageIcon: 'images/icons/water.png',
    price: "3.000",
  ),
  Food(
    name: 'Triju',
    description: "Juice like a Superhero Group",
    title: "Top Drink 2019",
    image: 'images/foods/triju.png',
    imageIcon: 'images/icons/triju.jpeg',
    price: "30.999",
  ),
];

List<Food> snacks = [
  Food(
    name: 'Churos',
    description: "Watch Movie with this one",
    title: "Delicious Food 2018",
    image: 'images/foods/churos.png',
    imageIcon: 'images/icons/churos.png',
    price: "12.999",
  ),
  Food(
    name: 'Onion Ring',
    description: "Never gonna let this out of stock!",
    title: "Delicious Food 2021",
    image: 'images/foods/onionring.png',
    imageIcon: 'images/icons/onionring.png',
    price: "20.999",
  ),
];
