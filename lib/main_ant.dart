import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Montserrat',
        )
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class InputTextNumber extends StatelessWidget{
  final TextEditingController controller;
  InputTextNumber({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Manda ae'
      ),
      validator: (value){
        if(value.isEmpty){
          return 'Precisa preencher, irmão';
        } else if(!_MyHomePageState.isNumeric(value)){
          return 'Precisa ser número, irmão';
        }
        return null;
      },
    );
  }
  
}

class _MyHomePageState extends State<MyHomePage> {
  
  final _formKey = GlobalKey<FormState>();
  var _controllerValue1 = TextEditingController();
  var _controllerValue2 = TextEditingController();
  var _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputTextNumber(controller: _controllerValue1),
            InputTextNumber(controller: _controllerValue2,),
            RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  setState(() {
                    _result = calcuca(int.parse(_controllerValue1.text), int.parse(_controllerValue2.text));
                  });

                }
              },
              child: Text('Faz aí'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 0),
              child: Text('Resultado: $_result')
              )
          ],),
        ) 
    );
  }

  static bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  int calcuca(int value, int value2) {
    return value + value2;
  }
}
