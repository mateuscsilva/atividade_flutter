import 'package:atividade_flutter/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  final String title = 'Atividade Flutter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title,),
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

  final double fontSize = 20;
  final String buttonName = "Enviar";
  TextEditingController textFieldController = TextEditingController();

  void _navigateToCounterScreen() {
    String sendText = textFieldController.text;
    if(sendText.isEmpty){
      sendText = "Anônimo";
    }
    Navigator.of(context, rootNavigator: true).push(
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
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "Digite o seu nome"
                ),
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
    );
  }
}
