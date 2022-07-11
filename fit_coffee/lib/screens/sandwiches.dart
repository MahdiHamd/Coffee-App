import 'package:flutter/material.dart';

import '../models/sandwiches_mod.dart';
import 'home.dart';
import 'items.dart';

class SandWiches extends StatefulWidget {
  const SandWiches({Key? key}) : super(key: key);

  @override
  State<SandWiches> createState() => _SandWichesState();
}

class _SandWichesState extends State<SandWiches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: sandwichesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      newMethod(context, index);
                    });
                  },
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
                            sandwichesList[index].pic,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          sandwichesList[index].name,
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
                height: 350,
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
                              sandwichesList[index].quantites++;
                              sandwichesList[index].price =
                                  sandwichesList[index].price *
                                      sandwichesList[index].quantites;
                            });
                          },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${sandwichesList[index].quantites}',
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
                              sandwichesList[index].quantites--;
                              sandwichesList[index].price =
                                  sandwichesList[index].price *
                                      sandwichesList[index].quantites;
                            });
                          },
                        )
                      ],
                    ),
                    Text(
                      "${(sandwichesList[index].price).toStringAsFixed(2)} JOD",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        listName.add(sandwichesList[index].name);
                        listPrice.add(sandwichesList[index].price);
                        pictures.add(sandwichesList[index].pic);
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
