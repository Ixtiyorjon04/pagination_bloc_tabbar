import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/tabs/karzinka/korzinka_page.dart';
import 'home/tabs/texnomart/texnomart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [
          KorzinkaPage(),
          TexnomartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: "Korzinka",
            icon: Icon(CupertinoIcons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "Texnomart",
            icon: Icon(Icons.phone_android_outlined),
          ),
        ],
      ),
    );
  }
}
