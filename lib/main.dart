import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ideas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Butterfly(),
    );
  }
}

class Butterfly extends StatefulWidget {
  const Butterfly({Key? key}) : super(key: key);

  @override
  State<Butterfly> createState() => _ButterflyState();
}

class _ButterflyState extends State<Butterfly> {
  final _myController = TextEditingController();

  final Set ideas = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.brown,
            title: const Text(
              'Ideas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow[200],
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _myController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Write your idea';
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    backgroundColor: Colors.brown,
                  ),
                  onPressed: () {
                    setState(() {
                      ideas.add(_myController.text);
                      _myController.clear();
                    });
                  },
                  child: const Text(
                    'Add idea',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                for (var i in ideas) Text('$i'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
