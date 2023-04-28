import 'dart:convert';
import 'package:attendance/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      print("400");
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 401:
      print("401");
      showSnackBar(context, "You are uauthorized");
      break;  
    case 500:
      print("500");
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}