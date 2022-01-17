import 'package:flutter/material.dart';
import 'package:chatapp/Comm/comHelper.dart';
import 'package:chatapp/Comm/genLoginSignupHeader.dart';
import 'package:chatapp/Comm/genTextFormField.dart';
import 'package:chatapp/DatabaseHandler/DbHelper.dart';
import 'package:chatapp/Model/UserModel.dart';
import 'package:chatapp/Screens/LoginForm.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        alertDialog(context, 'Password Mismatch');
      } else {
        _formKey.currentState!.save();

        UserModel uModel = UserModel(uid, uname, email, passwd);
        await dbHelper.saveData(uModel).then((userData) {
          alertDialog(context, "Successfully Saved");

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginForm()));
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: Data Save Fail");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: Color(0xfff5435d),
          centerTitle: true,
          title: Text(
            'Login with Signup',
            style: TextStyle(fontSize: 20),
          ),      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Signup'),
                  getTextFormField(
                      controller: _conUserId,
                      icon: Icons.person,
                      hintName: 'User ID'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUserName,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'User Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp,
                    ),
                    decoration: BoxDecoration(
                       color: Color(0xfff5435d),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Does you have account? '),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text('Sign In',style: TextStyle(color: Color(0xfff5435d),fontWeight: FontWeight.bold),),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
