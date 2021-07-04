import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:flutter_app/model/options.dart';

Future<Options> getOptions() async {
  String url =  'https://run.mocky.io/v3/277209be-c8c7-4359-9147-091e91f2a109';
  log(url);
  Response response = await post(Uri.parse(url));
  log(response.statusCode.toString());
  log(response.body.toString());
  switch (response.statusCode) {
    case 200:
      Options options = Options.fromJson(json.decode(response.body));
      switch (options.code) {
        case 200:
          return options;
          break;
        default:
          //handle error
          return null;
          break;
      }
      break;
    default:
      // handle error
      return null;
      break;
  }
}