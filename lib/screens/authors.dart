import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eperimetry_v1/screens/home_screen.dart';



class Authors extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_return_sharp),
          ),
        ),
        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0,0,0),
              child: Text(
                "Authors",
                textAlign: TextAlign.left,
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32
                    )

                ),
              ),
            ),

            InkWell(
              onTap: (){},
              highlightColor: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.1),
              splashColor:   Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.1),
              child:
              Card (
                margin: EdgeInsets.fromLTRB(24, 16, 24, 24),
                elevation: 16,
                shape: RoundedRectangleBorder(
                  //side:  BorderSide(color: Colors.white70,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/image2.webp'),
                            radius: 48,

                          ),
                          SizedBox(height: 16),
                          Text("Dr. T Senthil Kumar",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 24)
                          ),
                          Padding(padding: EdgeInsets.only(top: 16)),
                          Chip(
                            elevation: 24,
                            label: Text("Assistant Professor",style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w300,
                                fontSize: 16
                            ),),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text("Amrita School of Computing",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 16)
                          )
                          ,
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              highlightColor: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.1),
              splashColor:   Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.1),
              child:
              Card (
                margin: EdgeInsets.fromLTRB(24, 0, 24, 24),
                elevation: 16,
                shape: RoundedRectangleBorder(
                  //side:  BorderSide(color: Colors.white70,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/image2.webp'),
                            radius: 48,

                          ),
                          SizedBox(height: 16),
                          Text("Avadhani Bindu",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 24)
                          ),
                          Padding(padding: EdgeInsets.only(top: 16)),
                          Chip(
                            elevation: 24,
                            label: Text("PhD Scholar",style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w300,
                                fontSize: 16
                            ),),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text("Amrita School of Computing",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 16)
                          )
                          ,
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}