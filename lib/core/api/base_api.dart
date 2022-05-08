import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';

/// jangan edit di class ini!! note: jika ingin edit mohon diinformasikan
/// variabel yang late wajib isi datanya di constructor class turunan
/// jangan lupa isi function yang di override di class turunan
abstract class BaseApi {
  late final String protocol;
  late final String host;
  late final String basePath;
  late final String appVersion;
  final String _post = "post";
  final String _get = "get";
  final int _timeout = 300;

  Future postNoLoading(
      BuildContext context, String path, Map<String, dynamic> reqBody) async {
    return await _fetch(context, _post, path, reqBody, false, true);
  }

  Future getNoLoading(
      BuildContext context, String path, Map<String, dynamic> reqBody) async {
    return await _fetch(context, _get, path, reqBody, false, true);
  }

  Future post(
      BuildContext context, String path, Map<String, dynamic> reqBody) async {
    return await _fetch(context, _post, path, reqBody, true, true);
  }

  Future postNoCookies(
      BuildContext context, String path, Map<String, dynamic> reqBody) async {
    return await _fetch(context, _post, path, reqBody, true, false);
  }

  Future get(
      BuildContext context, String path, Map<String, dynamic> reqBody) async {
    return await _fetch(context, _get, path, reqBody, true, true);
  }

  Future postNoLoadingNoCookies(
      BuildContext context, String path, Map<String, dynamic> reqBody) async {
    return await _fetch(context, _post, path, reqBody, false, false);
  }

  Future _fetch(BuildContext context, String method, String path,
      Map<String, dynamic>? reqBodyMap, bool loading, bool cookies) async {
    bool _error = false;
    String? deviceid = await PlatformDeviceId.getDeviceId;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceInfoParam = "";
    String deviceBrand = "";
    String deviceType = "";
    String osDevice = "";
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceInfoParam = iosInfo.utsname.machine ?? "";
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      deviceInfoParam = androidInfo.model ?? "";
      deviceBrand = androidInfo.brand ?? "";
      deviceType = androidInfo.device ?? "";
      osDevice = "android";
    }
    if (loading) await showLoading(context);
    http.Response response;
    var strLog = "";
    Map<String, String> headers = {};
    headers['content-type'] = "application/json";
    headers['accept'] = "application/json";
    headers['device_id'] = deviceid ?? '';
    headers['device_info'] = deviceInfoParam;
    headers['phone_brand'] = deviceBrand;
    headers['phone_type'] = deviceType;
    headers['OS'] = osDevice;
    headers['app_version'] = appVersion;

    if (cookies) {
      String _cookie = await getCookie();
      if (_cookie.isNotEmpty) {
        headers['Authorization'] = _cookie;
      }
    }

    var reqBody = json.encode(reqBodyMap);

    final String url = Uri(
            path: basePath + path,
            host: host,
            // port: _port,
            scheme: protocol)
        .toString();
    strLog += "[$method] $url";
    strLog += "\t\n[Request Headers] : \n\t$headers";
    strLog += "\t\n[Request] : \n\t$reqBody";
    if (kDebugMode) {
      log("\n:: PROCESSING ::\n$strLog");
    }
    var start = DateTime.now().millisecondsSinceEpoch;

    try {
      if (method == _post) {
        response = await http
            .post(
          Uri(
              host: host,
              //  port: _port,
              path: basePath + path,
              scheme: protocol),
          headers: headers,
          body: reqBody,
        )
            .timeout(Duration(seconds: _timeout), onTimeout: () {
          _error = true;
          if (loading) Navigator.pop(context);
          showRequestTimeOut(context, _timeout);
          strLog += ("\n:: PROCESS TIME OUT! ::");
          return Future.error((){});
        });
        if (_error) {
          return;
        }
      } else {
        response = await http
            .get(
              Uri(
                  queryParameters: reqBodyMap!
                      .map((key, value) => MapEntry(key, value?.toString())),
                  path: basePath + path,
                  host: host,
                  // port: _port,
                  scheme: protocol),
              headers: headers,
            )
            .timeout(Duration(seconds: _timeout));
      }
      // ignore: unnecessary_null_comparison
      if (response != null) {
        strLog += "\t\n[Response Code] : \n\t${response.statusCode}";
        strLog += "\t\n[Response Raw] : \n\t${response.body.toString()}";
        // _updateCookie(response);
        if (response.statusCode == 200) {
          // ignore: unnecessary_null_comparison
          if (response.body != null) {
            strLog +=
                "\t\n[Response Headers] : \n\t${response.headers.toString()}";
//            log += "\t\n[Response Raw] : \n\t${response.body.toString()}";
            var respDecode = json.decode(response.body);
            strLog += "\t\n[Response Body] : \n\t${response.body.toString()}";
            return respDecode;
          } else {
            _error = true;
            if (loading) Navigator.pop(context);
            showErrorDialog(context, response.statusCode,
                json: jsonDecode(response.body));
          }
        } else if (response.statusCode == 401) {
          _error = true;
          if (loading) Navigator.pop(context);
          // await IConstants().setString(IConstants.authCookies, '');
          var respDecode = json.decode(response.body);
          showErrorDialog(context, response.statusCode, json: respDecode);
          return null;
        } else if (response.statusCode == 403) {
          _error = true;
          if (loading) Navigator.pop(context);
          // await IConstants().setString(IConstants.authCookies, '');
          var respDecode = json.decode(response.body);
          showErrorDialog(context, response.statusCode, json: respDecode);
          return null;
        } else if (response.statusCode == 503) {
          if (loading) Navigator.pop(context);
          _error = true;
          showErrorDialog(context, response.statusCode,
              json: jsonDecode(response.body));
          return null;
        } else if (response.statusCode == 502) {
          _error = true;
          showErrorDialog(context, response.statusCode,
              json: jsonDecode(response.body));
        } else if (response.statusCode == 400) {
          _error = true;
          if (loading) Navigator.pop(context);
          // await IConstants().setString(IConstants.authCookies, '');
          var respDecode = json.decode(response.body);
          showErrorDialog(context, response.statusCode, json: respDecode);
          return null;
        } else {
          _error = true;
          if (loading) Navigator.pop(context);
          showErrorDialog(context, response.statusCode,
              json: jsonDecode(response.body));
          strLog +=
              "\nERROR : ${response.reasonPhrase} (${response.statusCode})";
          return null;
        }
      } else {
        _error = true;
        if (loading) Navigator.pop(context);
        showServerNoResponse(context);
        strLog += "\nERROR : ${response.toString()}";
      }
    } on FormatException catch (_) {
      _error = true;
      if (loading) Navigator.pop(context);
      showFormatException(context);
    } on http.ClientException catch (_) {
      _error = true;
      if (loading) Navigator.pop(context);
    } on HttpException catch (_) {
      _error = true;
      if (loading) Navigator.pop(context);
    } on SocketException catch (_) {
      _error = true;
      if (loading) Navigator.pop(context);
      showSocketException(context);
    } finally {
      if (!_error && loading) Navigator.pop(context);
      var end = DateTime.now().millisecondsSinceEpoch;
      strLog += "\n--> ${end - start}ms";
      if (kDebugMode) {
        log(strLog);
      }
    }
  }

  Future showLoading(BuildContext context);
  Future showErrorDialog(BuildContext context, int statusCode,
      {Map<String, dynamic>? json});
  Future showSessionTimeout(BuildContext context, {Map<String, dynamic>? json});
  Future showRequestTimeOut(BuildContext context, int timeOut);
  Future showServerNoResponse(BuildContext context);
  Future showFormatException(BuildContext context);
  Future showSocketException(BuildContext context);
  Future<String> getCookie();
}
