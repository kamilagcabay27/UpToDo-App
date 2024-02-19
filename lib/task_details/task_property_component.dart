import 'package:flutter/material.dart';

class TaskPropertyComponents extends StatelessWidget {
  final Widget? leadIcon;
  final Text? itemTitle;
  final Widget? lastIcon;
  const TaskPropertyComponents({
    super.key,
    required this.leadIcon,
    required this.itemTitle,
    this.lastIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: ListTile(
        tileColor: Colors.black,
        leading: leadIcon,
        title: itemTitle,
        trailing: lastIcon,
      ),
    );
  }
}
