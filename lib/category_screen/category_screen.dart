import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/category_screen/components/category_color_palette.dart';
import 'package:uptodo_app/index_screen/home_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              //Cihazın Genişliğine göre en uygun genişlik değeri belirlenir.
              double paddingValue = constraints.maxWidth > 600 ? 32 : 20.0;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  Text(
                    'Create new category',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: paddingValue),
                  const Text(
                    'Category name : ',
                  ),
                  SizedBox(
                    height: paddingValue,
                  ),
                  TextField(
                    controller: categoryNameController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: paddingValue),
                      hintText: 'Category name',
                      hintStyle: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: paddingValue,
                  ),
                  Text(
                    'Category icon :',
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: paddingValue,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 154,
                      height: 37,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(
                          'Choose icon from library',
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: paddingValue,
                  ),
                  Text(
                    'Category color:',
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: paddingValue),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ColorPalette(
                          hexColor: HexColor("#C9CC41"),
                        ),
                        const SizedBox(
                          /* width: screenWidth * 0.05, */
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#66CC41"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#41CCA7"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#4181CC"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#41A2CC"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#CC8441"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#9741CC"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ColorPalette(
                          hexColor: HexColor("#CC4173"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Button'a tıklandığında yapılacak işlemler
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                            },
                            style: TextButton.styleFrom(
                              fixedSize: const Size(154, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.lato(
                                  color: HexColor("#8687E7"),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: paddingValue,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Button'a tıklandığında yapılacak işlemler
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor("#8687E7"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              fixedSize: const Size(153, 48),
                            ),
                            child: Text(
                              'Create Category',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
