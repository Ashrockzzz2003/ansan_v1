import 'package:eperimetry_v1/provider/auth_provider.dart';
import 'package:eperimetry_v1/screens/profile_screen.dart';
import 'package:eperimetry_v1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard", style: GoogleFonts.raleway(),),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const ProfileScreeen()
            ));
          },
          icon: Icon(Icons.person_sharp),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              ap.userSignOut().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()
                    ),
                  ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image1.webp",
            width: 300,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome,\n${ap.userModel.userName}",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  )
              ),
            ),
          ),
          const SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: Text(
                    "Reports",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
