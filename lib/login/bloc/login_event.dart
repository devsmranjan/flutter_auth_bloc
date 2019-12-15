import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

// notifies the bloc that the user has changed the email
class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

// notifies the bloc that the user has changed the password
class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

// notifies the bloc that the user has submitted the form
class Submitted extends LoginEvent {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

// notifies the bloc that the user has pressed the Google Sign In button
class LoginWithGooglePressed extends LoginEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginWithGooglePressed';
}

// notifies the bloc that the user has pressed the regular sign in button.
class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}
