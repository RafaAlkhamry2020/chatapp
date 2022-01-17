import 'package:chatapp/student/student_zone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'student_zone.dart';
import 'result_detail.dart' show DetailsPage;

class Result extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home:Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return StudentZone();
                  }
                  )
                  );
                },
                child: Icon(Icons.arrow_back, size: 30,),
              ),
              title: Text(
                'Student Result',
                style: TextStyle(fontSize: 20),
              ),
              centerTitle: true,
              elevation: 0,
             backgroundColor: Color(0xfff5435d),
            ),
          ),
          body: Scrollbar(child: _buildListView(context)),
        )
    );
  }

  ListView _buildListView(BuildContext context){
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (_, index){
        return Card(
          child: ListTile(
            title: Text('Semester $index'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(index))
                );
              },
            ),
          ),
        );

      },
    );
  }
}