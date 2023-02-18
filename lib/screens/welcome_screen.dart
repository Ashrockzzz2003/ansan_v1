import 'package:eperimetry_v1/provider/auth_provider.dart';
import 'package:eperimetry_v1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eperimetry_v1/screens/register_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/image1.webp",),
                  const SizedBox(height: 20,),
                  Text(
                    "ePerimetry",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Protect your vision, detect glaucoma early with our app",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          fontSize: 16,
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () async {
                      if(ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(() => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen())));
                      }
                      else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterScreen(),
                        ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: Text(
                        "Get Started",
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
          )
        ),
      ),
    );
  }
}
