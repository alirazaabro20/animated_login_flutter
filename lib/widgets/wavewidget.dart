import 'package:flutter/material.dart';
import 'dart:math' as mth;

import 'clipper_wg.dart';


class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;

  const WaveWidget(
      {Key? key,
      required this.size,
      required this.yOffset,
      required this.color})
      : super(key: key);

  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        wavePoints.clear();

        final double waveSpeed = animationController.value * 10;
        final double fullSphere = animationController.value * mth.pi * 2;
        final double normalizer = mth.cos(fullSphere);
        final double waveWidth = mth.pi / 270;
        const double waveHeight = 20.0;

        for (int i = 0; i <= widget.size.width.toInt(); ++i) {
          double calc = mth.sin((waveSpeed - i) * waveWidth);

          wavePoints.add(Offset(
              i.toDouble(), calc * waveHeight * normalizer + widget.yOffset));
        }
      });

    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(waveList: wavePoints),
          child: Container(
            height: widget.size.height,
            width: widget.size.width,
            color: widget.color,
          ),
        );
      },
    );
  }
}