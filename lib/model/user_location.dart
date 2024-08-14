class UserLocation {
  final String city;
  final String state;
  final String postcode;
  final String country;
  final UserCoordinates coordinates;
  final UserStreet street;

  UserLocation({
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.coordinates,
    required this.street,
  });
}

class UserCoordinates {
  final String latitude;
  final String longitude;

  UserCoordinates({
    required this.latitude,
    required this.longitude,
  });
}

class UserStreet {
  final String number;
  final String name;

  UserStreet({
    required this.number,
    required this.name,
  });
}
