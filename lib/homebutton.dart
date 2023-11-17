import 'package:flutter/material.dart';
import 'package:denison_dining_app/webviewmodel.dart';

/// Makes Button with image and title
class HomeButton extends StatelessWidget {
  /// Title of the Button
  final String buttontitle;

  /// Image of the Button, should be correct path
  final String buttonimage;

  /// Subtitle of the Button
  //final String buttonsubtitle;

  /// Open and closed status
  final Color restaurantStatus;

  /// Link to corresponding website that will be connected to webView widget.
  /// Should be correct full - weblink
  final String dininghall;

  const HomeButton({
    super.key,
    required this.buttonimage,
    required this.buttontitle,
    //required this.buttonsubtitle,
    required this.restaurantStatus,
    required this.dininghall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      color: Colors.transparent,
      //-----------------------
      //Outline of Button
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.white70,
        highlightColor: Colors.transparent,
        //When it is pressed
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuWebView(
                dininglink: dininghall,
                appbartitle: buttontitle,
              ),
            ),
          );
        },
        child: Material(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            //---------------------------
            //Inner square image
            child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          buttonimage,
                          width: 70,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //------------------------
                    //Button Title
                    Expanded(
                      child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 0, 4, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  buttontitle,
                                  style: const TextStyle(
                                    fontFamily: "Lora",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              //----------------------
                              //Open and closed status
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: Center(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: 180,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: restaurantStatus,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //------------------------
                              //Button subtitle
                              /*Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 8, 0),
                                child: Center(
                                  child: Text(
                                    buttonsubtitle,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Lora',
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),*/
                            ],
                          )),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
