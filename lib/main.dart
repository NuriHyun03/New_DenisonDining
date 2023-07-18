import 'package:flutter/material.dart';
import 'package:helloworld/carouselslidermain.dart';
import 'package:helloworld/homebutton.dart';
import 'package:helloworld/subtitlehome.dart';
import 'package:helloworld/bottomdenisonlogo.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:helloworld/drawerdescription.dart';

import 'databaseApi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); // waits for database connection

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DbtoDart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //The root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Denison Dining App',
      //App theme control by device system
      //if user's device is in dark mode, it will be dark mode
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'DENISON DINING'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /******************/
      //     AppBar
      /*****************/
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xffb71c1c),
            width: 2,
          ),
        ),
        elevation: 4,
        automaticallyImplyLeading: false,
        centerTitle: false,
        // The title text which will be shown on the action bar
        title: Text(
          title,
          //textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xffb71c1c),
            fontFamily: 'merri',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.grey[50],
        //AppBar icon theme color setting
        iconTheme: const IconThemeData(
          color: Color(0xffb71c1c),
        ),
      ),
      //right drawer menu
      endDrawer: Drawer(
        child: Container(
          alignment: Alignment.center,
          child: const Description(),
        ),
      ),
      /******************/
      //     BODY
      /*****************/
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CarouselSilderMain(),
              SubTitleHome(
                stitle: 'Today\'s Menu',
              ),
              HomeButton(
                buttontitle: 'Curtis Dining Hall',
                buttonsubtitle: 'Healthy, Seasonal Comfort',
                buttonimage: 'assets/images/Curtis.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/curtis-cafe/',
              ),
              HomeButton(
                buttontitle: 'Huffman Dining Hall',
                buttonsubtitle: 'Fresh, Sustainable, Variety',
                buttonimage: 'assets/images/Huffman.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/huffman-cafe/',
              ),
              HomeButton(
                buttontitle: 'Slayters Market',
                buttonsubtitle: 'Convenient, House made,\nBarista made Coffee',
                buttonimage: 'assets/images/slayter.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/slayter-market/',
              ),
              SubTitleHome(
                stitle: 'Specials',
              ),
              HomeButton(
                buttontitle: 'Silverstein',
                buttonsubtitle: 'Pizza, Sandwich,\nFresh ingredients',
                buttonimage: 'assets/images/silverstein.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/silverstein/',
              ),
              HomeButton(
                buttontitle: 'The Nest at the Roost',
                buttonsubtitle:
                    'Student-driven, Flatbreads, \nSandwich, Desserts',
                buttonimage: 'assets/images/nest.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/the-roost/',
              ),
              DenisonLogo()
            ],
          ),
        ),
      ),
    );
  }
}
