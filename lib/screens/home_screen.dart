import 'package:flutter/material.dart';
import 'package:untitled/pref/shared_pref_controller.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.home,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(onPressed: () async{
            await _confirmLogout();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(SharedPrefController().email),
      ),
    );
  }

  Future<void> _confirmLogout() async{
    bool? loggedOut= await showDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.login),
            content:Text('Are you sure?') ,
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context,true);
                  },
                  child: Text('yes'),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context,false);
                },
                child: Text('No'),
              ),

            ],
          );
        }
        );
    if(loggedOut?? false){
      await logout();
    }
  }
  Future<void> logout() async {
    bool cleared= await SharedPrefController().clear();
    if(cleared){
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
