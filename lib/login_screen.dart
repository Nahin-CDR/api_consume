import 'package:api_consume/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: emailController,
            cursorColor: Colors.green,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Enter mail',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: passwordController,
            cursorColor: Colors.green,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Enter Password',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50.0)),
            onPressed: ()=>SignIn(),
            icon: const Icon(Icons.lock_open,size: 32),
            label: const Text("Sign in"),
          )
        ],
      ),
    );


  }

  Future SignIn() async{
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: emailController.text.trim(),
       password: passwordController.text.trim(),);
       isValid();
   }on FirebaseAuthException catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e",style: TextStyle(fontSize: 12.00, color: Colors.white),),
       duration: const Duration(milliseconds: 1500),
       backgroundColor: Colors.red,
     ));
   }

  }
  void isValid(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

}
