import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/intro_screen/intro_page3.dart';
import 'package:uptodo_app/login_register/login_screen.dart';
import 'package:uptodo_app/login_register/register_screen.dart';

class IntroLastPage extends StatefulWidget {
  const IntroLastPage({super.key});

  @override
  State<IntroLastPage> createState() => _IntroLastPageState();
}

class _IntroLastPageState extends State<IntroLastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double paddingValue = constraints.maxWidth > 600 ? 32 : 32;
          return Stack(
            children: [
              IconButton(
                padding: EdgeInsets.only(top: paddingValue, left: paddingValue),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const IntroPage3(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome to UpTodo',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 320, top: 30),
                    child: Text(
                      'Please login to your account or create \n new account to continue',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white54,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: paddingValue,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('#8875FF'),
                              fixedSize: const Size(327, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: paddingValue,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side: BorderSide(
                                color: HexColor('#8875FF'),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              fixedSize: const Size(327, 48)),
                          child: Text(
                            'CREATE ACCOUNT',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
