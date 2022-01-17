import 'package:chatapp/Homepage.dart';
import 'package:chatapp/teacher/schedule/schedule.dart';
import 'teacher_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chatapp/utils/ZoneImage.dart';
import 'salary.dart';

class TeacherZone extends StatefulWidget {
  @override
  _TeacherZoneState createState() => _TeacherZoneState();
}

class _TeacherZoneState extends State<TeacherZone> {
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
            'TEACHER ZONE',
            style: TextStyle(fontSize: 20),
          ),
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
                const EdgeInsets.only(left: 25.0, top: 20,right: 15.0, bottom: 16.0),
            child: Column(children: <Widget>[
              SizedBox(height: 24),
              InkWell(
                child: Row(
                  children: <Widget>[
                    InkWell(
                        child: ZoneImage(
                            image: "assets/images/schedule.png", text: "Schedule"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return main();
                          }));
                        }),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        child: ZoneImage(
                            image: "assets/images/student_attendance.png",
                            text: "Attendance"),
                        onTap: () {})
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      child:
                          ZoneImage(image: "assets/images/salary.png", text: "Salary"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return salary();
                        }));
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/logo2.png", text: "Profile"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return TeacherProfile();
                        }));
                      }),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _logoutButton() {
    print("");
  }
}
