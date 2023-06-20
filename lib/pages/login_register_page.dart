import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:farmtrack/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  bool isLogin = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return   Text(isLogin ? 'login to your account' : 'Register your account',style: Theme.of(context).textTheme.headlineLarge,);
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextFormField(
      controller: controller,
     decoration: InputDecoration(
                 
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                
    );
  
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'humm? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Do not have an account? Register instead' : ' Have an account? Login instead'),
    );
  }

  @override

Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Form(
      
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              _title(),
            
              const SizedBox(height: 60),
           _entryField('Email', _controllerEmail),
              const SizedBox(height: 10),
                  _entryField('Password', _controllerPassword),
              const SizedBox(height: 60),
              Column(
                children: [
                 _submitButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _loginOrRegisterButton()],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//       body: Form(
//           child: Column(
//         children: [
//           _entryField('email', _controllerEmail),
//           _entryField('password', _controllerPassword),
//           _errorMessage(),
//           _submitButton(),
//           _loginOrRegisterButton()
//         ],
//       )),
//     )