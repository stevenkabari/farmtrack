  import 'package:farmtrack/pages/login_register_page.dart';
import 'package:flutter/material.dart';

  class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(220, 103, 247, 67),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //this centers the elements within the column
          children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/welcome.png',
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 0,
              ),
              child: const Text('Welcome to Easy Farm management',textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(225, 242, 243, 245),
                      fontSize: 35,
                      
                      fontWeight: FontWeight.bold)),
            ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color.fromARGB(228, 143, 9, 9),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                     onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
                    return LoginPage();//push just pushes the page to the side
                  }));},
                      child: const Text("Get Started",style: TextStyle(
                      color: Color.fromARGB(255, 250, 249, 249),
                      fontSize: 22,
                      
                      fontWeight: FontWeight.bold)),
                    ),
          )
           
               
              
            
          ],
        ),
      ),
    );
  }
}