import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  const SecondScreen({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(userName: userName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.userName}) : super(key: key);

  final String userName;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Valor atual',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _navigateToStartScreen,
            tooltip: 'Retornar',
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Incrementar',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Subtrair',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _multiplyCounter,
            tooltip: 'Multiplicar',
            child: const Text('X',
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
          ),FloatingActionButton(
            onPressed: _divideCounter,
            tooltip: 'Dividir',
            child: const Text('/',
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }

  void _navigateToStartScreen() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _multiplyCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  void _divideCounter() {
    setState(() {
      _counter /= 2;
    });
  }
}