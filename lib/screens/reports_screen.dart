import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  late ScrollController controller = ScrollController();

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add New Report, Start New Questionairre
          },
          label: Text (
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
                  icon: const Icon(Icons.search)
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
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
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onError,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      child: Text(
                        "No reports found.\nAdd your retina image and generate a glaucoma report by clicking on 'New Report'.",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
