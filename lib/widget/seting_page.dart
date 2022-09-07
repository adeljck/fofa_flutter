import 'package:exploitman/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var _proxy = new TextEditingController();
  var _url = new TextEditingController();
  var _email = new TextEditingController();
  var _key = new TextEditingController();
  var _maxsize = new TextEditingController();
  var ProxyTypeSelected = fofa.ProxyType;
  
@override
void initState(){
  super.initState();
  _proxy.text = fofa.Proxy;
  _url.text = fofa.fofa_api;
  _email.text = fofa.fofa_email;
  _key.text=fofa.fofa_api_key;
  _maxsize.text = fofa.max_size;
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[Row(children:[Text("代理状态"),Switch(value: fofa.isProxy, onChanged: (value) {
              fofa.isProxy = !fofa.isProxy;
              setState(() {
                String msg = "";
                if(fofa.isProxy){
                  msg ="代理开启"; 
                }else{
                  msg="代理关闭";
                }
                Tooltip(message: msg,height: 60, verticalOffset: 5,preferBelow: false,);
              });
            })]),Row(children: [Text("代理类型"),Radio(overlayColor: MaterialStateProperty.all(Colors.blue),
                      activeColor: Colors.blue,
                      
                      fillColor: MaterialStateProperty.all(Colors.black),value: "http", 
groupValue: fofa.ProxyType, onChanged: (value) {
  
              setState(() {
                ProxyTypeSelected = "http";
                fofa.ProxyType=ProxyTypeSelected;
              });
            }),Text("http"),Radio(overlayColor: MaterialStateProperty.all(Colors.blue),
                      activeColor: Colors.blue,
                      fillColor: MaterialStateProperty.all(Colors.black),value: "socks", 
groupValue: fofa.ProxyType, onChanged: (value) {
              setState(() {
                ProxyTypeSelected = "socks";
                fofa.ProxyType=ProxyTypeSelected;
              });
            }),Text("socks")]),Row(children: [Text("代理地址"),Container(height: 30,width: 500,child:TextField(
                            decoration:InputDecoration(
                                hintText: "代理地址"
                            ),
                            // 绑定控制器
                            controller: this._proxy,
                            // 输入改变以后的事件
                            onChanged:(value){
                                setState(() {
                                    this._proxy.text = value;
                                    fofa.Proxy = value;
                                });
                            },
                        ))]),Row(children: [Text("API URL"),Container(height: 30,width: 500,child:TextField(
                            decoration:InputDecoration(
                                hintText: "API URL"
                            ),
                            // 绑定控制器
                            controller: _url,
                            // 输入改变以后的事件
                            onChanged:(value){
                                setState(() {
                                    fofa.fofa_api = value;
                                });
                            },
                        ))]),Row(children: [Text("E-Mail"),Container(height: 30,width: 500,child:TextField(
                            decoration:InputDecoration(
                                hintText: "E-mail"
                            ),
                            // 绑定控制器
                            controller: _email,
                            // 输入改变以后的事件
                            onChanged:(value){
                                setState(() {
                                    fofa.fofa_email = value;
                                });
                            },
                        ))]),Row(children:[Text("API KEY"),Container(height: 30,width: 500,child:TextField(
                            decoration:InputDecoration(
                                hintText: "API KEY"
                            ),
                            // 绑定控制器
                            controller: _key,
                            obscureText: true,
                            // 输入改变以后的事件
                            onChanged:(value){
                                setState(() {
                                    fofa.fofa_api_key = value;
                                });
                            },
                        ))]),Row(children:[Text("最大数量"),Container(height: 30,width: 500,child:TextField(
                            decoration:InputDecoration(
                                hintText: "最大数量"
                            ),
                            // 绑定控制器
                            controller: _maxsize,
                            // 输入改变以后的事件
                            onChanged:(value){
                                setState(() {
                                  if(int.parse(value)>10000){
                                    value = "10000";
                                  }
                                    fofa.max_size = value;
                                });
                            },
                        ))]),Row(children:[new MaterialButton(color:Colors.blue,child: new Text('保存'),onPressed: (){
                          Map jsonData = fofa.toJson();
                         var writer = File("config.json").openWrite(encoding:utf8);
      writer.write(jsonEncode(fofa.toJson()));
      writer.close();
                        })])],
          ),
        ),
      ),
    );
  }
}
