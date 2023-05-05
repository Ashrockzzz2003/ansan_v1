import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Collaborator extends StatelessWidget {
  const Collaborator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
              child: Text(
                "Collaborators",
                textAlign: TextAlign.left,
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 32)),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(24),
              elevation: 16,
              shape: const RoundedRectangleBorder(
                  //side:  BorderSide(color: Colors.white70,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/image2.webp'),
                          radius: 64,
                        ),
                        const SizedBox(height: 8),
                        Text("Dr. Koshal Ram",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500, fontSize: 24)),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Chip(
                          elevation: 24,
                          label: Text(
                            "MS DNB",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("Opthamologist and Retinal Surgeon",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Text("Ponnamal Duraisamy Eye Hospital",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400, fontSize: 16)),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Introduced E-Paarvai, the motivation behind the application development",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(24),
              elevation: 16,
              shape: const RoundedRectangleBorder(
                  //side:  BorderSide(color: Colors.white70,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/image2.webp'),
                          radius: 64,
                        ),
                        const SizedBox(height: 8),
                        Text("Dr. Ram Gopal",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500, fontSize: 24)),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Chip(
                          elevation: 24,
                          label: Text(
                            "MBBS,MS OPTHALMOLOGY PHACO",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("Refractive and Glaucoma Surgeon",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_city_sharp),
                            const Padding(padding: EdgeInsets.only(right: 8)),
                            Text(
                              "Medivista Eye Hospital",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Also contacted for Datasets. Will visit on (17.01.23) and collect it",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(24),
              elevation: 16,
              shape: const RoundedRectangleBorder(
                  //side:  BorderSide(color: Colors.white70,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/image2.webp'),
                          radius: 64,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Dr. Sathyan Parthasardhi",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Chip(
                          elevation: 24,
                          label: Text(
                            "MBBS, D.O,Dip.N.B",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("Opthamology and Glaucoma services",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_city_sharp),
                            const Padding(padding: EdgeInsets.only(right: 8)),
                            Text(
                              "Sathya Eye Hospital ",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Provided Datasets",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
