import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/util/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  // Field Validation
  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Mobile Number!';
    } else if (value.length != 10) {
      return 'Please enter a valid 10 digit phone number!';
    } else if (!RegExp(r'^0?[6789]\d{9}$').hasMatch(value)) {
      return 'Invalid Mobile Number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(TextPosition(
      offset: phoneController.text.length,
    ));
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      icon: Icon(Icons.login_outlined),
                      title: Text(
                        "Login / Register",
                        style: GoogleFonts.lato(),
                      ),
                      elevation: 3,
                      content: Text(
                        "Enter your 10-digit valid mobile number. Click on Login. OTP will be sent to your number. Enter it and proceed. Make sure you internet is turned on.",
                        style: GoogleFonts.raleway(),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
              );
            },
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: isLoading == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Sending OTP...",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                      fontSize: 16,
                    )),
                  )
                ],
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 300,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network("https://i.imgur.com/SEYvKdB.png"),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Sign In",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Enter your Mobile number. We'll send you an OTP verification code.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        ),
                        const SizedBox(height: 48),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              phoneController.text = value;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.nunito(),
                          controller: phoneController,
                          validator: _fieldValidator,
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            prefixIcon: const Icon(Icons.phone),
                            suffixIcon: phoneController.text.length > 9
                                ? const Icon(Icons.verified_outlined)
                                : null,
                            hintText: "Enter Mobile Number",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer),
                            ),
                            labelStyle: GoogleFonts.raleway(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {sendPhoneNumber()}
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Text(
                                "Login",
                                style: GoogleFonts.raleway(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    setState(() {
      ap.signInWithPhone(context, "+91$phoneNumber");
    });
  }
}
