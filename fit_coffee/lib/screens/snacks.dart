import 'package:flutter/material.dart';

import '../models/snacks_mod.dart';
import 'home.dart';
import 'items.dart';

class Snacks extends StatefulWidget {
  const Snacks({Key? key}) : super(key: key);

  @override
  State<Snacks> createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: snacksList.length,
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
                            snacksList[index].pic,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          snacksList[index].name,
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
                              snacksList[index].quantites++;
                              snacksList[index].price =
                                  snacksList[index].price *
                                      snacksList[index].quantites;
                            });
                          },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${snacksList[index].quantites}',
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
                              snacksList[index].quantites--;
                              snacksList[index].price =
                                  snacksList[index].price *
                                      snacksList[index].quantites;
                            });
                          },
                        )
                      ],
                    ),
                    Text(
                      "${(snacksList[index].price).toStringAsFixed(2)} JOD",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        listName.add(snacksList[index].name);
                        listPrice.add(snacksList[index].price);
                        pictures.add(snacksList[index].pic);
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
