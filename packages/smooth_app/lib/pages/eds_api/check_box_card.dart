
import 'package:flutter/material.dart';

class CheckBoxCard extends StatelessWidget {
  final String title;
  final bool check;
  final Function onChange;
  const CheckBoxCard(this.title, this.check, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Checkbox(
              value: check,
              onChanged: (bool? val) {
                onChange(val);
              },
              activeColor: Colors.blue,
            )
          )
        ],
      ),
    )
  );
  }
}