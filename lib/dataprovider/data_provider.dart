import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_3_http_get_request/services/services.dart';

import '../models/user_model.dart';

//future provider is useful if you want to create a asynchronous request
final UserDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(UserProvider).getUsers();
});
