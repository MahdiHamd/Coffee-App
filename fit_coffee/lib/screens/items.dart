import 'package:fit_coffee/screens/hot_drinks.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listName.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 40,
                        backgroundImage: AssetImage(
                          pictures[index],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        listName[index],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  'price :${listPrice[index]} JOD',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            listName.removeAt(index);
                            listPrice.removeAt(index);
                            pictures.removeAt(index);
                          });
                        },
                        child: const Icon(Icons.remove)),
                    ElevatedButton(
                        onPressed: () {
                          listName.removeAt(index);
                          listPrice.removeAt(index);
                          pictures.removeAt(index);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (_) {
                            return const HotDrinks();
                          }));
                        },
                        child: const Icon(Icons.update)),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const MyHomePage();
          }));
        },
        label: const Text("Add Item"),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
