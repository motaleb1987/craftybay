import 'package:flutter/cupertino.dart';

import '../../../app/set_up_network_client.dart';
import '../../../app/urls.dart';
import '../../../core/network_caller/network_caller.dart';
import '../data/models/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pageCount = 30;
  int _currentPage = 0;
  int? _lastPage;

  bool isSuccess = false;

  // Initial Loading
  bool _getInitialDataInProgress = false;
  bool _getMoreDataInProgress = false;

  // More data loading
  List<CategoryModel> _categoryList = [];

  bool get getInitialDataInProgress => _getInitialDataInProgress;
  bool get getMoreDataInProgress => _getMoreDataInProgress;

  List<CategoryModel> get categoryList => _categoryList;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    if (_lastPage != null && _currentPage >= _lastPage!) {
      return false;
    }

    _currentPage++;

    if (isInitialLoading) {
      _getInitialDataInProgress = true;
    } else {
      _getMoreDataInProgress = true;
    }
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getCategoriesUrl(_pageCount, _currentPage),
    );

    if (response.isSuccess) {
      List<CategoryModel> categories = [];
      for (Map<String, dynamic> category in response.body!['data']['results']) {
        categories.add(CategoryModel.fromJson(category));
      }
      _categoryList.addAll(categories);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    // if isInitialLoading is false
    if (isInitialLoading) {
      _getInitialDataInProgress = false;
    } else {
      _getMoreDataInProgress = false;
    }
    notifyListeners();

    return isSuccess;
  }

  bool get isInitialLoading => _currentPage == 1;

  bool get isLoading => _getMoreDataInProgress || _getMoreDataInProgress;
}
