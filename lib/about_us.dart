

import 'package:flutter/material.dart';

import 'maps/location_tracking.dart';
import 'maps/map_screen.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        
        body: Column(children: [
          SizedBox(height: 100.0),
          Container(
            child:Center(child: Text("Contact Us",
              style: TextStyle(
                color: Colors.black,
                
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: TextDecoration.underline,
                decorationColor:Color(0xfff5435d),
                 ),
                 ),) ,
          ),
          SizedBox(height: 15.0),
          ////////////////////////////////////////////////////////////////////////////////////
          Container(
            child:Center(child: Text("Contact Details",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                 ),
                 ),) ,
          ),
          

 SizedBox(height: 30.0),
          ////////////////////////////////////////////////////////////////////////////////////
          IconButton(
            icon: Icon(
              Icons.place,
            ),
            iconSize: 40,
            color: Colors.black,
            splashColor: Color(0xFFD81B60),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return LocationTracking();
                          }));},
          ),
          // Container(
          //   child:Center(child: Icon(Icons.place,size: 30),), 
          // ),
          // SizedBox(height: 50.0,
          // ),

          ////////////////////////////////////////////////////////////////////////////////////
          Container(
            child:Center(child: Text("ADDRESS:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                 ),
                 ),) ,
          ),
          SizedBox(height: 10.0),
         ////////////////////////////////////////////////////////////////////////////////////// 
         Container(
            child:Center(child: Text("Sanaa - Al-Oshash - behind Al-Kuraimi Towers",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                 ),
                 ),) ,
          ),
          SizedBox(height: 50.0),
          /////////////////////////////////////////////////////////////////
          Center(
           
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
             children:<Widget> [
              
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[  
                  Icon(  
                    Icons.phone,  
                    size: 25  
                  ),  
                  Text('Phone: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),), 
                   Text('(+967-1) 427570/1',style: TextStyle(fontSize: 16,color: Colors.grey),),  
                ]),  
          SizedBox(height: 15.0),  
          //////////////////////////////////////////////////////////////////////////////////////////////////////      
 Row(mainAxisAlignment: MainAxisAlignment.center,
   children: <Widget>[  
                  Icon(  
                    Icons.phone,  
                    size: 25  
                  ),  
                  Text('Mobile: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),), 
                   Text('(+967-1) 427570/1',style: TextStyle(fontSize: 16,color: Colors.grey),),  
                ]),
                SizedBox(height: 15.0),
                ///////////////////////////////////////////////////////////////////
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[  
                  Icon(  
                    Icons.mobile_friendly,  
                    size: 25  
                  ),  
                  Text('Fax: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),), 
                   Text('(+967-1) 427572',style: TextStyle(fontSize: 16,color: Colors.grey),),  
                ]),
                SizedBox(height: 15.0),
                //////////////////////////////////////////////////////////////////////////////////////
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[  
                  Icon(  
                    Icons.email,  
                    size: 25  
                  ),  
                  Text('Email: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),), 
                   Text('info@iutt.edu.ye',style: TextStyle(fontSize: 16,color: Colors.grey),),  
                ]),  
          
             ],
           ),)
          
          //////////////////////////////////////////////////////////////////
        ],)
                 
      ) ,
                 
    );
      
    
  }
}
