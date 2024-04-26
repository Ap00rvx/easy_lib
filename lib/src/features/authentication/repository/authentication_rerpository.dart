import 'dart:convert';

import 'package:easy_lib/res/utils/urls.dart';
import 'package:http/http.dart' as http;
class AuthenticationRepository {
  Future<Map<dynamic,dynamic>> login(String uid,String password )async {
    final body  = {"uniqueId":uid,"password":password};
    try {
      final response = await http.post(Uri.parse("${HOST_URI}user/login"),headers:
      {"Content-Type": "application/json"},body: jsonEncode(body));
      if(response.statusCode == 200){

        final jsonResponse = jsonDecode(response.body) as Map;
        final status = jsonResponse['status'];
        if(status == "success"){
          return jsonResponse;
        }
        else{
          return jsonResponse;
        }
      }
      else{
        return jsonDecode(response.body);
      }
    }catch(err){
      print(err);
      return {};
    }
  }
}