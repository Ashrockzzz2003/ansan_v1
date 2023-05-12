import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Developers extends StatelessWidget {
  const Developers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: ListView(
          children: [
            Text(
              "Developers",
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
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    //side:  BorderSide(color: Colors.white70,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ListTile(
                        leading: Image.asset('assets/image2.webp'),
                        title: Text(
                          "Ashwin Narayanan S",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Chip(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          elevation: 24,
                          label: Text(
                            "CB.EN.U4CSE21008",
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                        ),
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
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ListTile(
                        leading: Image.asset('assets/image2.webp'),
                        title: Text(
                          "Lalith Guptha B",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Chip(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          elevation: 24,
                          label: Text(
                            "CB.EN.U4CSE20138",
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                        ),
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
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ListTile(
                        leading: Image.asset('assets/image2.webp'),
                        title: Text(
                          "Aravind S",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Chip(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          elevation: 24,
                          label: Text(
                            "CB.EN.U4CSE20208",
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                        ),
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
                margin: const EdgeInsets.all(16),
                elevation: 16,
                shape: const RoundedRectangleBorder(
                    //side:  BorderSide(color: Colors.white70,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ListTile(
                        leading: Image.asset('assets/image2.webp'),
                        title: Text(
                          "Abirami S",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Chip(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          elevation: 24,
                          label: Text(
                            "CB.EN.U4CSE20202",
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                        ),
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
