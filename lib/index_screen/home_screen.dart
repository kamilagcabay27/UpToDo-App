import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/category_screen/category_screen.dart';
import 'package:uptodo_app/components/category_item.dart';
import 'package:uptodo_app/components/items.dart';
import 'package:uptodo_app/components/search_box.dart';
import 'package:uptodo_app/index_screen/page/calendar.dart';
import 'package:uptodo_app/index_screen/page/focuse.dart';
import 'package:uptodo_app/index_screen/page/profile.dart';
import 'package:uptodo_app/model/task_model.dart';
import 'package:uptodo_app/widget/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final uptodoList = UpToDo.uptodoList();
  List<UpToDo> _foundUpToDo = [];
  int currentTab = 0;
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  ValueNotifier<bool> isFirstTextFieldVisible = ValueNotifier<bool>(false);
  ValueNotifier<bool> isSecondTextFieldVisible = ValueNotifier<bool>(false);
  ValueNotifier<bool> isAddTextVisible = ValueNotifier<bool>(true);
  ValueNotifier<bool> isDescriptionTextVisible = ValueNotifier<bool>(true);
  final List<Widget> screens = [];
  int currentIndex = 0;
  String? choosenDay;
  List<String> allDay = [
    'Today',
    'Tomorrow',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  @override
  void initState() {
    super.initState();
    _foundUpToDo = uptodoList;
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: HexColor('#363636'),
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/index.png'), label: "Index"),
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/calendar.png'), label: "Calendar"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'Focuse'),
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/user.png'), label: 'Profile'),
        ],
      ),
      body: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('lib/assets/sortIcon.png'),
                      ),
                      const SizedBox(
                        width: 117,
                      ),
                      Text(
                        'Index',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('lib/assets/profile.png'))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SearchBox(
                        controller: searchController,
                        hintText: 'Search for your task...',
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: DropdownButton(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        dropdownColor: Colors.grey,
                        icon: Image.asset("lib/assets/arrowDown.png"),
                        hint: Text(
                          'Today',
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                        items: allDay
                            .map(
                              (String day) => DropdownMenuItem(
                                value: day,
                                child: Text(day),
                              ),
                            )
                            .toList(),
                        value: choosenDay,
                        onChanged: (String? value) {
                          setState(() {
                            print("Working : $value");
                            choosenDay = value!;
                          });
                        },
                      ),
                    ),
                    ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _foundUpToDo.length,
                      itemBuilder: (context, index) {
                        UpToDo todoo = _foundUpToDo[index];
                        return UpToDoItem(
                            uptodo: todoo,
                            onUpToDoChanged: _handleToDoChange,
                            clock:
                                "Today At ${selectedTime.hour}:${selectedTime.minute}");
                      },
                    ),
                  ],
                ),
                /* Text(
                "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}",
                style: const TextStyle(
                    color: Colors.white70, fontSize: 16, fontFamily: 'Lato'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${selectedTime.hour} : ${selectedTime.minute}",
                style: const TextStyle(
                    color: Colors.white70, fontSize: 16, fontFamily: 'Lato'),
              ) */
              ],
            ),
          ],
        ),
        const Calendar(),
        const Focuse(),
        const Profile(),
      ].elementAt(currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            backgroundColor: HexColor('#363636'),
            builder: (context) {
              return Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        isFirstTextFieldVisible.value = false;
                        isSecondTextFieldVisible.value = false;
                        isAddTextVisible.value = true;
                        isDescriptionTextVisible.value = true;
                      },
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 250, top: 25),
                                child: Text(
                                  'Add Task',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ValueListenableBuilder<bool>(
                                    valueListenable: isAddTextVisible,
                                    builder: (context, value, child) {
                                      return Visibility(
                                        visible: value,
                                        child: GestureDetector(
                                          onTap: () {
                                            isAddTextVisible.value = false;
                                            isFirstTextFieldVisible.value =
                                                true;
                                            isSecondTextFieldVisible.value =
                                                false;
                                            isDescriptionTextVisible.value =
                                                true; // Bu satır eklendi
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 120),
                                            child: Text(
                                              'Task : ${taskController.text}',
                                              style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: isFirstTextFieldVisible,
                                    builder: (context, value, child) {
                                      return Visibility(
                                        visible: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0),
                                          child: Container(
                                            width: 355,
                                            height: 43,
                                            child: TextField(
                                              controller: taskController,
                                              style: GoogleFonts.lato(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade800),
                                                ),
                                                fillColor: HexColor('#363636'),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText: 'Task',
                                                hintStyle: GoogleFonts.lato(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onChanged: (value) {
                                                print('Text Field : $value');
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: isDescriptionTextVisible,
                                    builder: (context, value, child) {
                                      return Visibility(
                                        visible: value,
                                        child: GestureDetector(
                                          onTap: () {
                                            isDescriptionTextVisible.value =
                                                false;
                                            isSecondTextFieldVisible.value =
                                                true;
                                            isFirstTextFieldVisible.value =
                                                false;
                                            isAddTextVisible.value =
                                                true; // Bu satır eklendi
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Description :  ${descriptionController.text}',
                                              style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: isSecondTextFieldVisible,
                                    builder: (context, value, child) {
                                      return Visibility(
                                        visible: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0),
                                          child: Container(
                                            width: 355,
                                            height: 43,
                                            child: TextField(
                                              controller: descriptionController,
                                              style: GoogleFonts.lato(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade800),
                                                ),
                                                fillColor: HexColor('#363636'),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText: 'Description',
                                                hintStyle: GoogleFonts.lato(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onChanged: (value) {
                                                print('Text Field : $value');
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 19,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 17,
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      final DateTime? dateTime =
                                          await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1800),
                                        lastDate: DateTime(3000),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return Column(
                                            children: [
                                              const Text('Tarih Seç',
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              child!,
                                              ElevatedButton(
                                                onPressed: () async {
                                                  final TimeOfDay? timeOfDay =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  );

                                                  if (timeOfDay != null) {
                                                    // Burada seçilen saat ile istediğiniz işlemleri yapabilirsiniz.
                                                    print(
                                                        'Seçilen Saat: ${timeOfDay.format(context)}');
                                                  }
                                                },
                                                child: const Text('Saat Seç'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (dateTime != null) {
                                        setState(() {
                                          selectedDate = dateTime;
                                          // Seçilen tarih ile istediğiniz işlemleri yapabilirsiniz.
                                          print(
                                              'Seçilen Tarih: ${selectedDate.toLocal()}');
                                        });
                                      }
                                    },
                                    icon: Image.asset('lib/assets/timer.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  /* IconButton(
                                    onPressed: () async {
                                      TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial,
                                      );
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.timer),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ), */
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Card(
                                            margin: const EdgeInsets.only(
                                              bottom: 140,
                                              top: 50,
                                              left: 30,
                                              right: 30,
                                            ),
                                            color: HexColor("#363636"),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Choose Category',
                                                  style: GoogleFonts.lato(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Divider(
                                                        thickness: 1,
                                                        indent: 19,
                                                        endIndent: 19,
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Expanded(
                                                  child: GridView.count(
                                                    crossAxisCount: 3,
                                                    children: <Widget>[
                                                      CategoryItem(
                                                        categoryName: 'Grocery',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/bread.png"),
                                                        color: HexColor(
                                                          "#CCFF80",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Work',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categoryWork.png"),
                                                        color: HexColor(
                                                          "#FF9680",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Sport',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categorySport.png"),
                                                        color: HexColor(
                                                          "#80FFFF",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Design',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categroyDesign.png"),
                                                        color: HexColor(
                                                          "#80FFD9",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName:
                                                            'University',
                                                        categoryIcon:
                                                            Image.asset(
                                                          "lib/assets/categoryKep.png",
                                                        ),
                                                        color: HexColor(
                                                          "#809CFF",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Social',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categorySocial.png"),
                                                        color: HexColor(
                                                          "#FF80EB",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Music',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categoryMusic.png"),
                                                        color: HexColor(
                                                          "#FC80FF",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Health',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categoryHealth.png"),
                                                        color: HexColor(
                                                          "#80FFA3",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Movie',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categoryMovie.png"),
                                                        color: HexColor(
                                                          "#80D1FF",
                                                        ),
                                                      ),
                                                      CategoryItem(
                                                        categoryName: 'Home',
                                                        categoryIcon: Image.asset(
                                                            "lib/assets/categoryHome.png"),
                                                        color: HexColor(
                                                          "#FFCC80",
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                                  MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CategoryScreen(),
                                                          ));
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: Container(
                                                                width: 64,
                                                                height: 64,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color:
                                                                      HexColor(
                                                                    "#80FFD1",
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child: Image.asset(
                                                                            "lib/assets/categoryNew.png"),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Create New',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  style: TextButton.styleFrom(
                                                    fixedSize:
                                                        const Size(289, 48),
                                                    backgroundColor:
                                                        HexColor("#8687E7"),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Add Category',
                                                    style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Image.asset('lib/assets/tag.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Card(
                                            margin: const EdgeInsets.only(
                                                bottom: 330,
                                                top: 50,
                                                left: 30,
                                                right: 30),
                                            color: HexColor("#363636"),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Task Priority',
                                                  style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        indent: 18,
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        endIndent: 18,
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: GridView.count(
                                                    crossAxisCount: 4,
                                                    children: const <Widget>[
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 1,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 2,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 3,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 4,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 5,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 6,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 7,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 8,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 9,
                                                      ),
                                                      Items(
                                                        width: 64,
                                                        height: 64,
                                                        number: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                              fixedSize:
                                                                  const Size(
                                                                      153, 48)),
                                                      child: Text(
                                                        'Cancel',
                                                        style: GoogleFonts.lato(
                                                          color: HexColor(
                                                            "#8687E7",
                                                          ),
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            HexColor("#8687E7"),
                                                        fixedSize:
                                                            const Size(153, 48),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Save',
                                                        style: GoogleFonts.lato(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Image.asset('lib/assets/flag.png'),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        if (taskController.text.isEmpty &&
                                            descriptionController
                                                .text.isEmpty) {
                                          print("object");
                                        } else {
                                          _addToDoItem(taskController.text,
                                              descriptionController.text);
                                        }
                                      },
                                      icon: Image.asset('lib/assets/send.png'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: HexColor('#8687E7'),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _handleToDoChange(UpToDo upToDo) {
    setState(() {
      upToDo.isDone = !upToDo.isDone;
    });
  }

  void _addToDoItem(String upToDo, String upToDoClock) {
    setState(() {
      uptodoList.add(
        UpToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          task: upToDo,
          description: upToDoClock,
        ),
      );
    });
    searchController.clear();
  }
}

// ignore: must_be_immutable
class CenterImage extends StatelessWidget {
  CenterImage({
    super.key,
  });

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 227,
              height: 227,
              margin: const EdgeInsets.only(left: 60, right: 55, top: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/homeScreenImg.png'))),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'What do you want to do today?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Tap + to add your tasks',
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
