import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ApiHelper {

  bool shouldPrintLog = true;
  bool isLocalTest = false;

  Future<http.Response> get(String url, String sid, {String apiKey}) {

    Future<http.Response> response;
    Map<String, String> headers;
    if (apiKey == null) {
      headers = {
        "Content-Type": "application/json",
        "X-SID": sid
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        "X-API-KEY": apiKey
      };
    }

    if (isLocalTest) {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      IOClient ioClient = new IOClient(httpClient);
      response = ioClient.get(url, headers: headers);
    }else{
      response = http.get(url, headers: headers);
    }

    response.then((response) {
      if (shouldPrintLog) {
        print('========== Http log start ==========');
        print('Http method: Get');
        print('Url: $url');
        print('Header: $headers');
        print('Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        print('Reason phrase: ${response.reasonPhrase}');
        print('========== Http log end ==========');
      }
    });
    return response;
  }

  Future<http.Response> delete(String url, String sid, {String apiKey}) {

    Future<http.Response> response;

    Map<String, String> headers;
    if (apiKey == null) {
      headers = {
        "Content-Type": "application/json",
        "X-SID": sid
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        "X-API-KEY": apiKey
      };
    }

    if (isLocalTest) {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      IOClient ioClient = new IOClient(httpClient);
      response = ioClient.delete(url, headers: headers);
    }else{
      response = http.delete(url, headers: headers);
    }

    response.then((response) {
      if (shouldPrintLog) {
        print('========== Http log start ==========');
        print('Http method: Delete');
        print('Url: $url');
        print('Header: $headers');
        print('Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        print('Reason phrase: ${response.reasonPhrase}');
        print('========== Http log end ==========');
      }

    });
    return response;
  }

  Future<http.Response> post(dynamic url, String sid, String body, {String apiKey}) {

    Future<http.Response> response;

    Map<String, String> headers;
    if (apiKey == null) {
      headers = {
        "Content-Type": "application/json",
        "X-SID": sid
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        "X-API-KEY": apiKey
      };
    }

    if (isLocalTest) {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      IOClient ioClient = new IOClient(httpClient);

      response = ioClient.post(url, headers: headers, body: body);
    }else{
      response = http.post(url, headers: headers, body: body);
    }

    response.then((response) {
      if (shouldPrintLog) {
        print('========== Http log start ==========');
        print('Http method: Post');
        print('Url: $url');
        print('Header: $headers');
        print('Request body: $body');
        print('Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        print('Reason phrase: ${response.reasonPhrase}');
        print('========== Http log end ==========');
      }

    });
    return response;
  }

  Future<http.Response> put(dynamic url, String sid, String body, {String apiKey}) {

    Future<http.Response> response;

    Map<String, String> headers;
    if (apiKey == null) {
      headers = {
        "Content-Type": "application/json",
        "X-SID": sid
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        "X-API-KEY": apiKey
      };
    }

    if (isLocalTest) {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      IOClient ioClient = new IOClient(httpClient);

      response = ioClient.put(url, headers: headers, body: body);
    }else{
      response = http.put(url, headers: headers, body: body);
    }

    response.then((response) {
      if (shouldPrintLog) {
        print('========== Http log start ==========');
        print('Http method: Put');
        print('Url: $url');
        print('Header: $headers');
        print('Request body: $body');
        print('Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        print('Reason phrase: ${response.reasonPhrase}');
        print('========== Http log end ==========');
      }

    });
    return response;
  }
}
