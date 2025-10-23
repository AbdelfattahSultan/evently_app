import 'package:evently_app/db/model/AppUser.dart';
import 'package:evently_app/db/UserDao.dart';
import 'package:evently_app/db/model/Event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppAuthProvider extends ChangeNotifier {
  static final _fbAuthService = FirebaseAuth.instance;

  AppUser? _dataBaseUser;

  var _fbUser = FirebaseAuth.instance.currentUser;

  AppAuthProvider() {
    retrieveUserFromDataBse();
  }

  bool isFavorite(Event event) {
    return _dataBaseUser?.favorites?.contains(event.id) ?? false;
  }

  void updateFavorites(List<String> favorites) async {
    _dataBaseUser?.favorites = favorites;
    notifyListeners();
  }

  AppUser? getUser() {
    return _dataBaseUser;
  }

  void logOut() {
    _fbAuthService.signOut();
    _dataBaseUser = null;
    _fbUser = null;
  }

  void retrieveUserFromDataBse() async {
    if (_fbUser != null) {
      _dataBaseUser = await UserDao.getUserById(_fbUser?.uid);
      notifyListeners();
    }
  }

  bool isLoginBefore() {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  static final GoogleSignIn _google = GoogleSignIn.instance;

  static bool _isInitialize = false;

  static Future<void> _intiGoogleSignIn() async {
    //initialize google signin --> identify app in google
    if (!_isInitialize) {
      await _google.initialize(
        serverClientId:
            '922575611847-s3bm8ilad0kpga00c75u5b9a6nb0ap2k.apps.googleusercontent.com', 
      );
      _isInitialize = true;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    //user select google account --> idToken, accessToken
    _intiGoogleSignIn();
    GoogleSignInAccount account = await _google.authenticate();
    final idToken = account.authentication.idToken;
    final authClient = account.authorizationClient;
    final auth = await authClient.authorizationForScopes(['email', 'profile']);
    final accessToken = auth?.accessToken;
    //tokens to firebase auth --> firebase user

    final credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );
    
    return await _fbAuthService.signInWithCredential(credential);
    
  }

  Future<AuthResponse> register(
    String email,
    String password,
    String phone,
    String name,
  ) async {
    try {
      final credential = await _fbAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(
        id: credential.user?.uid,
        email: email,
        name: name,
        phone: phone,
      );

      await UserDao.addUser(user);
      _dataBaseUser = user;
      _fbUser = credential.user;

      return AuthResponse(success: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.weakPassword.code) {
        return AuthResponse(success: false, failure: AuthFailure.weakPassword);
      } else if (e.code == AuthFailure.emailAlreadyUsed.code) {
        return AuthResponse(
          success: false,
          failure: AuthFailure.emailAlreadyUsed,
        );
      } else {
        return AuthResponse(success: false, failure: AuthFailure.general);
      }
    } catch (e) {
      return AuthResponse(success: false, failure: AuthFailure.general);
    }
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final credential = await _fbAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser? user = await UserDao.getUserById(credential.user?.uid);
      _dataBaseUser = user;
      _fbUser = credential.user;

      return AuthResponse(success: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.invalidCredentials.code) {
        return AuthResponse(
          success: false,
          failure: AuthFailure.invalidCredentials,
        );
      }
    } catch (e) {
      return AuthResponse(success: false, failure: AuthFailure.general);
    }
    return AuthResponse(success: false, failure: AuthFailure.general);
  }
  
}

class AuthResponse {
  final bool success;
  AuthFailure? failure;
  UserCredential? credential;
  AppUser? user;

  AuthResponse({
    required this.success,
    this.failure,
    this.credential,
    this.user,
  });
}

enum AuthFailure {
  weakPassword('weak-password'),
  emailAlreadyUsed('email-already-in-use'),
  invalidCredentials('invalid-credential'),
  general('something-went-wrong');

  const AuthFailure(this.code);
  final String code;
}
