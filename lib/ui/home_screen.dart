import 'package:flutter/material.dart';
import 'package:phpidol/data/model/my_item.dart';
import 'package:phpidol/ui/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int lastId = 1;
  final List<MyItem> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('PHP IDOL'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  list.clear();
                });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                setState(() {
                  list.removeAt(index);
                });
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: const FlutterLogo(),
                    radius: 24,
                  ),
                  title: Text("${item.title} ${item.id}"),
                  subtitle: const Text('This is subtitle'),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => DetailScreen(item: item)));
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ),
              )),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add(MyItem(id: lastId, title: "PHP IDOL"));
            lastId++;
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
