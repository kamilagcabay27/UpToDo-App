import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/intro_screen/intro_page1.dart';
import 'package:uptodo_app/intro_screen/intro_page3.dart';
import 'package:uptodo_app/intro_screen/intro_page_last.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(
          28,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double paddingValue = constraints.maxWidth > 600 ? 32 : 28;
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
                            'lib/assets/page2img.png',
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
                            color: Color.fromARGB(255, 150, 149, 149),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
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
                      ],
                    ),
                    SizedBox(
                      height: paddingValue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Create daily routine',
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
                          'In Uptodo  you can create your \n personalized routine to stay productive',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: paddingValue,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const IntroPage1(),
                            ),
                          );
                        },
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
                              builder: (context) => const IntroPage3(),
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
