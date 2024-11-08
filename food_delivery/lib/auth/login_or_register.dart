import 'package:flutter/material.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/screens/register_sceen.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginOrRegisterState();
  }
}

class _LoginOrRegisterState extends State<LoginOrRegister>{
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(onTap: togglePages,);
    } else {
      return RegisterScreen(onTap: togglePages,);
    }
  }
}
