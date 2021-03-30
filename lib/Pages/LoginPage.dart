import 'package:demo1/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/hello_login.png",
                fit: BoxFit.cover,
                height: 300,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username Here",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value.isEmpty){
                        return "Username Cannot be Empty.";
                      }
                      return null;
                    },
                    onChanged: (value){
                      name=value;
                      setState(() { });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password Here",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value.isEmpty){
                        return "Password Cannot be Empty.";
                      }
                      else if (value.length<6){
                        return "Password must have atleast 6 Characters.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),

                  Material(
                      borderRadius: BorderRadius.circular(changeButton?50: 8),
                      color: Colors.deepPurple,
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton?50: 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton?Icon(
                          Icons.done,
                          color: Colors.white,
                        ): Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
