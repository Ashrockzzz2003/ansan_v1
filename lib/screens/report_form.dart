import 'package:eperimetry_v1/screens/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({Key? key}) : super(key: key);

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int activeStep = 0;
  int maxIndex = 16;

  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

  final mainComplaintController = TextEditingController();

  String? _textFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //AppBar
        SliverAppBar.large(
          floating: false,
          pinned: true,
          snap: false,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "Report Questionnaire",
              style: GoogleFonts.raleway(),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => ReportScreen()),
                  (route) => false);
            },
          ),
        ),

        // main App UI
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Material(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    NumberStepper(
                      numbers: numbers,
                      activeStep: activeStep,
                      onStepReached: (index) {
                        setState(() {
                          activeStep = index;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        previousButton(),
                        nextButton(),
                      ],
                    ),
                    header(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        headerText(),
        style: GoogleFonts.raleway(
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  String headerText() {
    switch (activeStep+1) {
      case 1:
        return 'What is your main complaint?';
      case 2:
        return 'For how long you are having the problem?';
      case 3:
        return 'Has it progressed over a period of time?';
      case 4:
        return 'Do you have any associated problems?';
      case 5:
        return 'What is the duration of those problems?';
      case 6:
        return 'Is it associated with?';
      case 7:
        return 'Any time you had sudden exacerbation of the problem?';
      case 8:
        return 'Are you suffering from any co-morbidites like diabetes, hypertension, hypo or hyper-thyroidism, any breathing problems or any kidney or heart problems?';
      case 9:
        return 'Any of your family members have similar problems?';
      case 10:
        return 'Did you show to any doctor for this problem?';
      case 11:
        return 'Have you been taking medicines for this problem?';
      case 12:
        return 'Are you taking any long-term medicines for any problem?';
      case 13:
        return 'Any general investigations you have got done?';
      case 14:
        return 'Have you been diagnosed with any of the following diagnosis? [If yes please check the boxes accordingly]';
      case 15:
        return 'Have you got any of the following investigations for the above diseases? [If yes please check the boxes accordingly]';
      case 16:
        return 'Upload your eye pic';
      default:
        return 'default';
    }
  }

  /// Returns the next button.
  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Increment activeStep, when the next button is tapped. However, check for upper bound.
          if (activeStep < maxIndex-1) {
            setState(() {
              activeStep++;
            });
          }
        },
        child: Text(
          'Next',
          style: GoogleFonts.raleway(),
        ),
      ),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () {
            // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
            if (activeStep > 0) {
              setState(() {
                activeStep--;
              });
            }
          },
          child: Text(
            'Previous',
            style: GoogleFonts.raleway(),
          ),
        ));
  }
}
