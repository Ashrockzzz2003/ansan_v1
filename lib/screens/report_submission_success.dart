import 'package:eperimetry/screens/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessReportScreen extends StatefulWidget {
  const SuccessReportScreen({super.key});

  @override
  State<SuccessReportScreen> createState() => _SuccessReportScreenState();
}

class _SuccessReportScreenState extends State<SuccessReportScreen> {
  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  "assets/success.webp",
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "That's about it! Stay healthy!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "We will assess your information and will let you know soon if you need to get tested for COVID-19.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => ReportScreen()),
                        (route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Text(
                      "Back to Reports",
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
      ),
    );
  }
}
