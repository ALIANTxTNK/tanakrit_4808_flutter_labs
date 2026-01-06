import 'package:flutter/material.dart';

/// Quote Card Application
/// Display a favorite quote with author information
/// Create by Tanakrit Waree
/// Date 17/12/2025
/// No AI tools used
/// Explantion
/// I'm create Boxdecoration and change picture to quote card picture
void main() {
  runApp(const QuoteContainerCard());
}

class QuoteContainerCard extends StatelessWidget {
  const QuoteContainerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 0, 6, 177)),
      ),
      home: const MyHomePage(title: 'My Favourite Quote'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                'assets/images/cumkom.jpg',
                width: 500,
                height: 500,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(color: Colors.deepPurple, width:2.0),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(blurRadius: 7, offset: const Offset(0, 3))]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tanakrit',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),

                  SizedBox(width: 20),

                  Text(
                    'Waree',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
