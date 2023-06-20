import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// This line declares a variable _firebaseAuth of type FirebaseAuth, which represents the Firebase Authentication service. The final keyword indicates
// that the variable can only be assigned once and cannot be modified afterward. It is assigned the value FirebaseAuth.instance, 
//which retrieves an instance of the Firebase Authentication service.
 
  User? get currentUser => _firebaseAuth.currentUser;
// This line defines a getter method named currentUser that returns a User object or null (User?). It allows access to the currently 
// authenticated user in Firebase Authentication. The currentUser getter retrieves the current user from the _firebaseAuth instance.

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
// In Dart and Flutter, the question mark (?) is used to indicate that a variable or object can hold a null value.
//This line defines a getter method named authStateChanges that returns a Stream<User?>. 
//It provides a stream of authentication state changes,
// which emits the User object whenever the user's authentication state changes (e.g., sign-in, sign-out, or user creation). 
//The authStateChanges getter returns the corresponding stream from the _firebaseAuth instance.

  Future<void> signInWithEmailAndPassword(
    {
      required String email,
      required String password,
    }
  ) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
//   This block of code defines an asynchronous function named signInWithEmailAndPassword. It takes two required parameters: email of type String and password of type String.
// The function signature indicates that the function will return a Future<void>, meaning it will eventually complete and not return any value.
// The async keyword is used to mark the function as asynchronous, allowing the use of await within the function body.
 Future<void> createUserWithEmailAndPassword(
    {
      required String email,
      required String password,
    }
  ) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
 Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}