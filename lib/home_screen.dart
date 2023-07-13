import 'package:flutter/material.dart';
import 'package:habibi/const.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://fakeimg.pl/250x100",
          ),
        ),
        title: const Text("Inbox"),
        actions: const [Icon(Icons.camera)],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: buildInputDecoration(Icons.search, "search"),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.add),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(data[index]["image"]!),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index]["image"]!),
                  ),
                  title: Text(data[index]["name"]!),
                  subtitle: Text(data[index]["chat"]!),
                  trailing: Text(data[index]["time"]!),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const Action(),
    );
  }
}

class Action extends StatelessWidget {
  const Action({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.chat),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}

// currentIndex: _currentIndex,
// onTap: (index) {
//   webpageDirector(index);
// },