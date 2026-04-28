
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/constants.dart';
import '../../../shared/presentation/widgets/center_progress_indicator.dart';
import '../provider/add_to_cart_provider.dart';

class PriceAndCartSection extends StatelessWidget {
  const PriceAndCartSection({super.key, required this.price, required this.onTapAddToCart});

  final int price;
  final VoidCallback onTapAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(30),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                '${Constants.takaSign}$price',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: Consumer<AddToCartProvider>(
              builder: (context, addToCartProvider, _) {
                if (addToCartProvider.addToCartInProgress) {
                  return CenterProgressIndicator();
                }
                return FilledButton(
                  onPressed: onTapAddToCart,
                  child: Text('Add to Card'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
