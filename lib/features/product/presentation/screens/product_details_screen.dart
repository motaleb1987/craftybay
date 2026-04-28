import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/product/data/model/add_to_cart_params.dart';
import 'package:craftybay/features/product/presentation/widgets/size_picker.dart';
import 'package:craftybay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:craftybay/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/controllers/auth_controller.dart';
import '../../../auth/presentation/screen/sign_in_screen.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';
import '../provider/add_to_cart_provider.dart';
import '../provider/product_details_provider.dart';
import '../widgets/price_and_cart_section.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final AddToCartProvider _addToCartProvider = AddToCartProvider();
  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();



  String? _selectedColor;
  String? _selectedSize;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _productDetailsProvider.getProductDetails(
        widget.productId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => _addToCartProvider),
          ChangeNotifierProvider(create: (_) => _productDetailsProvider),
        ],
        child: Consumer<ProductDetailsProvider>(
          builder: (context, provider, _) {
            if (provider.getProductDetailsInProgress) {
              return CenterProgressIndicator();
            }
            if (provider.errorMessage != null) {
              return Center(child: Text(provider.errorMessage!));
            }

            if (provider.productDetails == null) {
              return Center(child: Text('No Data Found'));
            }

            final details = provider.productDetails!;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageCarousel(images: details.photos),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.productDetails!.title,
                                          style: context.textTheme.bodyLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Row(
                                          spacing: 8,
                                          children: [
                                            const Wrap(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 16,
                                                ),
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                  IncDecButton(
                                    maxValue: details.quantity,
                                    onChange: (int value) {
                                      _quantity = value;
                                    },
                                  ),
                                ],
                              ),

                              ColorPicker(
                                colors: details.colors,
                                onSelected: (String selectedColor) {
                                  _selectedColor = selectedColor;
                                },
                                // initialValue: product.colors.first,
                              ),
                              const SizedBox(height: 12),
                              SizePicker(
                                textTitle: details.title,
                                sizes: details.sizes,
                                onSelected: (String selectedSize) {
                                  _selectedSize = selectedSize;
                                },
                                //  initialValue: product.sizes.first,
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Description',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),
                              Text(
                                textAlign: TextAlign.justify,
                                details.description,
                                style: TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PriceAndCartSection(
                  price: details.currentPrice,
                  onTapAddToCart: _onTapAddToCart,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _onTapAddToCart() async {
    if(await AuthController.isLoggedIn()==false){
      Navigator.pushNamed(context, SignInScreen.name);
      return;
    }


    AddToCartParams params = AddToCartParams(
      productId: widget.productId,
      color: _selectedColor,
      size: _selectedSize,
      quantity: _quantity,
    );
    final bool isSuccess = await _addToCartProvider.addToCart(params);

    if (isSuccess) {
      showSnackBarMessage(context, 'Added to cart');
    }else{
      showSnackBarMessage(context, _addToCartProvider.errorMessage!);
    }

  }
}
