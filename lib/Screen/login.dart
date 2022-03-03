import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDateMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                validator: (value) {
                  // if(_isDateMatched){
                  //   return null;
                  // }
                  // else{
                  //   return 'error';
                  // }
                  if(value == null || value.isEmpty){
                    return 'Please enter UserName';
                  }
                  else{
                    return null;
                  }
                  
                  
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
        
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
        
                validator: (value){
                  // if(_isDateMatched){
                  //   return null;
                  // }
                  // else{
                  //   return 'error';
                  // }
                  if(value == null || value.isEmpty){
                    return 'Please enter password';
                  }
                  else{
                    return null;
                  }
                },
        
        
        
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible:!_isDateMatched,
                    child: Text(
                      'username password does not match',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate())
                        {
                          CheckLogin(context);

                        }
                        else{
                          print('error');
                        }
                      
                      },
                      child: Text('Login')),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void CheckLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

     if (_username == _password) {

       final _sharedpref =  await SharedPreferences.getInstance();
        await _sharedpref.setBool(SAVE_KEY_USER, true);


        
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));

      //home
    } else {
      print('Username Password does not match');

      



    }
  }
}
