import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/category_screen/category_screen.dart';
import 'package:uptodo_app/components/category_item.dart';
import 'package:uptodo_app/components/items.dart';
import 'package:uptodo_app/index_screen/home_screen.dart';
import 'package:uptodo_app/task_details/task_components.dart';
import 'package:uptodo_app/task_details/task_property_component.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  ValueNotifier<bool> isFirstTextFieldVisible = ValueNotifier<bool>(false);
  ValueNotifier<bool> isSecondTextFieldVisible = ValueNotifier<bool>(false);
  ValueNotifier<bool> isAddTextVisible = ValueNotifier<bool>(true);
  ValueNotifier<bool> isDescriptionTextVisible = ValueNotifier<bool>(true);
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.5,
              ),
              IconButton(
                icon: Image.asset("lib/assets/repeatIcon.png"),
                onPressed: () {
                  // Sağ taraftaki yeni ikon için bir işlem yapabilirsiniz
                },
              ),
            ],
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.close_rounded)),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          TaskComponent(
            title: Text(
              taskController.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            firstIcon: Image.asset("lib/assets/taskCircle.png"),
            secondIcon: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Card(
                        margin: const EdgeInsets.only(
                          bottom: 330,
                          top: 210,
                          left: 40,
                          right: 40,
                        ),
                        color: HexColor("#363636"),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            isFirstTextFieldVisible.value = false;
                            isSecondTextFieldVisible.value = false;
                            isAddTextVisible.value = true;
                            isDescriptionTextVisible.value = true;
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Edit Task Title',
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
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
                                height: 13,
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
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: TextButton.styleFrom(
                                        fixedSize: const Size(153, 48)),
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.lato(
                                        color: HexColor(
                                          "#8687E7",
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor("#8687E7"),
                                      fixedSize: const Size(153, 48),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      'Edit',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset("lib/assets/taskEdit.png")),
            subtitle: Text(
              descriptionController.text,
              style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TaskPropertyComponents(
            leadIcon: Image.asset("lib/assets/taskTimer.png"),
            itemTitle: Text(
              'Task Time:',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            lastIcon: GestureDetector(
              onTap: () async {
                TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                );
                if (timeOfDay != null) {
                  setState(() {
                    selectedTime = timeOfDay;
                  });
                }
              },
              child: Container(
                width: 108,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Today At ${selectedTime.hour}:${selectedTime.minute}',
                    style: GoogleFonts.lato(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TaskPropertyComponents(
            leadIcon: Image.asset("lib/assets/taskTag.png"),
            itemTitle: Text(
              'Task Category:',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            lastIcon: GestureDetector(
              onTap: () {
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
                                  categoryIcon:
                                      Image.asset("lib/assets/bread.png"),
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
                                  categoryName: 'University',
                                  categoryIcon: Image.asset(
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
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(),
                                    ));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: HexColor(
                                              "#80FFD1",
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                        style: GoogleFonts.lato(
                                            color: Colors.white, fontSize: 16),
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
                              fixedSize: const Size(289, 48),
                              backgroundColor: HexColor("#8687E7"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              'Add Category',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
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
              child: Container(
                width: 118,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("lib/assets/taskKep.png"),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'University',
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TaskPropertyComponents(
            leadIcon: Image.asset("lib/assets/taskFlag.png"),
            itemTitle: Text(
              'Task Priority:',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            lastIcon: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Card(
                      margin: const EdgeInsets.only(
                          bottom: 330, top: 50, left: 30, right: 30),
                      color: HexColor("#363636"),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Edit Task Priority',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
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
                              children: <Widget>[
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 1,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 2,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 3,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 4,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 5,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 6,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 7,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 8,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 9,
                                ),
                                const Items(
                                  width: 64,
                                  height: 64,
                                  number: 10,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                    fixedSize: const Size(153, 48)),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.lato(
                                    color: HexColor(
                                      "#8687E7",
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: HexColor("#8687E7"),
                                  fixedSize: const Size(153, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
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
              child: Container(
                width: 70,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Default',
                    style: GoogleFonts.lato(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TaskPropertyComponents(
            leadIcon: Image.asset("lib/assets/taskHierarchy.png"),
            itemTitle: Text(
              'Sub - Task',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            lastIcon: Container(
              width: 104,
              height: 37,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'Add Sub - Task',
                  style: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 298, horizontal: 20),
                    color: HexColor("#363636"),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Delete Task',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                indent: 12,
                                color: Colors.grey[400],
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                endIndent: 12,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Are You sure you want to delete this task? \n Task Title: ${taskController.text}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                  fixedSize: const Size(153, 48)),
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.lato(
                                  color: HexColor(
                                    "#8687E7",
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: HexColor("#8687E7"),
                                fixedSize: const Size(153, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Delete',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: TaskPropertyComponents(
              leadIcon: Image.asset("lib/assets/taskTrash.png"),
              itemTitle: Text(
                'Delete Task',
                style: GoogleFonts.lato(
                    color: HexColor("#FF4949"),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
