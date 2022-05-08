import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IRouteObserver extends NavigatorObserver {

  @override
  void didPush(Route route, Route? previousRoute) {
    if (kDebugMode) {
      log("\nRoute Name: ${route.settings.name} - push\n");
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (kDebugMode) {
      log("\nRoute Name: ${route.settings.name} - remove\n");
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (kDebugMode) {
      if (newRoute != null) {
        log("\nRoute Name: ${newRoute.settings.name} - replace\n");
      }
    }
  }

}