
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/presentation/provider/product_slug_list_provider.dart';
import '../../../shared/presentation/widgets/center_progress_indicator.dart';
import '../../../shared/presentation/widgets/product_card.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 230,
      child: Consumer<ProductSlugListProvider>(
        builder: (context, productSlugListProvider, _) {
          if(productSlugListProvider.getInitialProductSlugInProgress){
            return CenterProgressIndicator();
          }

          if(productSlugListProvider.productModel.isEmpty){
            return Center(child: Text(productSlugListProvider.errorMessage ?? ''),);
          }

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index)=> ProductCard(
              productModel: productSlugListProvider.productModel[index],
            ),
            //itemBuilder: (context, index)=> SizedBox(),
            separatorBuilder: (context, index) => SizedBox(width: 8,),

          );
        }
      ),
    );
  }
}