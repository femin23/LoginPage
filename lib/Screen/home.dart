import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (Ctx, index) {

           return ListTile(
              title: Text('PERSON $index'),
              subtitle: Text('MESSAGE $index'),
              leading: CircleAvatar(
                radius: 30,
                
              backgroundImage: AssetImage('assets/image/hilipp-kammerer-6Mxb_mZ_Q8E-unsplash.jpeg'),
              ),
              trailing: Text('1$index:00 pm'),
            );






            
          },
          
          separatorBuilder: (Ctx,indix)
          {
            return Divider();
          },
          
          itemCount: 20,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
  }
}

class Ctx {}
