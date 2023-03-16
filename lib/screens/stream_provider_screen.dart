import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_ex/screens/screens.dart';

class Stream_Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Model_3>(
      //                       <--- StreamProvider
      initialData: Model_3(someValue: 'default value'),
      create: (context) => getStreamOfMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            title: Text('Stream Provider'),
            centerTitle: true,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<Model_3>(
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
                child: Consumer<Model_3>(
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

Stream<Model_3> getStreamOfMyModel() {
  //                        <--- Stream
  return Stream<Model_3>.periodic(
      Duration(seconds: 1), (x) => Model_3(someValue: '$x')).take(10);
}

class Model_3 {
  //                                               <--- MyModel
  Model_3({required this.someValue});
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}
