import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_3_http_get_request/dataprovider/data_provider.dart';
import 'package:riverpod_3_http_get_request/models/user_model.dart';
import 'package:riverpod_3_http_get_request/screens/detail_screens.dart';

class MyHomepage extends ConsumerWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(UserDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod"),
      ),
      body: _data
          .
          //they come from Riverpod FutureProvider _data object
          when(
              data: (_data) {
                List<UserModel> userList = _data.map((e) => e).toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(e: userList[index]),
                              )),
                              child: Card(
                                color: Colors.blue,
                                elevation: 4,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstname,
                                    style: const TextStyle(color: Colors.white),
                                  ), // TextStyle, Text subtitle: Text (userList[index].lastname, style: const TextStyle(
                                  subtitle: Text(
                                    userList[index].lastname,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userList[index].avatar),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  )),
    );
  }
}
