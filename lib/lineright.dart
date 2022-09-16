import 'package:flutter/material.dart';

Widget createLineRight({required double w}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Container(
        height: 40,
        width: w,
        decoration: BoxDecoration(
          color: Colors.purpleAccent.shade400,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
      const SizedBox(
        height: 70,
      ),
    ],
  );
}
