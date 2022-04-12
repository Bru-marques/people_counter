import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          isFull ? "Lotado" : "Pode entrar!",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          "$count",
          style: const TextStyle(
            fontSize: 100,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: isEmpty
                      ? Colors.purple.withOpacity(.5)
                      : Colors.purple[300],
                  fixedSize: const Size(60, 40),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: isEmpty ? null : decrement,
              child: Text("Saiu",
                  style: TextStyle(
                    color:
                        isEmpty ? Colors.white.withOpacity(.5) : Colors.white,
                  )),
            ),
            const SizedBox(width: 50),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: isFull
                      ? Colors.purple.withOpacity(.5)
                      : Colors.purple[300],
                  fixedSize: const Size(60, 40),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: isFull ? null : increment,
              child: Text("Entrou",
                  style: TextStyle(
                    color: isFull ? Colors.white.withOpacity(.5) : Colors.white,
                  )),
            ),
          ],
        ),
      ]),
    );
  }
}
