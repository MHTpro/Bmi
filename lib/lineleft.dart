import 'package:flutter/material.dart';

Widget createLineLeft({required double w}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        height: 40,
        width: w,
        decoration: BoxDecoration(
          color: Colors.purpleAccent.shade400,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      const SizedBox(
        height: 70,
      ),
    ],
  );
}
