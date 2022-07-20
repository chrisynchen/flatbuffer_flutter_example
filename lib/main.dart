import 'dart:convert';

import 'package:flatbuffer_example/data/person.dart';
import 'package:flatbuffer_example/person_com.chris.flatbuffer_example.data_generated.dart'
    as flat_person;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlatBuffer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FlatBuffer Demo'),
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
  String jsonResult = '';
  String fbResult = '';

  void _calculate() async {
    final binResponse = await rootBundle.load('assets/person.bin');
    final stringResponse =
        await rootBundle.loadString('assets/personinjson.json');

    /// Json Parse Start
    int jsonTime = DateTime.now().microsecondsSinceEpoch;
    final data = await json.decode(stringResponse);
    final jsonPerson = Person.fromJson(data);
    jsonResult =
        'Json: ${jsonPerson.speed} Parse Time: ${DateTime.now().microsecondsSinceEpoch - jsonTime}';

    /// Json Parse End

    /// Fb Parse Start
    int fbTime = DateTime.now().microsecondsSinceEpoch;
    final fbPerson = flat_person.Person(binResponse.buffer.asUint8List());
    fbResult =
        'Fb: ${fbPerson.speed} Parse Time: ${DateTime.now().microsecondsSinceEpoch - fbTime}';
    /// Fb Parse End

    setState(() {
      jsonResult;
      fbResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Json: $jsonResult',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'FlatBuffer: $fbResult',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculate,
        tooltip: 'Count',
        child: const Icon(Icons.calculate),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
