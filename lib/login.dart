import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as mth;

import 'login_model.dart';
import 'widgets/button_wg.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/wavewidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<LoginModel>(context);
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: Colors.purple.shade200,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 4),
            child: Container(
              alignment: Alignment.topCenter,
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
          ),
          keyboardOpen
              ? Positioned(
                  top: size.height / 6,
                  child: Container(
                    height: 40,
                    width: size.width,
                    alignment: Alignment.topCenter,
                    child: AnimatedDefaultTextStyle(
                        child: const Text('Login'),
                        curve: Curves.linearToEaseOut,
                        style: TextStyle(
                            color: Colors.purple.shade200,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        duration: const Duration(milliseconds: 500)),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                  hint: 'Email',
                  onChanged: model.validateEmail,
                  icon: Icons.email,
                  isObscure: false,
                  suffixIcon: model.isValid ? Icons.check : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hint: 'Password',
                  icon: Icons.lock,
                  isObscure: model.isVisble,
                  suffixIcon:
                      model.isVisble ? Icons.visibility : Icons.visibility_off,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?')),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  label: 'Login',
                  hasBorder: false,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  label: 'Sign Up',
                  hasBorder: true,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}





