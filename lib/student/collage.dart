import 'package:chatapp/HomePage.dart';
import 'package:chatapp/student/student_zone.dart';
import 'package:chatapp/utils/ZoneImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CollageZone extends StatefulWidget {
  @override
  _CollageZoneState createState() => _CollageZoneState();
}

class _CollageZoneState extends State<CollageZone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomePage();
              }));
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          backgroundColor: Color(0xfff5435d),
          centerTitle: true,
          title: Text(
            'Collage ZONE',
            style: TextStyle(fontSize: 20),
          ),
          
          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.logout,
          //       color: Colors.white,
          //     ),
          //   )
          // ],
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.logout),
              highlightColor: Colors.white,
              onPressed: () {
                _logoutButton();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0,top: 20, right: 15.0, bottom: 10.0),
            child: Column(children: <Widget>[
              SizedBox(height: 24),
              InkWell(
                child: Row(
                  children: <Widget>[
                    InkWell(
                        child: ZoneImage(
                            image: "assets/images/CS.png",
                            text: "CS"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return StudentZone();
                          }
                          )
                          );
                        }
                        ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        child: ZoneImage(
                            image: "assets/images/IT.png",
                            text: "BIT"),
                        onTap: () {Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return StudentZone();
                          }
                          )
                          );})
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/OGE.png",
                          text: "OGE"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return StudentZone();
                        }));
                      }),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/OGM.png",
                          text: "OGM"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return StudentZone();
                        }));
                      }),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/CE.jpg",
                          text: "CE"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return StudentZone();
                        }));
                      }),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/multimedia.png", text: "Multimedia"),
                      onTap: () {Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return StudentZone();
                          }
                          )
                          );}),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/business.png",
                          text: "Business"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return StudentZone();
                        }));
                      }),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/Interior_Design.png", text: "ID"),
                      onTap: () { Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return StudentZone();
                          }
                          )
                          );}),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

void _logoutButton() {
  print("");
}
