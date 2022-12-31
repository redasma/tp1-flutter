import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // une application utilisant Material Design
        title: 'My First Flutter App',
        theme: ThemeData(), // données relatives au thème choisi
        home: const ProfileHomePage(title: 'Profile Home page'), // le widget de la page d'accueil
    );
  }
}

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key, required this.title});


  final String title;

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children:<Widget>[
            Container(
              width:200,
              height: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ],
                  ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20)
                )

                  ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Redouane Asma',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    Text('redouaneasma1@gmail.com',
                      style: const TextStyle(
                        color: Colors.white,
                      ),),
                    Text('twitter profile',
                      style: const TextStyle(
                        color: Colors.white,
                      ),),
                  ],
                )
                ),

            Positioned(
              top:-50,
              child:Container(
                alignment: Alignment.topCenter,
              width: 80,
              height: 80,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.pink,width: 2.0, style: BorderStyle.solid),
                image: DecorationImage(
                    image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill
                ),
              ),
            ),)

          ]
        )

      )
    );
  }
}
