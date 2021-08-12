import 'package:flutter/material.dart';
import 'package:useprovider/provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('History'),
        ),
        body: Consumer<Counter>(
            builder: (_, data, __) => ListView.builder(
                  itemCount: data.item.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        title: Text('${data.item[index]}'),
                      ),
                    );
                  },
                )));
  }
}
