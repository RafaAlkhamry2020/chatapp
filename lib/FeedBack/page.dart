import 'package:chatapp/FeedBack/google_auth_api.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:chatapp/FeedBack/text_fields.dart';
class page extends StatefulWidget {
  const page({ Key? key }) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<page> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
 
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xfff5435d),
        title: Text("FeedBack"),
      ),
      body: Form(
        key: _formKey,
        onChanged: (() {
          setState(() {
            _enableBtn = _formKey.currentState!.validate();
          });
        }),
         child: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[SizedBox(height: 50,),
              TextFields(
                  controller: subjectController,
                  name: "Subject",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  })),
            
            SizedBox(height: 10,),
              TextFields(
                  controller: messageController,
                  name: "Message",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      setState(() {
                        _enableBtn = true;
                      });
                      return 'Message is required';
                    }
                    return null;
                  }),
                  maxLines: null,
                  type: TextInputType.multiline),
                  SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            else if (states.contains(MaterialState.disabled))
                              return Colors.grey;
                            return Color(0xfff5435d); // Use the component's default.
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ))),
                        onPressed: (){
                                     sendEmail();
                                    }, child: Text('SEND Email',)
                   
                  )
                  ),
            ],
          ),
        )
      )
    );
  }

Future sendEmail() async {
    final user = await GoogleAuthApi.signIn();

    if (user == null) return;
    final email = user.email;
    final auth = await user.authentication;
    final token = auth.accessToken!;

    print('Authenticated: $email');

    final smtpServer = gmailSaslXoauth2(email, token);

    final message = Message();
    message.from = Address(email, 'AdminRafa');
    message.recipients = ['rafaalkhamry@gmail.com'];
    message.subject =subjectController.text;
    message.text = messageController.text ;

    try {
      await send(message, smtpServer);

      showSnackBar('Sent email Sucessfully!');
    } on MailerException catch (e) {
      print(e);
    }
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
        content: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.green);
    //     ScaffoldMessenger.of(context)
    // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


