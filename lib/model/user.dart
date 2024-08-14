import 'package:rest_api_01/model/user_dob.dart';
import 'package:rest_api_01/model/user_location.dart';
import 'package:rest_api_01/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserCoordinates coordinates;
  final UserStreet street;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.coordinates,
    required this.street,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
