import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/intro_screen/intro_page2.dart';
import 'package:uptodo_app/intro_screen/intro_page_last.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(
          30,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double paddingValue = constraints.maxWidth > 600 ? 32 : 32.0;
            return Stack(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const IntroLastPage(),
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'SKIP',
                    style: GoogleFonts.lato(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 213,
                      height: 277.78,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'lib/assets/page1img.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: paddingValue,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 75,
                          child: Divider(
                            thickness: 4,
                            color: Colors.white,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Divider(
                            thickness: 4,
                            color: Color.fromARGB(255, 150, 149, 149),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Divider(
                            thickness: 4,
                            color: Color.fromARGB(255, 150, 149, 149),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: paddingValue,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Manage your tasks',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: paddingValue,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'You can easily manage all of your daily \n tasks in DoMe for free',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'BACK',
                          style: GoogleFonts.lato(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: paddingValue,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const IntroPage2(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor('#8875FF'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            fixedSize: const Size(90, 48)),
                        child: Text(
                          'NEXT',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
