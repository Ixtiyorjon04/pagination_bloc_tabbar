import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/tabs/karzinka/korzinka_page.dart';
import 'home/tabs/texnomart/texnomart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final controller = TabController(length: 2, vsync: this);
  var index = 0;

  @override
  void initState() {
    controller.animation?.addListener(() {
      index = (controller.animation?.value ?? 0).round();
      setState(() {});
    });
    // controller.addListener(() {
    //   //index = controller.;
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          controller: controller,
          children: const [
            KorzinkaPage(),
            TexnomartPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (value) {
          // index = value;
          controller.index = value;
          // setState(() {});
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
