abstract class Person {
  final String _id;
  final String _firstName;
  final String _lastName;
  final String _email;
  final String _avatar;

  Person(
      {required String id,
      required String firstName,
      required String lastName,
      required String email,
      required String avatar})
      : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _avatar = avatar;

  @override
  String toString() {
    return 'Person: $_id, first name: $_firstName, last name: $_lastName, email: $_email, avatar link: $_avatar';
  }
}
