import 'package:flutter/material.dart';

class CostumImage extends StatelessWidget {
  final String imagePath;
  double? height;
  double? width;
  CostumImage({super.key, required this.imagePath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: height ?? 80,
        width: width ?? 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
