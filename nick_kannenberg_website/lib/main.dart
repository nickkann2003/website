import 'package:flutter/material.dart';
import 'package:nick_kannenberg_website/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            // Header sized box
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: Stack(
                children: [
                  // Cover image
                  Image(
                    image: AssetImage('images/TempBG.png'),
                    fit: BoxFit.fitHeight,
                    height: 300,
                  ),
                  // Text
                  Text("Nicholas Kannenberg")
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height - 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: SingleChildScrollView(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      Utils().gameDisplay("Game Image", "This is my game!"),
                      Utils().gameDisplay("Game Image", "This is my game!"),
                      Utils().gameDisplay("Game Image", "This is my game!"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
