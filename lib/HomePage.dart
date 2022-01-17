
import 'package:chatapp/student/collage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatapp/image_slider.dart';
import 'package:chatapp/utils/ZoneImage.dart';
import 'package:chatapp/student/student_zone.dart';
import 'package:chatapp/teacher/teacher_zone.dart';
//import 'package:collage/admin/admin_zone.dart';


import 'Chat_App/screens_chats/chatbot_screen.dart';
import 'Chat_App/widgets/chatapp.dart';
import 'FeedBack/Home.dart';
import 'Screens/LoginForm.dart';
import 'about_us.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(


          leading: InkWell(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Chatpage();
                        }));
            },
            child: Icon(Icons.chat, size: 30,),
          ),
          backgroundColor: Color(0xfff5435d),
          centerTitle: true,
          title: Text(
            'HOME',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 15.0, bottom: 16.0),
            child: Column(children: <Widget>[
              SizedBox(height: 24,),
              SizedBox(height: 230.0,
                width:double.infinity,
                child:CarouselSlider(
                  items: [
                    ImageSlider(Image: "assets/images/image2.jpg",
                    ),
                    ImageSlider(Image: "assets/images/image3.png",
                    ),
                    ImageSlider(Image: "assets/images/image4.png",
                    ),

                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 100),
                    height: 300,

                  ),
                ),
              ),
            SizedBox(height: 20,),
            // SizedBox(width: 60,),
              InkWell(
                child:Row(
                  children: <Widget>[
                    InkWell(
                        child: ZoneImage(image: "assets/images/student.png",
                            text: "STUDENT"),
                        onTap:  () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return LoginForm();
                          }));
                        }
                    ),
                    SizedBox(width: 60,),
                    InkWell(
                        child: ZoneImage(image: "assets/images/teacher.png",
                            text:"TEACHER"),
                        onTap:  () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return TeacherZone();
                          }));
                        }
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(width: 250,),
              Row(
                children: <Widget>[
                  InkWell(
                      child: ZoneImage(image:"assets/images/feedback.png",
                          text:"FeedBack"),
                      onTap:  () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Home();
                        }));
                      }
                  ),
                  SizedBox(width: 70,),
                  InkWell(
                      child: ZoneImage(image: "assets/images/logo2.png",
                        text: "ABOUT",
                      ),
                      onTap:  () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return AboutUs();
                        }));
                      }
                  ),
                  
                ],
              ),

              SizedBox(height: 60,),
              // SizedBox(width: 250,),
              Row(
                children: <Widget>[
                  
                   SizedBox(width: 260,),
                  InkWell(
                      child:Image(image: AssetImage("assets/images/chat.png",),width: 50,alignment: Alignment.bottomRight,),
                      onTap:  () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Chat_screen();
                        }));
                      }
                  ),
                  
                ],
              ),
            //    SizedBox(height: 30,),
            //  InkWell(),
              
            //       SizedBox(width: 250,),
            //      InkWell(
            //         child:Image(image: AssetImage("assets/images/chat.png",),width: 50,),
                    
            //       onTap: (){},
                 
            //    )
                   
                  
            ]
            
            ),
          ),
        ],
      ),
    );
  }
}