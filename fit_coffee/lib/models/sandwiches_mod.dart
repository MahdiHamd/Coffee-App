class Sandwiches {
  int id;
  String name;
  double price;
  String pic;
  int quantites ;
  String type;
  Sandwiches({
    required this.id,
    required this.name,
    required this.price,
    required this.pic,
    required this.type,
    required this.quantites,
  });
}

List<Sandwiches> sandwichesList = [
  Sandwiches(
    id: 0,
    name: "Falafel",
    price: 1,
    pic: "assets/sw/1.jpg",
    type: "sandwiches",
    quantites: 1,
  ),
  Sandwiches(
    id: 1,
    name: "Shawerma",
    price: 2,
    pic: "assets/sw/2.jpg",
    type: "sandwiches",
    quantites: 1,
  ),
  Sandwiches(
    id: 2,
    name: "zinger ",
    price: 2.25,
    pic: "assets/sw/3.jpg",
    type: "sandwiches",
    quantites: 1,
  ),
  Sandwiches(
    id: 3,
    name: "Burger ",
    price: 3,
    pic: "assets/sw/4.jpg",
    type: "sandwiches",
    quantites: 1,
  ),
  Sandwiches(
    id: 4,
    name: "Hot Dog",
    price: 2.5,
    pic: "assets/sw/5.png",
    type: "sandwiches",
    quantites: 1,
  ),
];
