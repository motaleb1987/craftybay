import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/product_card.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index)=> ProductCard(),
        separatorBuilder: (context, index) => SizedBox(width: 8,),

      ),
    );
  }
}