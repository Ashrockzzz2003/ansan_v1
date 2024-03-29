import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/authors.dart';
import 'package:eperimetry/screens/collaborators.dart';
import 'package:eperimetry/screens/developers.dart';
import 'package:eperimetry/screens/edit_profile_screen.dart';
import 'package:eperimetry/screens/profile_screen.dart';
import 'package:eperimetry/screens/reports_screen.dart';
import 'package:eperimetry/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final isLoading =  Provider.of<AuthProvider>(context, listen: true).isLoading;

    return isLoading == true ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Verifying Login...",
            style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 16,
                )),
          )
        ],
      ),
    ) : Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: GoogleFonts.raleway(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileScreeen()));
          },
          icon: const Icon(Icons.person_sharp),
        ),
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
                      content: Text( "To Logout: Top-Right icon\nTo View your Profile: Top-Left icon",
                        style: GoogleFonts.raleway(),
                        textAlign: TextAlign.center,
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: () async {
              ap.userSignOut().then(
                    (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()),
                        (route) => false),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.remove_red_eye_rounded),
          //   label: "Reports",
          // ),
          NavigationDestination(
            icon: Icon(Icons.groups_rounded),
            label: "About Us",
          ),
        ],
      ),
      body: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://i.imgur.com/raO93Yr.png",
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
                    )),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()))
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReportScreen()))
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
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
        // Center(
        //   child: Card(
        //     margin: const EdgeInsets.all(16),
        //     elevation: 8,
        //     shape: const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(24))),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: <Widget>[
        //         Padding(
        //           padding: const EdgeInsets.all(24),
        //           child: Text("Work In Progress",
        //               style: GoogleFonts.raleway(
        //                   fontWeight: FontWeight.w500, fontSize: 24)),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                "About Us",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 40)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Collaborator()));
              },
              child: Card(
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://i.imgur.com/SEYvKdB.png'),
                            radius: 40,
                          ),
                          const SizedBox(height: 8),
                          Text("Collaborators",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Authors()));
              },
              child: Card(
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://i.imgur.com/SEYvKdB.png'),
                            radius: 40,
                          ),
                          const SizedBox(height: 8),
                          Text("Authors",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Developers()));
              },
              child: Card(
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://i.imgur.com/SEYvKdB.png'),
                            radius: 40,
                          ),
                          const SizedBox(height: 8),
                          Text("Developers",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ][currentPageIndex],
    );
  }
}
