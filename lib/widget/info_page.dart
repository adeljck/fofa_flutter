import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
import "package:exploitman/conf/init.dart";

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _CreateAvatar();
}

class _CreateAvatar extends State<Avatar> {
  var avatar = "";
  void _loadAvatar() {
    setState(() async {
      final url = Uri.parse(
          "${fofa.fofa_api}/api/v1/info/my?email=${fofa.fofa_email}&key=${fofa.fofa_api_key}");
      final response = await http.get(url);
      Map data = jsonDecode(response.body);
      if (data["error"] == "false") {
        avatar = data["avatar"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
              "email: ${fofa.fofa_email}\napi_key: ${fofa.fofa_api_key}\nmax_size: ${fofa.max_size}\navatar:${this.avatar}"),
        ],
      ),
    );
  }
}
