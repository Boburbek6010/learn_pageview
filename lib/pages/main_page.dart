import 'package:flutter/material.dart';
import 'package:learn_pageview/pages/first_page.dart';
import 'package:learn_pageview/pages/second_page.dart';
import 'package:learn_pageview/pages/third_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  final PageController controller = PageController();

  final List<Widget> _pages = const <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  void nextPage(int index){
    currentIndex = index;
    controller.animateToPage(index, duration: const Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Chat App", style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
        centerTitle: true,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: nextPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        // fixedColor: Colors.transparent,
        elevation: 0,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.yellow,
        selectedFontSize: 20,
        unselectedIconTheme: const IconThemeData(
          size: 15
        ),
        selectedIconTheme: const IconThemeData(
          size: 55,
        ),
        onTap: nextPage,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.done_all)
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
              activeIcon: Icon(Icons.done_all)
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
              activeIcon: Icon(Icons.done_all)
          ),

        ],
      ),
    );
  }
}
