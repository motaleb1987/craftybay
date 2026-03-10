import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            'See All',
            style: TextStyle(color: AppColors.themeColor),
          ),
        ),
      ],
    );
  }
}