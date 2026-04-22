import 'package:craftybay/features/product/presentation/provider/product_list_provider.dart';
import 'package:craftybay/features/shared/data/models/category_model.dart';
import 'package:craftybay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  static const String name = '/product-list';
  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListProvider _productListProvider = ProductListProvider();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productListProvider.getProducts(widget.category.id);
      _scrollController.addListener(_loadMore);
    });
  }

  void _loadMore() {
    if (_productListProvider.isLoading) {
      return;
    }
    if (_scrollController.position.extentBefore < 300) {
      _productListProvider.getProducts(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProvider,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.category.title)),
        body: Consumer<ProductListProvider>(
          builder: (context, productListProvider, _) {
            if (productListProvider.getInitialDataInProgress) {
              return CenterProgressIndicator();
            }

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: productListProvider.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(child: ProductCard(
                        productModel: productListProvider.productList[index],
                      ));
                    },
                  ),
                ),
                if(productListProvider.getMoreDataInProgress)
                  LinearProgressIndicator()

              ],
            );
          }
        ),
      ),
    );
  }
}
