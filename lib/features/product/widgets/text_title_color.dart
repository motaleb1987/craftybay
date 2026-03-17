
import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class TextTitleColor extends StatelessWidget {
  const TextTitleColor({
    super.key, required this.textTitle,
  });

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: context.textTheme.bodyLarge
          ?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }
}