import 'package:craftybay/app/asset_paths.dart';
import 'package:craftybay/features/auth/presentation/providers/main_nav_provider.dart';
import 'package:craftybay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          itemCount: 4,
            itemBuilder: (context, index){
              return ListTile(
                leading: Container(
                  width: 80,
                  height: 100,
                  child: Image.asset(AssetPaths.dummyShoePng),
                ),
                title: Text('Nike A34RF - New edition 2026 Alpha'),
              );
            }
        ),
      ),
    );
  }
}
