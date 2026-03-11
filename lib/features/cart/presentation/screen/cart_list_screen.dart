import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/asset_paths.dart';
import 'package:craftybay/app/constants.dart';
import 'package:craftybay/features/auth/presentation/providers/main_nav_provider.dart';
import 'package:craftybay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/increment_decrement_button.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        return context.read<MainNavProvider>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading: IconButton(
            onPressed: context.read<MainNavProvider>().backToHome,
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(5),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 0.25,
              child: ListTile(
                leading: Container(
                  width: 80,
                  height: 100,
                  child: Image.asset(AssetPaths.dummyShoePng),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'New Year Special Shoe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.delete_rounded,
                                color: Colors.black38,
                                size: 30,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Color: Red, Size: XL',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          IncrementDecrementBtn(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


