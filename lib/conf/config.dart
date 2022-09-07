import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class FoFaApi {
  String fofa_api_key = "";
  String fofa_email = "";
  String max_size = "100";
  String fofa_api = "https://fofa.info";
  bool isProxy = false;
  String Proxy = "";
  String ProxyType="http";
  bool isCorrect = false;
  Map toJson() {
    Map map = new Map();
    map["fofa_email"] = this.fofa_email;
    map["fofa_api_key"] = this.fofa_api_key;
    map["fofa_api"] = this.fofa_api;
    map["max_size"] = this.max_size;
    map["isProxy"] = this.isProxy;
    map["Proxy"] = this.Proxy;
    map["ProxyType"] = this.ProxyType;
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
  checkApi()async{
      var url = Uri.https("fofa.info","/api/v1/info/my",{"email":fofa_email,"key":fofa_api_key});
      var response =  await http.get(url);
      if(response.statusCode==200 && jsonDecode(response.body)["error"]!=false){
          isCorrect = true;
          return [true,jsonDecode(response.body)];
      }
      return [false];
  }
  getAccountinfo(){
      List check = checkApi();
      if (check[0]){
          return check[1];
      }else{
        return {};
      }
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
