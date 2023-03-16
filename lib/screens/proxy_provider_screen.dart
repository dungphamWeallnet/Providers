import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_ex/screens/screens.dart';

class Proxy_Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //                              <--- MultiProvider
      providers: [
        ChangeNotifierProvider<Model_6>(
          //               <--- ChangeNotifierProvider
          create: (context) => Model_6(),
        ),
        ProxyProvider<Model_6, AnotherModel_6>(
          //          <--- ProxyProvider
          update: (context, myModel, anotherModel) => AnotherModel_6(myModel),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            title: Text('Proxy Provider'),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<Model_6>(
                        //          <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              myModel.doSomething('Goodbye');
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<Model_6>(
                      //            <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  child: Consumer<AnotherModel_6>(
                    //          <--- AnotherModel Consumer
                    builder: (context, anotherModel, child) {
                      return RaisedButton(
                        child: Text('Do something else'),
                        onPressed: () {
                          anotherModel.doSomethingElse();
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Model_6 with ChangeNotifier {
  //                       <--- MyModel
  String someValue = 'Hello';
  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel_6 {
  //                                      <--- AnotherModel
  Model_6 _myModel;
  AnotherModel_6(this._myModel);
  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}
