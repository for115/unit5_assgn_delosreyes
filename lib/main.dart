import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();

  // or store each value in the state
  int firstAddNum = 0;
  
  TextEditingController add2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.parse(value);
                    });
                  },
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),

              Text(' = $sum'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    // Get the second number from the second TextField
                    int secondAddNum = int.tryParse((TextEditingController()..text = (TextField(key: null).controller?.text ?? "")).text) ?? 0;
                    sum = firstAddNum + secondAddNum; // Calculate the sum
                  });
                },
              ),


            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Clear the text fields and reset the sum
                  add1Controller.clear();
                  add2Controller.clear();
                  sum = 0; // Reset the sum value
                });
              },
              child: const Text('Clear'),
            ),
               ],
          ),


           // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: add2Controller, // Use add2Controller here
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = ${firstAddNum - (int.tryParse(add2Controller.text) ?? 0)}'),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    int secondMinusNum = int.tryParse(add2Controller.text) ?? 0; // Get the second number
                    sum = firstAddNum - secondMinusNum; // Calculate the difference
                  });
                },
              ),
            ],
          ),



        // Multiplication Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: add1Controller,
                decoration: InputDecoration(labelText: "First Number"),
              ),
            ),
            const Text(" × "),
            Expanded(
              child: TextField(
                controller: add2Controller, // Use add2Controller here
                decoration: InputDecoration(labelText: "Second Number"),
              ),
            ),
            Text(' = ${firstAddNum * (int.tryParse(add2Controller.text) ?? 0)}'),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  int secondMultiNum = int.tryParse(add2Controller.text) ?? 0; // Get the second number
                  sum = firstAddNum * secondMultiNum; // Calculate the product
                });
              },
            ),
          ],
        ),



          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" ÷ "),
              Expanded(
                child: TextField(
                  controller: add2Controller, // Use add2Controller here
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = ${(add2Controller.text.isNotEmpty && int.tryParse(add2Controller.text) != 0) ? (firstAddNum / (int.tryParse(add2Controller.text) ?? 1)).toStringAsFixed(2) : 'Undefined'}'),
              IconButton(
                icon: const Icon(Icons.horizontal_rule),
                onPressed: () {
                  setState(() {
                    int secondDivideNum = int.tryParse(add2Controller.text) ?? 0; // Get the second number
                    if (secondDivideNum != 0) {
                      sum = (firstAddNum ~/ secondDivideNum); // Calculate the quotient
                    } else {
                      sum = 0; // Handle division by zero
                          }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
