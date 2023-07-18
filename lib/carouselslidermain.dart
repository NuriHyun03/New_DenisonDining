import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'storageApi.dart';
import 'databaseApi.dart';

class CarouselSilderMain extends StatefulWidget {
  const CarouselSilderMain({
    super.key,
  });

  @override
  State<CarouselSilderMain> createState() => _CarouselSilderMainState();
}

class _CarouselSilderMainState extends State<CarouselSilderMain> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DbtoDart>(builder: (context0, dbtoDart, child) {
      return FutureBuilder<QuerySnapshot>(
          future: dbtoDart.read_image_names('Image_List'),
          // Load the list of image-names from Image_List collection in database
          builder: (context1, snapshot1) {
            final documents = snapshot1.data?.docs ??
                []; // returns List<QueryDocumentSnapshot<Object?>>
            int image_length;
            if (documents.length != 0) {
              image_length = documents.length;
            } else {
              image_length = 0;
            }

            return FutureBuilder<List<String>>(
                future: FireStoreDataBase().getData(documents, image_length),
                // Produce download urls with image_names from database
                // and move them to snapshot variable
                builder: (context2, snapshot2) {
                  if (snapshot2.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot2.connectionState == ConnectionState.done) {
                    // takes a list of urls which load images from database
                    var value = snapshot2.data ??
                        []; // a list of image download urls taken from databaseApi.dart

                    return SliderWithImages(
                        value); // produce Carouselslider with given image download urls
                  } else {
                    return SliderWithNoImage();
                  }
                });
          });
    });
  }

  Container SliderWithImages(List<String> value) {
    // Generate value.length number of images downloaded from each item (download url)
    // from the String list value and display them on carousel slider.

    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: CarouselSlider(
        items: List.generate(value.length, (i) => i).map((i) {
          // need to change this dynamically
          return Builder(
            builder: (BuildContext context3) {
              return Container(
                  width: MediaQuery.of(context3).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  child: Image.network(value[i].toString())); // get ith image
            },
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 0.9,
          height: 200,
          autoPlay: true,
        ),
      ),
    );
  }
}

class SliderWithNoImage extends StatelessWidget {
  // Does not display any image on top of the first page.

  const SliderWithNoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: CarouselSlider(
        items: List.generate(0, (i) => i).map((i) {
          // need to change this dynamically
          return Builder(
            builder: (BuildContext context4) {
              return Container(
                  width: MediaQuery.of(context4).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: const Text(
                    'No image',
                    style: TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 0.9,
          height: 200,
          autoPlay: true,
        ),
      ),
    );
  }
}
