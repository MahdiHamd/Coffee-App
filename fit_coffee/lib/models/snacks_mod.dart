class Snacks {
  int id;
  String name;
  double price;
  String pic;
  int quantites;
  String type;
  Snacks({
    required this.id,
    required this.name,
    required this.price,
    required this.pic,
    required this.type,
    required this.quantites,
  });
}

List<Snacks> snacksList = [
  Snacks(
    id: 0,
    name: "Chips Lay's",
    price: 1,
    pic: "assets/sanks/1.jpg",
    type: "snack",
    quantites: 1,
  ),
  Snacks(
    id: 1,
    name: "Doritos",
    price: 1,
    pic: "assets/sanks/2.jpg",
    type: "snack",
    quantites: 1,
  ),
  Snacks(
    id: 2,
    name: "Galaxy  ",
    price: 0.5,
    pic: "assets/sanks/3.jpg",
    type: "snack",
    quantites: 1,
  ),
  Snacks(
    id: 3,
    name: "Snakers  ",
    price: 0.5,
    pic: "assets/sanks/4.jpg",
    type: "snack",
    quantites:1,
  ),
  Snacks(
    id: 4,
    name: "AL Fares",
    price: 1.5,
    pic: "assets/sanks/5.png",
    type: "snack",
    quantites: 1,
  ),
];
