import 'package:craftybay/features/product/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';

class ProductSlugListProvider extends ChangeNotifier {
   bool _getInitialProductSlugInProgress = false;
   bool get getInitialProductSlugInProgress => _getInitialProductSlugInProgress;

  String? _errorMessage = '';
  String? get errorMessage => _errorMessage;


  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;


  Future<bool> getProductSlugList(String productSlug) async {
    bool isSuccess = false;
    _getInitialProductSlugInProgress = true;
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getProductSlugUrl(productSlug),
    );

    if (response.isSuccess){
      List<ProductModel> products = [];
      for (Map<String, dynamic> category in response.body!['data']){
        products.add(ProductModel.fromJson(category));
      }
      _productModel.addAll(products);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getInitialProductSlugInProgress = false;
    notifyListeners();

    return isSuccess;

  }

}