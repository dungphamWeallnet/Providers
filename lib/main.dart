import 'package:application_ex/screens/future_provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:application_ex/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  textColor: Colors.white,
                  color: Colors.deepPurple,
                  onPressed: () {
                    debugDumpApp();
                  },
                  child: const Text('Dump App')),
              SizedBox(
                height: 30,
              ),
              const Text(
                'You have seen the different providers',
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProviderPage()));
                      },
                      child: Text('Provider')),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNProvider()));
                      },
                      child: Text('ChangeNotifierProvider')),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Future_Provider()));
                      },
                      child: Text('FutureProvider')),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Stream_Provider()));
                      },
                      child: Text('StreamProvider')),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Value_Listenable()));
                      },
                      child: Text('ValueListenableProvider')),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Multi_Provider()));
                      },
                      child: Text('MultiProvider')),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Proxy_Provider()));
                      },
                      child: Text('ProxyProvider')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
