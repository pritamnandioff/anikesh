import 'package:flutter/material.dart';
import 'package:habibi/discovery.dart';
import 'package:habibi/home_screen.dart';
import 'package:habibi/person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [Inbox(), Person(), Discovery()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          print(index);
          setState(() {
            this.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3),
            label: 'Backward',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cabin),
            label: 'Forward',
          ),
        ],
      ),
    );
  }
}
