import 'package:flutter/material.dart';
import 'package:useprovider/provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Counter>(
            builder: (_, data, __) => ListView.builder(
                  itemCount: data.item.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${data.item[index]}'),
                    );
                  },
                )));
  }
}
