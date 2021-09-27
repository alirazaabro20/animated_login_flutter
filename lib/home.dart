import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var value = 0.0;

  late Animation<double> _myAnimation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    resizeWidget();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _myAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  resizeWidget() async {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        value = 10;
      });
    });
  }

  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(
              curve: Curves.linear,
              size: 90,
          
            ),
            GestureDetector(
              onTap: () {
                if (_flag) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }

                _flag = !_flag;
              },
              child: AnimatedIcon(
                progress: _myAnimation,
                icon: AnimatedIcons.list_view,
                size: 90,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: const Text('Animate'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
