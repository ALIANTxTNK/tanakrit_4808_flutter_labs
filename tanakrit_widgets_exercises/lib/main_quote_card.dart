import 'package:flutter/material.dart';
/// Quote Card Application
/// Display a favorite quote with author information
/// Create by Tanakrit Waree
/// Date 17/12/2025 
void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 0, 6, 177)),
      ),
      home: const MyHomePage(title: 'My Favourite Qoute'),
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
            Expanded( 
              child: AspectRatio(aspectRatio: 1/1,
                child : Image.asset('assets/images/lebelblue.png',
                width: 500,
                height: 500,)
                ,)

            ),
            const Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Tanakrit', 
                style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.orange)),

               SizedBox(width: 20,),

              Text('Waree', 
                style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.blue)) 

                    
            ],))
          ],
        ),
      ),
      
    );
  }
}
