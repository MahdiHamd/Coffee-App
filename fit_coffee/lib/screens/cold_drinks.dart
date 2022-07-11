import 'package:fit_coffee/models/cold_mod.dart';
import 'package:fit_coffee/screens/items.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class ColdDrinks extends StatefulWidget {
  const ColdDrinks({Key? key}) : super(key: key);

  @override
  State<ColdDrinks> createState() => _ColdDrinksState();
}

class _ColdDrinksState extends State<ColdDrinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: coldList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: (() {
                    setState(() {
                      newMethod(context, index);
                    });
                  }),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 50,
                          backgroundImage: AssetImage(
                            coldList[index].pic,
                          ),
                        ),
                        Text(
                          coldList[index].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const Items();
          }));
        },
        child: const Icon(Icons.store),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future<dynamic> newMethod(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              title: const Text('Add Item'),
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          child: const Icon(Icons.add, size: 20),
                          mini: true,
                          onPressed: () {
                            setState(() {
                              coldList[index].quantites++;
                              coldList[index].price = coldList[index].price *
                                  coldList[index].quantites;
                            });
                          },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${coldList[index].quantites}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        FloatingActionButton(
                          child: const Icon(Icons.remove, size: 20),
                          mini: true,
                          onPressed: () {
                            setState(() {
                              coldList[index].quantites--;
                              coldList[index].price = coldList[index].price *
                                  coldList[index].quantites;
                            });
                          },
                        )
                      ],
                    ),
                    Text(
                      "${(coldList[index].price).toStringAsFixed(2)} JOD",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        listName.add(coldList[index].name);
                        listPrice.add(coldList[index].price);
                        pictures.add(coldList[index].pic);
                      },
                      child: const Text("Done"),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
