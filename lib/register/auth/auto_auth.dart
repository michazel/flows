import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoAuth {
  Future<void> saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', true);
    await prefs.setInt('time', DateTime.now().millisecondsSinceEpoch);
  }

  Future<bool> check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? login = prefs.getBool('login');
    int? time = prefs.getInt('time');

    if(login != null && time != null && login) {
      DateTime loginTime = DateTime.fromMillisecondsSinceEpoch(time);
      Duration jarak = DateTime.now().difference(loginTime);

      if(jarak.inDays < 2) {
        return true;
      } else {
        await logout();
        return false;
      }
    }
    return false;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('login');
    await prefs.remove('time');

    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}