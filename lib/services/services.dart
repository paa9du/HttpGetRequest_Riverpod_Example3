import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class ApiServices {
  String endpoint = 'https://reqres.in/api/users?page=2';
  //create a method getUsers

  //load data from the server
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//provider is the entry point of shared data.
//ref is more like a context.to maintain our state

final UserProvider = Provider<ApiServices>((ref) => ApiServices());
