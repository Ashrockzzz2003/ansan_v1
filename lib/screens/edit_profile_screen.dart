import 'package:eperimetry/model/user_model.dart';
import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:eperimetry/util/helper_functions.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final occupationController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  String? gender;

  @override
  void initState() {
    super.initState();
    prefillData();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    occupationController.dispose();
    addressController.dispose();
    phoneController.dispose();
    ageController.dispose();
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required!';
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
      extendBodyBehindAppBar: true,
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                //AppBar
                SliverAppBar.medium(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),),
                  floating: false,
                  pinned: true,
                  snap: false,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Update Profile",
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                ),

                // main App UI
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/image4.webp",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  style: GoogleFonts.raleway(),
                                  controller: nameController,
                                  validator: _fieldValidator,
                                  decoration: InputDecoration(
                                    labelText: "Full Name",
                                    prefixIcon: const Icon(Icons.person),
                                    hintText: "Enter Full Name",
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
                                  height: 24,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.raleway(),
                                  controller: occupationController,
                                  validator: _fieldValidator,
                                  decoration: InputDecoration(
                                    labelText: "Occupation",
                                    prefixIcon:
                                        const Icon(Icons.factory_outlined),
                                    hintText: "Enter Occupation",
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
                                  height: 24,
                                ),
                                TextFormField(
                                  enabled: false,
                                  onChanged: (value) {
                                    setState(() {
                                      phoneController.text = value;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.raleway(),
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
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer),
                                    ),
                                    labelStyle: GoogleFonts.raleway(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.raleway(),
                                  controller: ageController,
                                  validator: _fieldValidator,
                                  decoration: InputDecoration(
                                    labelText: "Age",
                                    prefixIcon: const Icon(Icons.date_range),
                                    hintText: "Enter your Age",
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
                                  height: 24,
                                ),
                                DropdownButtonFormField(
                                  value: gender,
                                  items: <DropdownMenuItem<String>>[
                                    DropdownMenuItem(
                                      value: "male",
                                      child: Text(
                                        "Male",
                                        style: GoogleFonts.raleway(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "female",
                                      child: Text(
                                        "Female",
                                        style: GoogleFonts.raleway(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "transgender",
                                      child: Text(
                                        "Transgender",
                                        style: GoogleFonts.raleway(),
                                      ),
                                    ),
                                  ],
                                  validator: _fieldValidator,
                                  decoration: InputDecoration(
                                    labelText: "Gender",
                                    prefixIcon:
                                        const Icon(Icons.person_pin_outlined),
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
                                  onChanged: (String? value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: GoogleFonts.raleway(),
                                  controller: addressController,
                                  validator: _fieldValidator,
                                  minLines: 3,
                                  decoration: InputDecoration(
                                    labelText: "Address",
                                    hintText: "Enter your address...",
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
                                        {updateData()}
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 8.0),
                                      child: Text(
                                        "Update",
                                        style: GoogleFonts.raleway(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void getPhoneNumber() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      phoneController.text = ap.getPhoneNumber().toString();
    });
  }

  void prefillData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      getPhoneNumber();
      nameController.text = convertToTitleCase(ap.userModel.userName)!;
      occupationController.text = convertToTitleCase(ap.userModel.occupation)!;
      addressController.text = convertToTitleCase(ap.userModel.address)!;
      ageController.text = convertToTitleCase(ap.userModel.age)!;
      gender = ap.userModel.gender;
    });
  }

  // Store User Data
  void updateData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        userName: nameController.text.trim(),
        occupation: occupationController.text.trim(),
        phoneNumber: "",
        age: ageController.text.trim(),
        gender: gender.toString(),
        address: addressController.text,
        createdAt: "",
        uID: "");

    ap.updateUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          ap.saveUserDataToSP().then((value) => ap.setSignIn().then((value) =>
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false)));
        });
  }
}
