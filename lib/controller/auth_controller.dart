import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/utils.dart';

class AuthController extends GetxController { 

FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);




@override
 void OnInit(){
  super.onInit();
  user.bindStream(auth.authStateChanges());
 }

 @override
 void onReady(){
  super.onReady();
 }

login() async {
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  if(googleUser !=null){
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  AuthCredential credential =GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,accessToken: googleAuth.accessToken,  );
  
 UserCredential userCredential = await auth.signInWithCredential(credential);

User? user = userCredential.user!;

userCollection.doc(user.uid).set({
"username":user.displayName,
"email": user.email,
"photoUrl":user.photoURL,
"uid":user.uid,
"userCreated":DateTime.now()

});





  }
}

}