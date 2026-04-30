import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/cart/data/models/cart_model.dart';
import 'package:craftybay/features/cart/presentation/providers/cart_list_provider.dart';
import 'package:craftybay/features/shared/presentation/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(20),
      margin: EdgeInsets.all(0),
      color: Colors.white,
      child: Row(
        spacing: 4,
        children: [
          AppNetworkImage(url: _getImage(cartModel.productModel.images), width: 100, height: 100, fit: BoxFit.scaleDown ,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartModel.productModel.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Color: ${cartModel.color ?? 'N/A'} Size: ${cartModel.size ?? 'N/A'} ',
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Home work => delete from api and update into provider
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[200],
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${Constants.takaSign}${cartModel.productModel.currentPrice}',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IncDecButton(
                        initialValue: 1,
                        maxValue: 5,
                        onChange: (int value) {
                          context
                              .read<CartListProvider>()
                              .updateCartItemQuantity(cartModel.id, value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  String _getImage(List<String> urls){
    return urls.isNotEmpty ? urls.first : '';
  }
}
