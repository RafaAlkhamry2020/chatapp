import 'package:chatapp/google_auth_api.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class feedBack extends StatefulWidget {
  const feedBack({Key? key}) : super(key: key);

  @override
  _feedBackState createState() => _feedBackState();
}

final controllerSubject = TextEditingController();
final conrollerText = TextEditingController();

class _feedBackState extends State<feedBack>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    LeftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    bool _autoValidate = false;

    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Scaffold(
              body: ListView(children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Center(
                        child: Stack(children: <Widget>[
                      Container(
                        child: Text(
                          'Hello',
                          style: TextStyle(
                              color: Color(0xfff5435d),
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 120, 30, 10),
                          child: Transform(
                              transform: Matrix4.translationValues(
                                  LeftCurve.value * width, 0, 0),
                              child: Container(
                                  child: Column(children: <Widget>[
                                Form(
                                    key: _formkey,
                                    autovalidate: _autoValidate,
                                    child: Column(children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      buildTextField(
                                          title: "Subject",
                                          controller: controllerSubject),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      buildTextField(
                                          title: "Message",
                                          controller: conrollerText,
                                          maxLines: 8),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size.fromHeight(50),
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          onPressed: () {
                                            sendEmail();
                                          },
                                          child: Text(
                                            'SEND Email',
                                          )),
                                    ]))
                              ])))),
                    ]))))
          ]));
        });
    //     body: Center(
    //         child: ElevatedButton(
    //   child: Text('Send Email'),
    //   onPressed: () {
    //     sendEmail();
    //   },
    // ))
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
    message.subject = 'hello admin';
    message.text = 'i want help';

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

  Widget buildTextField(
          {required String title,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xfff5435d),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          )
        ],
      );
}
