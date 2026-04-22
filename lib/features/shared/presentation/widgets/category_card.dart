import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/product/presentation/screens/product_list_screen.dart';
import 'package:craftybay/features/shared/data/models/category_model.dart';
import 'package:craftybay/features/shared/presentation/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: categoryModel.title);
      },
      child: Column(
          spacing: 4,
          children: [
            Card(
              color: AppColors.themeColor.withAlpha(20),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppNetworkImage(url: categoryModel.icon, height: 48, width: 48,),
              ),
            ),
            Text(getTitle(categoryModel.title), style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w600
            ),),
          ]
      ),
    );
  }

  String getTitle(String title) {
    if (title.length > 9) {
      return title.substring(0, 7) + '...';
    }
    return title;
  }

}