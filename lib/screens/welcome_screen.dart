import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eperimetry/screens/register_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: true);
    final isSignedIn = ap.isSignedIn;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      icon: const Icon(Icons.support),
                      title: Text(
                        "Support",
                        style: GoogleFonts.lato(),
                      ),
                      elevation: 3,
                      content: Text(
                        ap.isSignedIn
                            ? "Click on Login to view your dashboard with reports."
                            : "Click on Get Started to Register/Login",
                        style: GoogleFonts.raleway(),
                        textAlign: TextAlign.center,
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://i.imgur.com/raO93Yr.png",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "ePerimetry",
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Protect your vision, detect glaucoma early with our app",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                  fontSize: 16,
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (ap.isSignedIn == true) {
                    await ap.getDataFromFireStore().whenComplete(() => {
                          ap.saveUserDataToSP().whenComplete(() async => {
                                await ap.getDataFromSP().whenComplete(() =>
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen())))
                              })
                        });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Text(
                    isSignedIn ? "Login" : "Get Started",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
