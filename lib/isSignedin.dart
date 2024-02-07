import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void createUser(email,password)
async{
  try{
 final credentials= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
 


  }
  on FirebaseAuthException catch(e)
  {
    if(e.code=='weak-password')
    {
      print('User is signed in');
    }
    else
    {
      print('User is not signed in');
    }
  }
}


void signIn(email,password)
async{
  try{
 final credentials= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
 


  }
  on FirebaseAuthException catch(e)
  {
    if(e.code=='user-not-found')
    {
      print('No user');
    }
    else if (e.code=='wrong-password')
    {
      print('Wrong password');
    }
    else
    {
      print('User is not signed in');
    }
  }
}

