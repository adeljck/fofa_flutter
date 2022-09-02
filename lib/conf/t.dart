import 'dart:convert';

import 'package:exploitman/conf/init.dart';
import "package:yaml/yaml.dart";
import "dart:io";

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
}

void main() {
  var configPath = './config.json';
  CreateConfigFile(configPath);
  var fofaConfig = jsonDecode(File(configPath).readAsStringSync()) as Map;

}

void CreateConfigFile(String configPath) {
  if (!File(configPath).existsSync()) {
    var config = FoFaApi();
    var writer = File(configPath).openWrite();
    print(config);
    writer.write(jsonEncode(config.toJson()));
    writer.close();
  }
  return;
}
