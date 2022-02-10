import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;
  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Signup Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logIn(String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  void signUpWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential);
    Get.back();
  }

  void signOut() async {
    await _auth.signOut();
  }
}
