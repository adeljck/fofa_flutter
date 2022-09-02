import 'dart:convert';

import 'package:yaml/yaml.dart';
import 'dart:io';

class FoFaApi {
  String fofa_api_key = "";
  String fofa_email = "";
  int max_size = 100;
  String fofa_api = "https://fofa.info";
  bool isProxy = false;
  String Proxy = "";
  Map toJson() {
    Map map = new Map();
    map["fofa_email"] = this.fofa_email;
    map["fofa_api_key"] = this.fofa_api_key;
    map["fofa_api"] = this.fofa_api;
    map["max_size"] = this.max_size;
    map["isProxy"] = this.isProxy;
    map["Proxy"] = this.Proxy;
    return map;
  }

  void _CreateConfigFile(String configPath){
    if (!File(configPath).existsSync()) {
      var writer = File(configPath).openWrite(encoding:utf8);
      writer.write(jsonEncode(this.toJson()));
      writer.close();
    }
    return;
  }

  FoFaApi() {
    var configPath = './config.json';
    _CreateConfigFile(configPath);
    var fofaConfig = jsonDecode(File(configPath).readAsStringSync()) as Map;
    fofa_api_key = fofaConfig["fofa_api_key"];
    fofa_email = fofaConfig["fofa_email"];
    Proxy = fofaConfig["Proxy"];
    isProxy = fofaConfig["isProxy"];
    if (fofaConfig["max_size"] != null) {
      max_size = fofaConfig["max_size"];
    }
  }
}
