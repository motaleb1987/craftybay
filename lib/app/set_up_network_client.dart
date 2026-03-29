
// Best practice => Service Locator/Dependency Injection Manager

import '../core/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
      headers: () =>{},
      onUnauthorize: () {
        // Logout from app
        // Clear user Data
        // Redirect to the sign in ui
      }
  );
}


// Uses => getNetworkCaller.getRequest/postRequest.....