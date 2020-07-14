import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class User {
  /// The id of the user (this will be auto-generated in Firebase).
  final String id;

  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// The email of the user.
  @JsonKey(nullable: false)
  final String email;

  /// The URL of the profile picture of the user.
  final String profilePicture;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    @required this.email,
    this.profilePicture,
  }) : assert(email != null, 'Email must not be null');

  /// Creates a [User] instance from its JSON representation.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates a JSON representation of this [User].
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Creates a copy of the [User] with the specified fields.
  User copyWith({
    String firstName,
    String lastName,
    String email,
  }) {
    return User(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return '''
User {
  id: $id,
  firstName: $firstName,
  lastName: $lastName,
  email: $email,
}
''';
  }
}
