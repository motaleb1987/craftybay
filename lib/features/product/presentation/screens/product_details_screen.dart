import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/product/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';
import '../widgets/price_and_cart_section.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/color_picker.dart';

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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/customer-review',
                                          );
                                        },
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
                                ],
                              ),
                            ),
                            IncDecButton(onChange: (int value) {}),
                          ],
                        ),

                        ColorPicker(
                          textTitle: 'Color',
                          colors: ['red', 'blue', 'green'],
                          onSelected: (String selectedColor) {},
                          initialValue: 'blue',
                        ),
                        const SizedBox(height: 12),
                        SizePicker(
                          textTitle: 'Size',
                          sizes: ['S', 'M', 'L', 'XL'],
                          onSelected: (String selectedSize) {},
                          initialValue: 'M',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Description',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          textAlign: TextAlign.justify,
                          '''Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. It usually begins with:
                          “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”
                          ''',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
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
