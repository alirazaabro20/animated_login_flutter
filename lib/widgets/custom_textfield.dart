import 'package:anim_login/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TextFieldWidget extends StatelessWidget {
  final bool isObscure;
  final String hint;
  final IconData icon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;

  const TextFieldWidget(
      {Key? key,
      required this.isObscure,
      required this.hint,
      required this.icon,
      this.suffixIcon,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<LoginModel>(context);
    return TextField(
      obscureText: isObscure,
      onChanged: onChanged,
      cursorColor: Colors.purple.shade200,
      style: TextStyle(color: Colors.purple.shade200, fontSize: 14),
      decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(
            icon,
            size: 18,
            color: Colors.purple.shade200,
          ),
          filled: true,
          suffixIcon: GestureDetector(
            onTap: () {
              _model.isVisible = !_model.isVisble;
            },
            child: Icon(
              suffixIcon,
              size: 18,
              color: Colors.purple.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple.shade200),
          ),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[200],
          focusColor: Colors.purple.shade200,
          labelStyle: TextStyle(color: Colors.purple.shade200)),
    );
  }
}