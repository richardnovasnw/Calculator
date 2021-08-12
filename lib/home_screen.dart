import 'package:flutter/material.dart';
import 'package:useprovider/buttons.dart';
import 'package:useprovider/history.dart';
import 'package:useprovider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Calculator'),
            TextButton(
              child: const Text(
                'history',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('h');
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const History(),
                    ));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      context.watch<Counter>().userInput,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      context.watch<Counter>().answer,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Consumer<Counter>(
                builder: (_, data, __) => GridView.builder(
                    itemCount: data.buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      // Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttontapped: () {
                            context.read<Counter>().clear();
                          },
                          buttonText: context.read<Counter>().buttons[index],
                          color: Colors.white,
                          textColor: Colors.black,
                        );
                      }

                      // +/- button
                      else if (index == 1) {
                        return MyButton(
                          buttonText: context.read<Counter>().buttons[index],
                          color: Colors.white,
                          textColor: Colors.black,
                        );
                      }
                      // % Button
                      else if (index == 2) {
                        return MyButton(
                          buttontapped: () {
                            context.read<Counter>().userInput +=
                                context.read<Counter>().buttons[index];
                          },
                          buttonText: context.read<Counter>().buttons[index],
                          color: Colors.white,
                          textColor: Colors.black,
                        );
                      }
                      // Delete Button
                      else if (index == 3) {
                        return MyButton(
                          buttontapped: () {
                            context.read<Counter>().delete();
                          },
                          buttonText: context.read<Counter>().buttons[index],
                          color: Colors.white,
                          textColor: Colors.black,
                        );
                      }
                      // Equal_to Button
                      else if (index == 18) {
                        return MyButton(
                          buttontapped: () {
                            context.read<Counter>().equal();
                          },
                          buttonText: context.read<Counter>().buttons[index],
                          color: Colors.black,
                          textColor: Colors.white,
                        );
                      }

                      //  other buttons
                      else {
                        return MyButton(
                          buttontapped: () {
                            data.modify(index);
                          },
                          buttonText: context.read<Counter>().buttons[index],
                          color: context.read<Counter>().isOperator(
                                  context.read<Counter>().buttons[index])
                              ? Colors.black45
                              : Colors.white,
                          textColor: context.read<Counter>().isOperator(
                                  context.read<Counter>().buttons[index])
                              ? Colors.white
                              : Colors.black,
                        );
                      }
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
