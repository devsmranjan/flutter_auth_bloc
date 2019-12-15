import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

// event to notify the bloc that it needs to check if the user is currently authenticated or not.
class AppStarted extends AuthenticationEvent {

  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "AppStarted";
  }

}

// event to notify the bloc that the user has successfully logged in.
class LoggedIn extends AuthenticationEvent {

  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "LoggedIn";
  }
}

// event to notify the bloc that the user has successfully logged out.
class LoggedOut extends AuthenticationEvent {

  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "LoggedOut";
  }
}
