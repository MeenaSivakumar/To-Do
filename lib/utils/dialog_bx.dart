import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBx extends StatelessWidget {
  final controller;
  VoidCallback onSve;
  VoidCallback onCancel;
  DialogBx(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSve});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New  A Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'save', onPressed:onSve),
                const SizedBox(
                  width: 5,
                ),
                MyButton(text: 'cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
