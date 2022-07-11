import 'package:fit_coffee/screens/cold_drinks.dart';
import 'package:fit_coffee/screens/hot_drinks.dart';
import 'package:fit_coffee/screens/sandwiches.dart';
import 'package:fit_coffee/screens/snacks.dart';
import 'package:flutter/material.dart';

List<String> listName = [];
List<double> listPrice = [];
List<String> pictures = [];


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange[800],
              title: const Text("FIT Coffee"),
              centerTitle: true,
              bottom: TabBar(
                  indicatorWeight: 5,
                  indicatorColor: Colors.black,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  labelColor: Colors.white,
                  tabs: [
                    tabMethod("Hot Drinks", "assets/icons/1.png"),
                    tabMethod("Cold Drinks", "assets/icons/2.png"),
                    tabMethod("Sandwiches", "assets/icons/3.png"),
                    tabMethod("Snacks", "assets/icons/4.png"),
                  ]),
            ),
            body: const TabBarView(
              children: [
                HotDrinks(),
                ColdDrinks(),
                SandWiches(),
                Snacks(),
              ],
            )),
      ),
    );
  }

  Tab tabMethod(String s1, String s2) {
    return Tab(
      text: s1,
      icon: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(s2),
        )),
      ),
    );
  }
}
