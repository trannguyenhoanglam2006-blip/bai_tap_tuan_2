
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() {
    return _CalculatorScreenState();
  }
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final number1Controller = TextEditingController();
  final number2Controller = TextEditingController();

  String result = "";
  
void calculate(String operation)  //operation để có : "+", "-", "*", "/"
{
  double? a = double.tryParse(number1Controller.text); // TextEditingController.text là kiểu String, cần chuyển đổi sang double để tính toán
  double? b = double.tryParse(number2Controller.text);

  if (a == null || b == null) 
  {
    setState(() 
    {
      result = "Vui lòng nhập hai số hợp lệ";
    });
    return;
  }

  double answer = 0;

  if (operation == "+") 
  {
    answer = a + b;
  } 
  else if (operation == "-") 
  {
    answer = a - b;
  }
  else if (operation == "*") 
  {
    answer = a * b;
  } 
  else if (operation == "/") 
  {
    if (b == 0) {
      setState(() 
      {
        result = "Không thể chia cho 0";
      });
      return;
    }
    answer = a / b;
  }

  debugPrint("answer = $answer");
  debugPrint("Kiểu dữ liệu = ${answer.runtimeType}");

  setState(() 
  {
    result = answer.toString(); // toString() để chuyển đổi số thành chuỗi vì result là kiểu String
  });
}


  @override
  void dispose() {
    number1Controller.dispose();
    number2Controller.dispose();
    super.dispose();
  }

  
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Thực hành 03",style: TextStyle(fontSize: 18),),

                const SizedBox(height: 50),

                TextField(
                  controller: number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nhập số thứ nhất",
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        calculate("+");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text("+"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        calculate("-");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text("-"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        calculate("*");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text("*"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        calculate("/");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text("/"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nhập số thứ hai",
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Kết quả: $result"),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
