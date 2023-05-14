import 'dart:convert';
import 'dart:io';
import 'package:eperimetry/model/report_model.dart';
import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/home_screen.dart';
import 'package:eperimetry/screens/report_submission_success.dart';
import 'package:eperimetry/screens/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({Key? key}) : super(key: key);

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  File? _image;
  ImagePicker? imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    super.dispose();
    mainComplaintController.dispose();
    howLongController.dispose();
    progressedOverTimeController.dispose();
    associatedProblemsController.dispose();
    durationOfAssociatedProblemsController.dispose();
    asociatedWithController.dispose();
    exacerbationController.dispose();
    coMorbitesController.dispose();
    familyController.dispose();
    doctorController.dispose();
    medicineController.dispose();
    longTermMedicineController.dispose();
    investigationsController.dispose();
    diagnosedWithController.dispose();
    diagnosedInvestigationController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  int activeStep = 0;

  final List<int> numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
  ];

  int maxIndex = 16;

  final mainComplaintController = TextEditingController();
  final howLongController = TextEditingController();
  final progressedOverTimeController = TextEditingController();
  final associatedProblemsController = TextEditingController();
  final durationOfAssociatedProblemsController = TextEditingController();
  final asociatedWithController = TextEditingController();
  final exacerbationController = TextEditingController();
  final coMorbitesController = TextEditingController();
  final familyController = TextEditingController();
  final doctorController = TextEditingController();
  final medicineController = TextEditingController();
  final longTermMedicineController = TextEditingController();
  final investigationsController = TextEditingController();
  final diagnosedWithController = TextEditingController();
  final diagnosedInvestigationController = TextEditingController();

  String? _textFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ReportScreen()),
                          (route) => false);
                    },
                  ),
                ),

                // main App UI
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          NumberStepper(
                            activeStepColor:
                                Theme.of(context).primaryIconTheme.color,
                            activeStepBorderColor:
                                Theme.of(context).secondaryHeaderColor,
                            stepColor: Theme.of(context).splashColor,
                            lineColor: Theme.of(context).secondaryHeaderColor,
                            stepReachedAnimationEffect: Curves.easeInOutCubic,
                            enableStepTapping: false,
                            direction: Axis.horizontal,
                            enableNextPreviousButtons: false,
                            numbers: numbers,
                            activeStep: activeStep,
                            lineLength: 24,
                            onStepReached: (index) {
                              setState(() {
                                activeStep = index;
                              });
                            },
                          ),
                          header(),
                          const SizedBox(height: 24.0),
                          Form(
                              autovalidateMode: AutovalidateMode.disabled,
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      previousButton(),
                                      nextButton(),
                                    ],
                                  ),
                                  const SizedBox(height: 24.0),
                                  formElement(activeStep),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  // Function to return a radio button group given, options, string values, and a controller

  Widget radioButtonGroup(List<String> options, List<String> values,
      TextEditingController controller) {
    return Column(
      children: [
        for (int i = 0; i < options.length; i++)
          RadioListTile(
            title: Text(
              options[i],
              style: GoogleFonts.raleway(),
            ),
            value: values[i],
            groupValue: controller.text,
            onChanged: (String? value) {
              setState(() {
                controller.text = value!;
              });
            },
          ),
      ],
    );
  }

  // Function to return a checkbox button group given, options, string values, and a controller
  Widget checkBoxButtonGroup(List<String> options, List<String> values,
      TextEditingController controller) {
    return Column(
      children: [
        for (int i = 0; i < options.length; i++)
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              options[i],
              style: GoogleFonts.raleway(),
            ),
            value: controller.text.contains(values[i]),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  controller.text += "${values[i]},";
                } else {
                  controller.text =
                      controller.text.replaceAll("${values[i]},", "");
                }
              });
            },
          ),
      ],
    );
  }

  Widget formElement(int index) {
    switch (activeStep + 1) {
      case 1:
        return TextFormField(
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.raleway(),
          controller: mainComplaintController,
          validator: _textFieldValidator,
          minLines: 1,
          maxLines: null,
          decoration: InputDecoration(
            labelText: "Main Complaint",
            hintText: "Main Complaint",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
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
        );
      case 2:
        return radioButtonGroup([
          "Past 2 weeks or lesser",
          "Past 4 weeks",
          "Past month",
          "I'm not sure"
        ], [
          "time_1",
          "time_2",
          "time_3",
          "time_4"
        ], howLongController);
      case 3:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], progressedOverTimeController);
      case 4:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], associatedProblemsController);
      case 5:
        return radioButtonGroup([
          "Past 2 weeks or lesser",
          "Past 4 weeks",
          "Past month",
          "I'm not sure"
        ], [
          "time_1",
          "time_2",
          "time_3",
          "time_4"
        ], durationOfAssociatedProblemsController);
      case 6:
        return radioButtonGroup([
          "Redness Of the Eye",
          "Pain",
          "Halos around light",
          "None of the above"
        ], [
          "redness",
          "pain",
          "halos",
          "none"
        ], asociatedWithController);
      case 7:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], exacerbationController);
      case 8:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], coMorbitesController);
      case 9:
        return radioButtonGroup(["Yes", "No"], ["Yes", "No"], familyController);
      case 10:
        return radioButtonGroup(["Yes", "No"], ["Yes", "No"], doctorController);
      case 11:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], medicineController);
      case 12:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], longTermMedicineController);
      case 13:
        return radioButtonGroup(
            ["Yes", "No"], ["Yes", "No"], investigationsController);
      case 14:
        return checkBoxButtonGroup([
          "Diabetic Retinopathy",
          "Hypertensive Retinopathy",
          "Age Related Macular Degenerations",
          "Macular Hole",
          "Glaucoma",
          "Cataract",
          "Uveitis",
          "None of the above"
        ], [
          "diabetic_retinopathy",
          "hypertensive_retinopathy",
          "age_related_macular_degenerations",
          "macular_hole",
          "glaucoma",
          "cataract",
          "uveitis",
          "none"
        ], diagnosedWithController);
      case 15:
        return checkBoxButtonGroup([
          "Fundus Photography",
          "Fundus Angiography",
          "Optical Coherence Tomography",
          "Visual Field Analysis",
          "Gonioscopy",
          "Central Corneal Thickness Analysis",
          "Slit Lamp Investigation",
          "Applanation Tonometry",
          "B Scan",
          "Biochemical Parameters Analysis",
          "Immunological Parameters Analysis",
          "None of the above"
        ], [
          "fundus_photography",
          "fundus_angiography",
          "optical_coherence_tomography",
          "visual_field_analysis",
          "gonioscopy",
          "central_corneal_thickness_analysis",
          "slit_lamp_investigation",
          "applanation_tonometry",
          "b_scan",
          "biochemical_parameters_analysis",
          "immunological_parameters_analysis",
          "none"
        ], diagnosedInvestigationController);
      case 16:
        return Column(
          children: [
            Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Upload Image from Gallery",
                                style: GoogleFonts.raleway(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onPressed: () async {
                              XFile? image = await ImagePicker().pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 50,
                                preferredCameraDevice: CameraDevice.front,
                              );
                              setState(() async {
                                if (image != null) {
                                  _image = File(image.path);
                                }
                              });
                            },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Take Image from Camera",
                                  style: GoogleFonts.raleway(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onPressed: () async {
                                XFile? image = await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                  imageQuality: 50,
                                  preferredCameraDevice: CameraDevice.front,
                                );
                                setState(() {
                                  if (image != null) {
                                    _image = File(image.path);
                                  }
                                });
                              },
                            )),
                      ],
                    )
                  : Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Remove Image",
                      style: GoogleFonts.raleway(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _image = null;
                    });
                  },
                )),
          ],
        );
      default:
        return const Text("No Form Element");
    }
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
    switch (activeStep + 1) {
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
        return 'Upload the pic of your eye';
      default:
        return 'Something went wrong!';
    }
  }

  Future<String> uploadImage(String title, File image, String uID) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://api.imgur.com/3/image"));
    request.fields["title"] = uID;
    request.headers['Authorization'] = "Client-ID 15300df0c3ee7a8";
    var picture =
        http.MultipartFile.fromBytes('image', (await image.readAsBytes()));

    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    return (jsonDecode(result)['data'])['link'];
  }

  /// Returns the next button.
  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: activeStep == maxIndex - 1
            ? () {
                storeData();
              }
            : () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Increment activeStep, when the next button is tapped. However, check for upper bound.
                  if (activeStep < maxIndex - 1) {
                    setState(() {
                      activeStep++;
                    });
                  }
                }
              },
        child: Text(
          activeStep == maxIndex - 1 ? "Submit" : "Next",
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
          onPressed: activeStep <= 0
              ? null
              : () {
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

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final leftEye = await uploadImage(ap.uID, _image!, ap.uID);
    ReportModel report = ReportModel(
        mainComplaint: mainComplaintController.text.trim(),
        howLong: howLongController.text.trim(),
        progressedOverTime: progressedOverTimeController.text.trim(),
        associatedProblems: associatedProblemsController.text.trim(),
        durationOfAssociatedProblems:
            durationOfAssociatedProblemsController.text.trim(),
        associatedWith: asociatedWithController.text.trim(),
        exacerbation: exacerbationController.text.trim(),
        coMorbites: coMorbitesController.text.trim(),
        family: familyController.text.trim(),
        doctor: doctorController.text.trim(),
        medicine: medicineController.text.trim(),
        longTermMedicine: longTermMedicineController.text.trim(),
        investigations: investigationsController.text.trim(),
        diagnosedWith: diagnosedWithController.text.trim(),
        diagnosedInvestigation: diagnosedInvestigationController.text.trim(),
        leftEye: leftEye,
        generatedAt: "");

    ap.saveReportDataToFirebase(
      context: context,
      reportModel: report,
      onSuccess: () {
        ap.saveUserDataToSP().then(
              (value) => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const SuccessReportScreen()),
                  (route) => false),
            );
      },
    );
  }
}
