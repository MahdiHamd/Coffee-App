class ColdHot {
  int id;
  String name;
  double price;
  String pic;
  int quantites ;
  String type;
  ColdHot({
    required this.id,
    required this.name,
    required this.price,
    required this.pic,
    required this.type,
    required this.quantites,
  });
}
  List<ColdHot> hotList = [
    ColdHot(
      id: 0,
      name: "Trukish Coffee",
      price: 0.5,
      pic: "assets/hot/1.jpg",
      type: "hot",
      quantites: 1,
    ),
    ColdHot(
      id: 1,
      name: "Tea",
      price: 0.5,
      pic: "assets/hot/2.jpg",
      type: "hot",
      quantites: 1,
    ),
    ColdHot(
      id: 2,
      name: "Nascafe",
      price: 0.5,
      pic: "assets/hot/3.jpg",
      type: "hot",
      quantites: 1,
    ),
    ColdHot(
      id: 3,
      name: "Hot Chocolate",
      price: 0.5,
      pic: "assets/hot/4.jpg",
      type: "hot",
      quantites: 1,
    ),
    ColdHot(
      id: 4,
      name: "Americano",
      price: 0.5,
      pic: "assets/hot/5.jpg",
      type: "hot",
      quantites: 1,
    ),
  ];

