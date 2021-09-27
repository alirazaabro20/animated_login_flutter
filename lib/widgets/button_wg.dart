import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final bool hasBorder;
  final Function? onPressed;
  final String label;

  const ButtonWidget({
    Key? key,
    required this.hasBorder,
    this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Center(
          child: Text(label,
              style: TextStyle(
                  color: hasBorder ? Colors.purple.shade200 : Colors.white))),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: hasBorder ? Colors.white : Colors.purple.shade200,
          border: hasBorder
              ? Border.all(color: Colors.purple.shade200)
              : Border.all(color: Colors.white)),
    );
  }
}
