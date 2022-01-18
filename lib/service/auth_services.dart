import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loyalty_project/models/user_model.dart';


class AuthService {
  String baseUrl = 'http://192.168.1.5:8000/api/customer';
  //String baseUrl = 'http://192.168.3.1/api/customer';
  //String baseUrl = 'http://172.18.112.80:8000/api/customer';

  Future<UserModel> register({
    int id,
    String firstName,
    String lastName,
    String birthDate,
    String phone,
    String gender,
    String plainPassword,
    bool agreement1,
    String profilePhotoUrl,
    String token,
    String name,
    String username,
    String email,
    String password,
  }) async {
    var url = '$baseUrl/self_register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate,
      'phone': phone,
      'gender': gender,
      'plainPassword': plainPassword,
      'agreement1': agreement1,
      'email': email,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      data = (data['user']);
      //user.token = 'Bearer ' + data['access_token'];
      //print(data);
      return data;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<String> login({
    String username,
    String password,
  }) async {
    var url = '$baseUrl/login_check';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      '_username': username,
      '_password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['token'];

      data = 'Bearer ' + data;
      print(data);

      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
