import 'package:eperimetry_v1/screens/authors.dart';
import 'package:eperimetry_v1/screens/collaborators.dart';
import 'package:eperimetry_v1/screens/developers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eperimetry_v1/screens/home_screen.dart';



class AboutUs extends StatelessWidget {
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
                padding: const EdgeInsets.all(24),
            child: Text(
              "About Us",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40
                )

            ),
            ),
            ),
            GestureDetector(
              onTap: (){Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => Collaborator()
              )
              );
                },
              child:Card (
                margin: EdgeInsets.all(16),
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
                            radius: 40,

                          ),
                          SizedBox(height: 8),
                          Text("Collaborators",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 24)
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ) ,
            ),

            GestureDetector(
              onTap: (){Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Authors()
                  )
              );
              },
              child:Card (
                margin: EdgeInsets.all(16),
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
                            radius: 40,

                          ),
                          SizedBox(height: 8),
                          Text("Authors",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 24)
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ) ,
            ),
            GestureDetector(
              onTap: (){Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Developers()
                  )
              );
              },
              child:Card (
                margin: EdgeInsets.all(16),
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
                            radius: 40,

                          ),
                          SizedBox(height: 8),
                          Text("Developers",style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 24)
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ) ,
            )

          ],
        )
    );
  }
}