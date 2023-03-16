import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_ex/screens/screens.dart';

class Value_Listenable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<_Model_4>(
      //                              <--- Provider
      create: (context) => _Model_4(),
      child:
          Consumer<_Model_4>(//                           <--- MyModel Consumer
              builder: (context, myModel, child) {
        return ValueListenableProvider<String>.value(
          // <--- ValueListenableProvider
          value: myModel.someValue,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
                title: Text('Value Listenable Provider'),
                centerTitle: true,
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<_Model_4>(
                        //       <--- Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              myModel.doSomething();
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<String>(
                      //           <--- String Consumer
                      builder: (context, myValue, child) {
                        return Text(myValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _Model_4 {
  //                                             <--- MyModel
  ValueNotifier<String> someValue =
      ValueNotifier('Hello'); // <--- ValueNotifier
  void doSomething() {
    someValue.value = 'Goodbye';
    print(someValue.value);
  }
}
