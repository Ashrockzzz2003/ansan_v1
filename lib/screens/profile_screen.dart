import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/edit_profile_screen.dart';
import 'package:eperimetry/screens/home_screen.dart';
import 'package:eperimetry/screens/reports_screen.dart';
import 'package:eperimetry/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:eperimetry/util/helper_functions.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({Key? key}) : super(key: key);

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  final nameController = TextEditingController();
  final occupationController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    setState(() {
      nameController.text = convertToTitleCase(ap.userModel.userName)!;
      occupationController.text = convertToTitleCase(ap.userModel.occupation)!;
      addressController.text = convertToTitleCase(ap.userModel.address)!;
      phoneController.text = ap.userModel.phoneNumber;
      ageController.text = convertToTitleCase(ap.userModel.age)!;
      genderController.text = convertToTitleCase(ap.userModel.gender)!;
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.raleway(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              ap.userSignOut().then(
                    (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                      (route) => false,
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://i.imgur.com/Jq0Tp2v.png",
                width: 240,
              ),
              TextFormField(
                enabled: false,
                style: GoogleFonts.raleway(
                  color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: const Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  labelStyle: GoogleFonts.raleway(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                enabled: false,
                style: GoogleFonts.raleway(
                    color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
                controller: occupationController,
                decoration: InputDecoration(
                  labelText: "Occupation",
                  prefixIcon: const Icon(Icons.factory_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  labelStyle: GoogleFonts.raleway(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                enabled: false,
                style: GoogleFonts.lato(
                    color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Mobile Number",
                  prefixIcon: const Icon(Icons.phone),
                  suffixIcon: phoneController.text.length > 9
                      ? Icon(
                      Icons.verified_outlined,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                  )
                      : null,
                  hintText: "Enter Mobile Number",
                  labelStyle: GoogleFonts.raleway(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                enabled: false,
                style: GoogleFonts.raleway(
                    color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
                controller: genderController,
                decoration: InputDecoration(
                  labelText: "Gender",
                  prefixIcon: const Icon(Icons.person_pin_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  labelStyle: GoogleFonts.raleway(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                enabled: false,
                style: GoogleFonts.raleway(
                    color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
                controller: ageController,
                decoration: InputDecoration(
                  labelText: "Age",
                  prefixIcon: const Icon(Icons.date_range),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  labelStyle: GoogleFonts.raleway(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                enabled: false,
                maxLines: null,
                style: GoogleFonts.raleway(
                    color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  prefixIcon: Icon(Icons.home_filled),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  labelStyle: GoogleFonts.raleway(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportScreen()))
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: Text(
                        "View Reports",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // backgroundColor: Theme.of(context).colorScheme.onError,
                      ),
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Confirm Delete",
                              style: GoogleFonts.raleway(),
                            ),
                            content: Text(
                              "Are you sure you want to delete your account?",
                              style: GoogleFonts.raleway(),
                            ),
                            actions: [
                              FilledButton.tonal(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.raleway(),
                                  )),
                              FilledButton.tonal(
                                  onPressed: () {
                                    setState(() {
                                      ap.deleteUserDataFromFirebase(
                                        context: context,
                                        userModel: ap.userModel,
                                        onSuccess: () {
                                          ap.userSignOut();
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WelcomeScreen()),
                                            (route) => false,
                                          );
                                        },
                                      );
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.onErrorContainer)
                                  ),
                                  child: Text(
                                    "Delete",
                                    style: GoogleFonts.raleway(
                                      color: Theme.of(context).colorScheme.errorContainer
                                    ),
                                  ))
                            ],
                          );
                        })
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Text(
                      "Delete Account",
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
