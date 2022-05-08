import 'package:flutter/material.dart';

enum RouteType { push, pushReplace, pushRemove }
///default navigator adalah pushNamed silahkan isi RouteType susuai
///dengan yang diinginkan
Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required String routeName,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
      result: ModalRoute.of(context)?.currentResult
    );
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  return Navigator.pushNamed(context, routeName, arguments: arguments);
}

///default navigator adalah push silahkan isi RouteType susuai
///dengan yang diinginkan
Future goTo(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          settings:
              RouteSettings(name: "/${page.toString()}", arguments: arguments),
        ),
        result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
        settings:
            RouteSettings(name: "/${page.toString()}", arguments: arguments),
      ),
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      settings:
          RouteSettings(name: "/${page.toString()}", arguments: arguments),
    ),
  );
}
