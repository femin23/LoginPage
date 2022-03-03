import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({ Key? key }) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

  @override
  void initState() {
    
     checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Image.asset('assets/image/how-to-download-google-photos-as-jpeg-e1624287284479.webp'),
      ),
    
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  Future<void>gotoLogin() async{
   await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenLogin(),),);
  }


  Future<void>checkUserLoggedIn()async{
    final _sharedprefs =await SharedPreferences.getInstance();
    final _userLoggedIn=_sharedprefs.getBool(SAVE_KEY_USER);

    if(_userLoggedIn == null || _userLoggedIn == false){
      gotoLogin();
    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenHome(),),);
    }
    
  }


}