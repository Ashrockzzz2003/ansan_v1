import 'package:eperimetry_v1/provider/auth_provider.dart';
import 'package:eperimetry_v1/screens/home_screen.dart';
import 'package:eperimetry_v1/screens/user_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:eperimetry_v1/util/toast_message.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  final String verificationID;
  const OTPScreen({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: isLoading == true ? const Center(child: CircularProgressIndicator(),) : SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Container(
                          width: 500,
                          height: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/image3.webp"),
                        ),
                        const SizedBox(height: 24,),
                        Text(
                          "Verification",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          "Enter the OTP sent to your Mobile number.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 16,
                              )
                          ),
                        ),
                        const SizedBox(height: 48),
                        Pinput(
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: Theme.of(context).colorScheme.onPrimaryContainer
                                ),
                              ),
                              textStyle: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 24,
                                  )
                              )
                          ),
                          onCompleted: (value) {
                            setState(() {
                              otpCode = value;
                            });
                          },
                        ),
                        const SizedBox(height: 32,),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => {
                              if(otpCode?.length == 6) {
                                verifyOTP(context, otpCode.toString())
                              }
                              else {
                                showToast(context, "Please Enter the OTP")
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                              child: Text(
                                "Verify",
                                style: GoogleFonts.raleway(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                            "Didn't receive any code?",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Resend Code.",
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
      ),
    );
  }

  void verifyOTP(BuildContext context, String userOTP) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOTP(
        context: context,
        verificationID: widget.verificationID,
        userOTP: userOTP,
        onSuccess: () {
          // Check if user already exists
          ap.checkExistingUser().then((value) {
            if(value == true) {
              // OLD USER
              ap.getDataFromFireStore().then((value) => ap.saveUserDataToSP().then((value) => ap.setSignIn().then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false))));
            }
            else {
              // NEW USER
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserInformationScreen()), (route) => false);
            }
          });
        },
    );
  }
}
