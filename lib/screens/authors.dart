import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authors extends StatelessWidget {
  const Authors({super.key});

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
            Text(
              "Authors",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 32)),
            ),
            InkWell(
              onTap: () {},
              highlightColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.1),
              splashColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.1),
              child: Card(
                margin: const EdgeInsets.fromLTRB(24, 16, 24, 24),
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
                            backgroundImage: AssetImage('assets/image2.webp'),
                            radius: 48,
                          ),
                          const SizedBox(height: 16),
                          Text("Dr. T Senthil Kumar",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                          const Padding(padding: EdgeInsets.only(top: 16)),
                          Chip(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            elevation: 24,
                            label: Text(
                              "Assistant Professor",
                              style: GoogleFonts.raleway(
                                color: Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Amrita School of Computing",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              highlightColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.1),
              splashColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.1),
              child: Card(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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
                            backgroundImage: AssetImage('assets/image2.webp'),
                            radius: 48,
                          ),
                          const SizedBox(height: 16),
                          Text("Avadhani Bindu",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                          const Padding(padding: EdgeInsets.only(top: 16)),
                          Chip(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            elevation: 24,
                            label: Text(
                              "PhD Scholar",
                              style: GoogleFonts.raleway(
                                color: Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Amrita School of Computing",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
