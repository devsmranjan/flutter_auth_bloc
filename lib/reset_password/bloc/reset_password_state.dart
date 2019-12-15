import 'package:meta/meta.dart';

class ResetPasswordState {
  final bool isEmailValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid;

  ResetPasswordState({
    @required this.isEmailValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory ResetPasswordState.empty() {
    return ResetPasswordState(
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory ResetPasswordState.loading() {
    return ResetPasswordState(
      isEmailValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory ResetPasswordState.failure() {
    return ResetPasswordState(
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory ResetPasswordState.success() {
    return ResetPasswordState(
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

   ResetPasswordState update({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ResetPasswordState copyWith({
    bool isEmailValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ResetPasswordState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''ResetPasswordState {
      isEmailValid: $isEmailValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }

}
