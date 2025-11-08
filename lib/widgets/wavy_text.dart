import 'package:flutter/material.dart';

class WavyText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const WavyText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(text.length, (i) {
        return Transform.translate(
          offset: Offset(0, (i.isEven ? -2 : 2).toDouble()),
          child: Text(
            text[i],
            style: style,
          ),
        );
      }),
    );
  }
}
