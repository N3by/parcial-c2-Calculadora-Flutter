import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  TextEditingController val1Controller = TextEditingController();
  TextEditingController val2Controller = TextEditingController();
  TextEditingController resultadoController = TextEditingController();
  double resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CalculadoraParcialC2-Alvarez')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: val1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor 1'),
            ),
            TextField(
              controller: val2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Valor 2"),
            ),
            TextField(
              controller: resultadoController,
              enabled: false,
              decoration: InputDecoration(labelText: 'Resultado'),
            ),
            ElevatedButton(
              child: Text('Sumar'),
              onPressed: (){
                double valor1 = double.tryParse(val1Controller.text)?? 0.0;
                double valor2 = double.tryParse(val2Controller.text)?? 0.0;
                setState(() {
                  resultado = valor1 + valor2;
                  resultadoController.text = resultado.toString();
                });
              },
            ),
            ElevatedButton(
              child: Text('Restar'),
              onPressed: (){
                double valor1 = double.tryParse(val1Controller.text)?? 0.0;
                double valor2 = double.tryParse(val2Controller.text)?? 0.0;
                setState(() {
                  resultado = valor1 - valor2;
                  resultadoController.text = resultado.toString();
                });
              },
            ),
           
            ElevatedButton(
              child: Text('Limpiar'),
              onPressed: (){
                setState(() {
                  val1Controller.text = '';
                  val2Controller.text = '';
                  resultadoController.text = '';
                  resultado = 0.0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}