import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tabs/karzinka/korzinka_page.dart';
import 'tabs/texnomart/texnomart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Builder(
      //   builder: (context) {
      //     if (context.read<HomeProvider>().index == 0) {
      //       return const KorzinkaPage();
      //     }
      //     return const TexnomartPage();
      //   },
      // ),
      body: IndexedStack(
        index: context.watch<HomeProvider>().index,
        children: const [
          KorzinkaPage(),
          TexnomartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<HomeProvider>().index,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (value) {
          context.read<HomeProvider>().onChangedTab(value);
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

class HomeProvider extends ChangeNotifier {
  var _index = 0;

  void onChangedTab(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}
