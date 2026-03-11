import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/product/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Electronics');
      },
      child: Column(
          spacing: 4,
          children: [
            Card(
              color: AppColors.themeColor.withAlpha(20),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.laptop, size: 48, color: AppColors.themeColor,),
              ),
            ),
            Text(getTitle('Electronics, Computer Others product'), style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w600
            ),),
          ]
      ),
    );
  }

  String getTitle(String title) {
    if (title.length > 10) {
      return title.substring(0, 10) + '...';
    }
    return title;
  }

}