
import 'dart:convert';

import 'package:easy_lib/res/utils/urls.dart';
import 'package:easy_lib/src/model/user_model.dart';
import 'package:http/http.dart' as http ;
class UserRepository {
  late User _user ;
  Future<User?> getProfile (String token)async{
    try {
      final response = await http.get(
          Uri.parse("${HOST_URI}user/profile"), headers: {
        "Content-Type": "application/json",
        "x-auth-token": token
      });
      final json = jsonDecode(response.body);
      if(json['status'] == "success"){
        _user= User.fromJson(json['user']);
        return _user;
      }
      else {
        return null ;
      }
    }catch(err){
      print(err);
    }
  }

  User get user => _user ;
}