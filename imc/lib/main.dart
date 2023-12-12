//Adriano Francisco Oliveira de Sousa Júnior  
//Matheus Henrique de Oliveira Rocha
//João Augusto da Silva de Morais  
//Caio Nikolas Amorim da Silva
//Flávio Leão

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMC Calculator',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white, // Cor do texto do título
          ),
        ),
        backgroundColor: Color(0xFF353A40),
      ),
      backgroundColor: Color(0xFF353A40),
      body: SingleChildScrollView(>
        child: Container(
          width: 360,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Altura
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(
                  labelText: 'ALTURA(m) (EX:1.70)',
                  labelStyle: TextStyle(
                    color: Color(0xFF9A9FD0),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white, // Cor do texto de entrada
                ),
              ),
              SizedBox(height: 16),
              // Peso
              TextFormField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: 'PESO(kg) (EX:80)',
                  labelStyle: TextStyle(
                    color: Color(0xFF9A9FD0),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white, // Cor do texto de entrada
                ),
              ),
              SizedBox(height: 32),
              // Botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para limpar os campos
                      heightController.clear();
                      weightController.clear();
                      setState(() {
                       result = ''; // Limpar o resultado
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE67B17),
                    ),
                    child: Text(
                      'Limpar',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para calcular o IMC
                      calculateBMI();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F255E),
                    ),
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Saída de dados (resultado do IMC)
              Text(
                result,
                style: TextStyle(
                  color: Colors.white, // Cor do texto do resultado do IMC
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ), 
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Função para calcular o IMC
  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double imc = 0.0;
    // String result = '';
   
    if ((height >= 1.0 && height <= 2.40) && (weight >= 35.0 && weight <= 160.0)) {
      imc = weight / (height * height);
      if (imc < 18.5) {
        result = 'Abaixo de Peso - ${imc.toStringAsFixed(2)}';
      } else if (imc <= 24.9) {
        result = 'Peso saudável - ${imc.toStringAsFixed(2)}kg/m²';
      } else if (imc <= 29.9) {
        result = 'Sobrepeso - ${imc.toStringAsFixed(2)}kg/m²';
      } else if (imc <= 34.9) {
        result = 'Obesidade Leve - ${imc.toStringAsFixed(2)}kg/m²';
      } else if (imc <= 39.9) {
        result = 'Obesidade Moderada - ${imc.toStringAsFixed(2)}kg/m²';
      } else {
        result = 'Obesidade Severa - ${imc.toStringAsFixed(2)}kg/m²';
      }
    } else {
      result = 'Por favor, insira valores válidos para altura e peso!!!';
    }
    setState(() {
      this.result = result;
    });
    }
  }
