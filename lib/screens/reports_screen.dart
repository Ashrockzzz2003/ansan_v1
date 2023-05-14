import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/home_screen.dart';
import 'package:eperimetry/screens/report_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  late ScrollController controller = ScrollController();

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ScrollController controller = ScrollController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add New Report, Start New Questionairre
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ReportFormScreen()));
        },
        label: Text(
          "New Report",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          // AppBar
          SliverAppBar.large(
            floating: false,
            pinned: true,
            snap: false,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "ePerimetry Reports",
                style: GoogleFonts.raleway(),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    // Search for reports based on date or whatever
                  },
                  icon: const Icon(Icons.search)),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),

          // Main APP UI
          SliverToBoxAdapter(
            child: Column(
              children: [
                Image.asset(
                  "assets/image7.webp",
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      child: Text(
                        "See the unseen with our app - Detect glaucoma early through retina analysis",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: ap.getReportsDataFromFireStore(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onError,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Text(
                                "Something Went Wrong...\nTry again later.",
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Fetching Reports...",
                            style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                              fontSize: 16,
                            )),
                          )
                        ],
                      );
                    }

                    if (!snapshot.data!.docs.isNotEmpty) {
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onError,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Text(
                                "No reports found.\nAdd your retina image and generate a glaucoma report by clicking on 'New Report'.",
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      );
                    } else {
                      return ListView(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        controller: controller,
                        children: snapshot.data!.docs.reversed
                            .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              DateTime timeStamp = DateTime.fromMillisecondsSinceEpoch(int.parse(data['generatedAt']));
                              return ListTile(
                                title: Text("${timeStamp.day}-${timeStamp.month}-${timeStamp.year} ${timeStamp.hour}:${timeStamp.minute}:${timeStamp.second} ${timeStamp.timeZoneName}",
                                  style: GoogleFonts.raleway(),
                                ),
                                subtitle: Image.network(
                                    data['leftEye'],
                                    fit: BoxFit.scaleDown,
                                    height: 240,
                                    width: 240,
                                ),
                              );
                            })
                            .toList()
                            .cast(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
