import 'package:fit_coffee/models/hot_mod.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'items.dart';

class HotDrinks extends StatefulWidget {
  const HotDrinks({Key? key}) : super(key: key);

  @override
  State<HotDrinks> createState() => _HotDrinksState();
}

class _HotDrinksState extends State<HotDrinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: hotList.length,
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
                            hotList[index].pic,
                          ),
                        ),
                        Text(
                          hotList[index].name,
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

  int radioValue = 0;
  String res = "";
  RadioListTile<dynamic> buildRadioListTile(val, text) {
    return RadioListTile(
      value: val,
      groupValue: radioValue,
      onChanged: (value) {
        setState(() {
          radioValue = value;
        });
      },
      title: Text(text),
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
                    const Text("Select the Size :"),
                    Column(
                      children: [
                        RadioListTile(
                          value: 0,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value as int;
                              if (radioValue == 0) {
                                hotList[index].price = 0.5;
                              }
                            });
                          },
                          title: const Text("Small"),
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value as int;
                              if (radioValue == 1) {
                                hotList[index].price = 0.75;
                              }
                            });
                          },
                          title: const Text("Medium"),
                        ),
                        RadioListTile(
                          value: 2,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value as int;
                              if (radioValue == 2) {
                                hotList[index].price = 1;
                              }
                            });
                          },
                          title: const Text("Large"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          child: const Icon(Icons.add, size: 20),
                          mini: true,
                          onPressed: () {
                            setState(() {
                              hotList[index].quantites++;
                              hotList[index].price = hotList[index].price *
                                  hotList[index].quantites;
                            });
                          },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${hotList[index].quantites}',
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
                              hotList[index].quantites--;
                              hotList[index].price = hotList[index].price *
                                  hotList[index].quantites;
                            });
                          },
                        )
                      ],
                    ),
                    Text(
                      "${(hotList[index].price).toStringAsFixed(2)} JOD",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        listName.add(hotList[index].name);
                        listPrice.add(hotList[index].price);
                        pictures.add(hotList[index].pic);
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
