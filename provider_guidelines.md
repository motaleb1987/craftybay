# Provider Guidelines

This document outlines the rules and best practices for creating and maintaining Providers in the CraftyBay project.

## 1. Class Structure
- Every provider should extend `ChangeNotifier`.
- Use private variables for state and public getters to expose them.

## 2. State Management
- Maintain a `_loading` state (e.g., `_getProductDetailsInProgress`) for every asynchronous operation.
- Maintain an `_errorMessage` state to capture and display errors from the network or logic.
- Always call `notifyListeners()` when a state change occurs that should reflect in the UI.

## 3. Network Calls
- Use `getNetworkCaller()` from `set_up_network_client.dart` to make API requests.
- Use the `Urls` class for all endpoint definitions.
- Handle success and failure cases by checking `response.isSuccess`.

## 4. Method Structure
- Return a `Future<bool>` for primary data fetching methods to indicate success or failure to the UI.
- Wrap data parsing in the success block.
- Reset the loading state in a `finally` block or at the end of the method before returning.

## 5. Example Template
```dart
class MyFeatureProvider extends ChangeNotifier {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  MyDataModel? _data;
  MyDataModel? get data => _data;

  Future<bool> fetchData() async {
    bool isSuccess = false;
    _inProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(Urls.myEndpoint);

    if (response.isSuccess) {
      _data = MyDataModel.fromJson(response.body!['data']);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
```

## 6. Registration
- Don't forget to register your new provider in `crafty_bay_app.dart` within the `MultiProvider` widget.
