import 'package:atividade_flutter/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget',),
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

  final double fontSize = 26;
  final String buttonName = "Enviar";
  TextEditingController textFieldController = TextEditingController();

  void _navigateToCounterScreen() {
    String sendText = textFieldController.text;
    if(sendText.isEmpty){
      sendText = "Anônimo";
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(userName: sendText))
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: textFieldController,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black,
                ),
              ),
            ),

            ElevatedButton(
                onPressed: _navigateToCounterScreen,
                child: Text(buttonName)
            ),

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
