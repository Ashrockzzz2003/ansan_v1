import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eperimetry_v1/model/user_model.dart';
import 'package:eperimetry_v1/screens/otp_screen.dart';
import 'package:eperimetry_v1/util/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _uID;
  String get uID => _uID!;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthProvider() {
    checkSignIn();
  }

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationID, forceResendingToken) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(verificationID: verificationID,)));
          },
          codeAutoRetrievalTimeout:(verificationID) {},
      );
    } on FirebaseAuthException catch(e) {
      showToast(context, e.message.toString());
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationID,
    required String userOTP,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try{
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationID,
          smsCode: userOTP,
      );

      User? user = (await _firebaseAuth.signInWithCredential(creds)).user!;
      if(user != null) {
        // Business Logic
        _uID = user.uid;
        onSuccess();
      }

      _isLoading = false;
      notifyListeners();

    } on FirebaseAuthException {
      _isLoading = false;
      notifyListeners();
      showToast(context, "Invalid OTP!");
    }
  }

  // DB Operations
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot = await _firebaseFirestore.collection("users").doc(_uID).get();
    if(snapshot.exists) {
      // print("USER EXISTS");
      return true;
    }
    else {
      // print("NEW USER");
      return false;
    }
  }
   String? getPhoneNumber() {
    return _firebaseAuth.currentUser?.phoneNumber;
   }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try{
      userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
      userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
      userModel.uID = _firebaseAuth.currentUser!.phoneNumber!;
      _userModel = userModel;

      // Uploading to FireStore
      await _firebaseFirestore
          .collection("users")
          .doc(_uID)
          .set(userModel.toMap()).then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch(e) {
      showToast(context, e.toString());
    }
  }

  void updateUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try{
      userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
      userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
      userModel.uID = _firebaseAuth.currentUser!.phoneNumber!;
      _userModel = userModel;

      // Uploading to FireStore
      await _firebaseFirestore
          .collection("users")
          .doc(_uID)
          .update(userModel.toMap()).then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch(e) {
      showToast(context, e.toString());
    }
  }

  Future getDataFromFireStore() async {
    await _firebaseFirestore.collection("users").doc(_firebaseAuth.currentUser!.uid).get().then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
          userName: snapshot["userName"],
          occupation: snapshot["occupation"],
          phoneNumber: snapshot["phoneNumber"],
          age: snapshot["age"],
          gender: snapshot["gender"],
          address: snapshot["address"],
          createdAt: snapshot["createdAt"],
          uID: uID
      );
      _uID = userModel.uID;
    });
  }

  // Storing Data Locally
  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? "";
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uID = _userModel!.uID;
    notifyListeners();
  }

  Future userSignOut() async {
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
  }
}