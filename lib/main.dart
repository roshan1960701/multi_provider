import 'package:flutter/material.dart';
import 'package:multi_provider/Provider/listData.dart';
import 'package:multi_provider/gridData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<listData>(
          create: (context) => listData(),
        ),
        ProxyProvider<listData, Dgreet>(
            update: (context, myGreet, anotherModel) => Dgreet(myGreet)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => gridData()));
              },
              child: Text('GridView'),
              color: Colors.purple,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<listData>(builder: (context, listData, child) {
              return RaisedButton(
                onPressed: () {
                  listData.doGreet('Good Afternoon');
                },
                child: Text('Greetings'),
              );
            }),
            SizedBox(
              height: 10,
            ),
            Consumer<listData>(builder: (context, listData, child) {
              return Text(
                listData.greetings,
                style: TextStyle(fontSize: 25),
              );
            }),
            SizedBox(
              height: 10,
            ),
            Consumer<Dgreet>(builder: (context, dGreet, child) {
              return RaisedButton(
                onPressed: () {
                  dGreet.doAnotherGreet();
                },
                child: Text('Another Greet'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
