import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
}

class EmailChanged extends ResetPasswordEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';

}

class Submitted extends ResetPasswordEvent {
  final String email;

  Submitted({@required this.email});


  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'Submitted { email: $email }';
  }

}
