class ColdMod {
  int id;
  String name;
  double price;
  String pic;
  int quantites;
  String type;
  ColdMod({
    required this.id,
    required this.name,
    required this.price,
    required this.pic,
    required this.type,
    required this.quantites,
  });
}

List<ColdMod> coldList = [
  ColdMod(
    id: 0,
    name: "Pepsi",
    price: 0.5,
    pic: "assets/cold/1.jpg",
    type: "cold",
    quantites: 1,
  ),
  ColdMod(
    id: 1,
    name: "Red Bull",
    price: 2,
    pic: "assets/cold/2.jpg",
    type: "cold",
    quantites: 1,
  ),
  ColdMod(
    id: 2,
    name: "Rani Juice",
    price: 0.5,
    pic: "assets/cold/3.jpg",
    type: "cold",
    quantites: 1,
  ),
  ColdMod(
    id: 3,
    name: "Water",
    price: 0.5,
    pic: "assets/cold/4.jpg",
    type: "cold",
    quantites: 1,
  ),
  ColdMod(
    id: 4,
    name: "Shaneeneh",
    price: 0.5,
    pic: "assets/cold/5.jpg",
    type: "cold",
    quantites: 1,
  ),
];
