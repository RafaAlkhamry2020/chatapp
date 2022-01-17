import 'dart:io';

import 'package:chatapp/Chat_App/widgets/pecture/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String username, File image, bool isLogin, BuildContext ctx) submitFn;
  final bool _isLoading;
  AuthForm(this.submitFn, this._isLoading);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _fromKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _email = "";
  String _Password = "";
  String _username = "";
  File? _userImageFile ;


  void _pickedImage(File pikedImage){
    _userImageFile = pikedImage;
  }

  void _submit(){
    final isValid = _fromKey.currentState!.validate();
    FocusScope.of(context).unfocus();


    if(!_isLogin && _userImageFile == null){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image.'),
        backgroundColor: Theme.of(context).errorColor,

      ),

      );
      return;
    }

    if(isValid){
      _fromKey.currentState!.save();
//      print(_email);
  //    print(_username);
    //  print(_Password);
      widget.submitFn(
          _email.trim(),
          _Password.trim(),
          _username.trim(),
          _userImageFile!,
          _isLogin,
          context
      );
//      print('is weel');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_isLogin) UserImagePicker(_pickedImage),
                TextFormField(
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  key: ValueKey('email'),
                  validator: (val){
                    if(val!.isEmpty || !val.contains('@')){
                      return "Please Enter a Valid Email Adderss";
                    }
                    return null;
                  },
                  onSaved: (val) => _email = val!,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email Address"),
                ),
                if(!_isLogin)
                TextFormField(
                  autocorrect: true,
                  textCapitalization: TextCapitalization.words,
                  enableSuggestions: false,
                    key: ValueKey('username'),
                    validator: (val){
                      if(val!.isEmpty || val.length < 4){
                        return "Please Enter at least 4 Characters";
                      }
                      return null;
                    },
                    onSaved: (val) => _username = val!,
                    decoration: InputDecoration(labelText: "Username"),

                  ),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (val){
                    if(val!.isEmpty || val.length < 4){
                      return "Password must be at least 7 Characters";
                    }
                    return null;
                  },

                  onSaved: (val) => _Password = val!,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,

                ),
                SizedBox(height: 12,),
                if(widget._isLoading)
                  CircularProgressIndicator(),
                if(!widget._isLoading)
                RaisedButton(
                  onPressed: _submit,

                  child: Text(_isLogin ? 'Login': 'sing Up'),
                ),
                if(!widget._isLoading)
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: (){
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(_isLogin
                      ? 'Create new account'
                      : 'I already have an account'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

