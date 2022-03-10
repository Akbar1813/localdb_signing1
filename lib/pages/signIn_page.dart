import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdb_signing1/models/user_model.dart';
import 'package:localdb_signing1/pages/signUp_page.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static final String id = 'signIn_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> _doLogin() async{
    String username = userNameController.text.trim();
    String password = passwordController.text.trim();
    var user = User(username: username,password: password);
    var boxUser = Hive.box('Packages');
    boxUser.put('username', user.username);
    boxUser.put('password', user.password);

    String id = boxUser.get('username');
    String pw = boxUser.get('password');

    print("Username: $id");
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
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.jpg'),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text('Welcome Back!',style: TextStyle(
                    fontSize: 30,
                    color:Colors.white
                ),),
                SizedBox(height: 10,),
                Text('Sign in to continue',style: TextStyle(
                    fontSize: 18,
                    color:Colors.white
                ),),
                SizedBox(height: 50,),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(CupertinoIcons.person,color: Colors.grey,),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.key ,color: Colors.grey,),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Forgot Password?",style: TextStyle(color: Colors.grey),),
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
                SizedBox(height: 120,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, SignUpPage.id);
                      },
                      child: Text('SIGN UP'),
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
