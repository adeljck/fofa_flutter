import 'package:yaml/yaml.dart';
import 'dart:io';
import 'dart:convert';
import 'package:yaml_writer/yaml_writer.dart';

class FoFaApi {
  String fofa_api_key = "";
  String fofa_email = "";
  int max_size = 100;
  String fofa_api = "https://fofa.info";
  String avatar = "";
  String user_name = "";
  bool isProxy = false;
  String Proxy = "";

  FoFaApi() {
    var configPath = './config.yaml';
    File configFile = File(configPath);
    Map fofaConfig = {};
    bool isExists = configFile.existsSync();
    if (!isExists) {
      var writer = configFile.openWrite();
      writer.write(
          "fofa_email: \nfofa_key: \nmax_size: 100\nproxy: \nisproxy: false");
      writer.close();
      return;
    }
    fofaConfig = loadYaml(configFile.readAsStringSync());
    fofa_api_key = fofaConfig["fofa_key"];
    fofa_email = fofaConfig["fofa_email"];
    Proxy = fofaConfig["proxy"];
    isProxy = fofaConfig["isProxy"];
    if (fofaConfig["max_size"] != null) {
      max_size = fofaConfig["max_size"];
    }
  }
}
