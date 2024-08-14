import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_01/model/user_location.dart';

import '../model/user.dart';
import '../model/user_dob.dart';
import '../model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final date = e['dob']['date'];
      final dob = UserDob(
        date: DateTime.parse(date),
        age: e['dob']['age'],
      );
      final coordinates = UserCoordinates(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude'],
      );
      final street = UserStreet(
        number:
            e['location']['street']['number']?.toString() ?? 'Unknown Number',
        name: e['location']['street']['name'] ?? 'Unknown Name',
      );
      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        postcode: e['location']['postcode'].toString(),
        country: e['location']['country'],
        coordinates: coordinates,
        street: street,
      );

      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
        coordinates: coordinates,
        street: street,
      );
    }).toList();
    return users;
  }
}
