import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_ex/screens/screens.dart';

class Future_Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<Model_2>(
      //                      <--- FutureProvider
      initialData: Model_2(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            title: Text('Future Provider'),
            centerTitle: true,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<Model_2>(
                    //                    <--- Consumer
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
                child: Consumer<Model_2>(
                  //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Model_2> someAsyncFunctionToGetMyModel() async {
  //  <--- async function
  await Future.delayed(const Duration(seconds: 5));
  return Model_2(someValue: 'new data');
}

class Model_2 {
  //                                               <--- MyModel
  Model_2({required this.someValue});
  String someValue = 'Hello';
  Future<void> doSomething() async {
    await Future.delayed(const Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}
