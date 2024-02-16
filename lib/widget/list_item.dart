import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uptodo_app/model/task_model.dart';
import 'package:uptodo_app/task_details/task_detail.dart';

class UpToDoItem extends StatelessWidget {
  final UpToDo uptodo;
  final onUpToDoChanged;
  final onDeleteItem;
  final String? clock;

  const UpToDoItem(
      {super.key,
      required this.uptodo,
      this.onUpToDoChanged,
      this.onDeleteItem,
      this.clock});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 22, right: 22),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        onTap: () {
          //print('Clicked on Todo Item');
          onUpToDoChanged(uptodo);
        },
        onLongPress: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TaskDetail(),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        tileColor: HexColor("#363636"),
        leading: Icon(
          uptodo.isDone ? Icons.check_circle : Icons.check_circle_outline,
          color: uptodo.isDone ? Colors.grey : Colors.grey,
        ),
        title: Text(
          uptodo.task!,
          style: TextStyle(
            fontSize: 16,
            color: uptodo.isDone ? Colors.grey : Colors.white,
            decoration: uptodo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        // trailing:
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              clock!,
              style: TextStyle(color: HexColor("#AFAFAF"), fontSize: 13),
            ),
            const SizedBox(
              width: 60,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 87,
                height: 29,
                decoration: BoxDecoration(
                    color: HexColor("#8687E7"),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 13,
                        height: 13,
                        child: Image.asset("lib/assets/kep.png")),
                    SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'University',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            /* TextButton.icon(
              onPressed: () {},
              icon: Container(
                  width: 14,
                  height: 14,
                  child: Image.asset("lib/assets/kep.png")),
              label: const Text(
                'University',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
              style: TextButton.styleFrom(
                  fixedSize: Size(96, 29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: HexColor("#809CFF")),
            ), */
            SizedBox(
              width: 12,
            ),
            /* TextButton.icon(
              onPressed: () {},
              label: Text(
                '${uptodo.id}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              icon: Container(
                  width: 14,
                  height: 14,
                  child: Image.asset("lib/assets/flag.png")),
              style: TextButton.styleFrom(
                fixedSize: Size(22, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(color: HexColor("#8687E7"), width: 1.0),
                ),
              ),
            ), */
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 42,
                height: 29,
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#8687E7")),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 14,
                        height: 14,
                        child: Image.asset("lib/assets/flag.png")),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${uptodo.id}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
