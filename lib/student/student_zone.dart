import 'package:chatapp/HomePage.dart';
import 'package:chatapp/utils/ZoneImage.dart';
import 'academic_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'exam/home.dart';
import 'student_profile.dart';
import 'fees.dart';
import 'result.dart';

class StudentZone extends StatefulWidget {
  @override
  _StudentZoneState createState() => _StudentZoneState();
}

class _StudentZoneState extends State<StudentZone> {
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
            'STUDENT ZONE',
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
            padding: const EdgeInsets.only(
                left: 30.0, top: 20, right: 15.0, bottom: 10.0),
            child: Column(children: <Widget>[
              SizedBox(height: 24),
              InkWell(
                child: Row(
                  children: <Widget>[
                    InkWell(
                        child: ZoneImage(
                            image: "assets/images/academic_calendar.png",
                            text: "Calendar"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Calendar();
                          }));
                        }),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                      child: ZoneImage(
                          image: "assets/images/student_attendance.png",
                          text: "Attendance"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/student_result.png",
                          text: "Result"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Result();
                        }));
                      }),
                  SizedBox(
                    width: 85,
                  ),
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/academic_fees.png",
                          text: "Fees"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return FeePage();
                        }));
                      }),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/student_profile.png",
                          text: "Profile"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return StudentProfile();
                        }));
                      }),
                  SizedBox(
                    width: 85,
                  ),
                  InkWell(
                      child: ZoneImage(
                          image: "assets/images/Exam.png", text: "Exam"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return homepage();
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
}

void _logoutButton() {
  print("");
}
