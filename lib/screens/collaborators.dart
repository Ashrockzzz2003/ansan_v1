import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eperimetry_v1/screens/home_screen.dart';



class Collaborator extends StatelessWidget {
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
          padding: const EdgeInsets.fromLTRB(24, 24,0,0),
          child: Text(
            "Collaborators",
            textAlign: TextAlign.left,
            style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32
                )

            ),
          ),
        ),
        Card (
          margin: EdgeInsets.all(24),
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
                      radius: 64,

                    ),
                    SizedBox(height: 8),
                    Text("Dr. Koshal Ram",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 24)
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Chip(
                      elevation: 24,
                      label: Text("MS DNB",style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Opthamologist and Retinal Surgeon",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 16)
                    )
                    ,
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Icon(Icons.location_city_sharp),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        Text("Ponnamal Duraisamy Eye Hospital",style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 16)
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text("Introduced E-Paarvai, the motivation behind the application development",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
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
        Card (
          margin: EdgeInsets.all(24),
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
                      radius: 64,

                    ),
                    SizedBox(height: 8),
                    Text("Dr. Ram Gopal",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 24)
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Chip(
                          elevation: 24,
                          label: Text("MBBS,MS OPTHALMOLOGY PHACO",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 15
                          ),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                        ),
                    SizedBox(height: 16,),
                    Text("Refractive and Glaucoma Surgeon",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 16)
                    )
                    ,
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Icon(Icons.location_city_sharp),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        Text("Medivista Eye Hospital",
                            style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text("Also contacted for Datasets. Will visit on (17.01.23) and collect it",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
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
        Card (
          margin: EdgeInsets.all(24),
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
                      radius: 64,

                    ),
                    SizedBox(height: 8),
                    Text("Dr. Sathyan Parthasardhi",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 24)
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Chip(
                      elevation: 24,
                      label: Text("MBBS, D.O,Dip.N.B",style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Opthamology and Glaucoma services",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 16)
                    )
                    ,
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Icon(Icons.location_city_sharp),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        Text("Sathya Eye Hospital ",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text("Provided Datasets",style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
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
    )
    );
  }
}