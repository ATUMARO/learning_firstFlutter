import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projects/API/User.dart';

Future<User> fetchPost() async {
  final response = await http.get('http://35.237.205.38/user/list');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    var responseJson = json.decode(utf8.decode(response.bodyBytes));
    print('${response.body}\n');
    print('$responseJson');
    return User.fromJson(responseJson[0]);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class APIMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: FutureBuilder<User>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('id: ${snapshot.data.id}')),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('name: ${snapshot.data.name}')),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('device_taken: ${snapshot.data.device_token}')),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('token: ${snapshot.data.token}')),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                print('$snapshot\n${snapshot.error}');
                return Center(child: Text("${snapshot.error}"));
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}
