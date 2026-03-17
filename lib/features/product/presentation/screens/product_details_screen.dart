import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';
import '../../widgets/price_and_cart_section.dart';
import '../../widgets/product_image_carousel.dart';
import '../../widgets/text_title_color.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lotto New Shoe DF336K 2026 Edition',
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Text('4.5'),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Review'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: AppColors.themeColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextTitleColor(textTitle: 'Color',),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      //color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                        color: Colors.orange.shade300,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(child: Text('BK', style: TextStyle(
                                        fontSize: 10
                                    ),)),
                                  )
                                ],
                              ),
                            ),
                            IncDecButton(onChange: (int value) {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PriceAndCartSection(),
        ],
      ),
    );
  }
}


