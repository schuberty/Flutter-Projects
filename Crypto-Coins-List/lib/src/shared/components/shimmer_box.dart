import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const ShimmerBox({
    required this.height,
    required this.width,
    this.color = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
