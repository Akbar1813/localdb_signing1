import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdb_signing1/models/account_model.dart';
import 'package:localdb_signing1/pages/signIn_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static final String id = 'signUp_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> _doLogin() async{
    String username = userNameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    var account = Account(username: username,email:email, phone: phone,password: password);
    var boxAccount = Hive.box('Packages');
    boxAccount.put('username', account.username);
    boxAccount.put('email', account.email);
    boxAccount.put('phone', account.phone);
    boxAccount.put('password', account.password);

    String id = boxAccount.get('username');
    String pw = boxAccount.get('password');
    String em = boxAccount.get('email');
    String ph = boxAccount.get('phone');
    print("Username: $id");
    print("E-mail: $em");
    print("Phone number: $ph");
    print("Password: $pw");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color.fromARGB(255, 26, 29, 55),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(right: 20,left: 20,top: 150,bottom: 20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text("Create",style: TextStyle(
                      fontSize: 30,
                      color:Colors.white
                  ),),
                  Text("Account",style: TextStyle(
                      fontSize: 30,
                      color:Colors.white
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(height: 50,),

                  // user name
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(CupertinoIcons.person,color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 10,),

                  // e-mail
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(CupertinoIcons.mail,color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 10,),

                  // phone number
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(CupertinoIcons.phone,color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 10,),

                  // password
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.key ,color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(35),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [
                              Colors.blue.shade800,
                              Colors.blue.shade700,
                              Colors.blue.shade200
                            ]
                        )
                    ),
                    child: IconButton(
                      onPressed: _doLogin,
                      icon: Icon(CupertinoIcons.arrow_right,size: 30,),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 90,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(color: Colors.grey),),
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, SignInPage.id);
                        },
                        child: Text('SIGN IN'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
