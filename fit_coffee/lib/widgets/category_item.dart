import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const CategoryItem(
    this.id,
    this.name,
    this.image, {
    Key ?key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 5, color: Colors.black),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
