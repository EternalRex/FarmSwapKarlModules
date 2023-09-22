import "package:firebase_auth/firebase_auth.dart";

class AdminFirebaseAuthentication {
  /*CREATING A FIREBASE AUTHENTICATION INSTANCE SO WE CAN ACCESS 
  ANY METHODS USABLE INSIDE THE FIREBASE AUTH PROVIDER*/
  FirebaseAuth authenticate = FirebaseAuth.instance;

  //METHOD FOR SIGNUP
  Future<User?> signUp(String username, String password) async {
    try {
      /*This line declares a public method called signUp() that takes a username
       and password as input and returns a Future<User?> object. The Future object 
       represents the asynchronous operation of creating a new user account. 
       The ? after User indicates that the method may return a null value if the account 
       creation fails */
      UserCredential adminCredential = await authenticate
          .createUserWithEmailAndPassword(email: username, password: password);
      //RETURNS A USER OBJECT REPRESENTING THE NEWLY CREATED USER
      return adminCredential.user;
    } catch (e) {
      "User sign up failed";
      return null;
    }
  }

/*SAME GOES IN THIS PROCESS*/
  Future<User?> signIn(String username, String password) async {
    try {
      UserCredential adminCredential = await authenticate
          .signInWithEmailAndPassword(email: username, password: password);
      return adminCredential.user;
    } catch (e) {
      "Sign in Failed";
      return null;
    }
  }
}
