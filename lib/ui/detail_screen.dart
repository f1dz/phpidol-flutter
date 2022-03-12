import 'package:flutter/material.dart';
import 'package:phpidol/data/model/my_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.item}) : super(key: key);

  final MyItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail View'),
      ),
      body: Center(
        child: Text("${item.title} ${item.id}"),
      ),
    );
  }
}
