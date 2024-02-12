import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/intro_screen/intro_page2.dart';
import 'package:uptodo_app/intro_screen/intro_page_last.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double paddingValue = constraints.maxWidth > 600 ? 32 : 32;
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
                      fontWeight: FontWeight.w400,
                    ),
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
                            'lib/assets/page3img.png',
                          ),
                        ),
                      ),
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
                          'Organize your tasks',
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
                          'You can organize your daily tasks by \n adding your tasks into separate categories',
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const IntroPage2(),
                            ),
                          );
                        },
                        child: Text(
                          'BACK',
                          style: GoogleFonts.lato(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        width: paddingValue,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const IntroLastPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor('#8875FF'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            fixedSize: const Size(150, 48)),
                        child: Text(
                          'GET STARTED',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
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
