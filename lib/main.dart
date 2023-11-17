import 'package:flutter/material.dart';
import 'package:denison_dining_app/carouselslidermain.dart';
import 'package:denison_dining_app/homebutton.dart';
import 'package:denison_dining_app/subtitlehome.dart';
import 'package:denison_dining_app/bottomdenisonlogo.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:denison_dining_app/drawerdescription.dart';

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
    DateTime now = DateTime.now();

    // Define the opening and closing hours as input parameters
    DateTime openingTimeBreakfast =
        DateTime(now.year, now.month, now.day, 7, 0);
    DateTime closingTimeBreakfast =
        DateTime(now.year, now.month, now.day, 10, 30);
    DateTime openingTimeSlayter =
        DateTime(now.year, now.month, now.day, 11, 05);
    DateTime closingTimeSlayter =
        DateTime(now.year, now.month, now.day, 22, 00);
    DateTime openingTimeCurtis = DateTime(now.year, now.month, now.day, 11, 0);
    DateTime closingTimeCurtis = DateTime(now.year, now.month, now.day, 20, 00);
    DateTime openingTimeHuffman =
        DateTime(now.year, now.month, now.day, 11, 30);
    DateTime closingTimeHuffman =
        DateTime(now.year, now.month, now.day, 21, 00);
    DateTime openingTimeSilvy = DateTime(now.year, now.month, now.day, 10, 30);
    DateTime closingTimeSilvy = DateTime(now.year, now.month, now.day, 23, 00);
    DateTime openingTimeNest = DateTime(now.year, now.month, now.day, 21, 00);
    DateTime closingTimeNest = DateTime(now.year, now.month, now.day, 1, 00);

    Color getRestaurantStatus(DateTime openingTime, DateTime closingTime) {
      DateTime now = DateTime.now();
      if (now.isAfter(openingTime) && now.isBefore(closingTime)) {
        return Colors.green;
      } else {
        return Color.fromARGB(255, 199, 32, 48);
      }
    }

    Color curtisStatus = Colors.orange;
    Color huffmanStatus = Colors.orange;
    Color slayterStatus = Colors.orange;
    Color silvyStatus = Colors.orange;
    Color nestStatus = Colors.orange;

    if (now.isBefore(openingTimeCurtis)) {
      curtisStatus =
          getRestaurantStatus(openingTimeBreakfast, closingTimeBreakfast);
      huffmanStatus =
          getRestaurantStatus(openingTimeBreakfast, closingTimeBreakfast);
      slayterStatus =
          getRestaurantStatus(openingTimeBreakfast, closingTimeBreakfast);
    } else if (now.isAfter(openingTimeCurtis)) {
      curtisStatus = getRestaurantStatus(openingTimeCurtis, closingTimeCurtis);
      huffmanStatus =
          getRestaurantStatus(openingTimeHuffman, closingTimeHuffman);
      slayterStatus =
          getRestaurantStatus(openingTimeSlayter, closingTimeSlayter);
    }
    silvyStatus = getRestaurantStatus(openingTimeSilvy, closingTimeSilvy);
    nestStatus = getRestaurantStatus(openingTimeNest, closingTimeNest);

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
            children: [
              CarouselSilderMain(),
              SubTitleHome(
                stitle: 'Today\'s Menu',
              ),
              HomeButton(
                buttontitle: 'Curtis Dining Hall',
                restaurantStatus: curtisStatus,
                //buttonsubtitle: 'Healthy, Seasonal Comfort',
                buttonimage: 'assets/images/Curtis.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/curtis-cafe/',
              ),
              HomeButton(
                buttontitle: 'Huffman Dining Hall',
                restaurantStatus: huffmanStatus,
                //buttonsubtitle: 'Fresh, Sustainable, Variety',
                buttonimage: 'assets/images/Huffman.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/huffman-cafe/',
              ),
              HomeButton(
                buttontitle: 'Slayter Market',
                restaurantStatus: slayterStatus,
                //buttonsubtitle: 'Convenient, House Made,\nBarista Made Coffee',
                buttonimage: 'assets/images/slayter.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/slayter-market/',
              ),
              SubTitleHome(
                stitle: 'Specials',
              ),
              HomeButton(
                buttontitle: 'Silverstein',
                restaurantStatus: silvyStatus,
                //buttonsubtitle: 'Pizza, Sandwich,\nFresh ingredients',
                buttonimage: 'assets/images/silverstein.jpg',
                dininghall:
                    'https://denison.cafebonappetit.com/cafe/silverstein/',
              ),
              HomeButton(
                buttontitle: 'The Nest at the Roost',
                restaurantStatus: nestStatus,
                //buttonsubtitle: 'Student-driven, Flatbreads, \nSandwich, Desserts',
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
