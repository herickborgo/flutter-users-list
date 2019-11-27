import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:my_first_app/models/User.dart';

class UserService {
  Future<List<User>> fetchAll() async {
    var url = "http://5ddde1e3fca1110014f15e00.mockapi.io/api/v1/users";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<User> userList = [];
      jsonResponse.forEach((item) {
        userList.add(_convertToUser(item));
      });
      return Future.value(userList);
    }
    return Future.error(
        Exception("Request failed with status: ${response.statusCode}."));
  }

  User _convertToUser(Map<String, dynamic> jsonUser) {
    return User(jsonUser['id'], jsonUser['name'], jsonUser['email'], jsonUser['avatar']);
  }
}
