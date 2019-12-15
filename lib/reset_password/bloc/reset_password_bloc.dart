import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../user_repository.dart';
import '../../validators.dart';
import './bloc.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepository _userRepository;

  ResetPasswordBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ResetPasswordState get initialState => ResetPasswordState.empty();

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email);
    }
  }

  Stream<ResetPasswordState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<ResetPasswordState> _mapFormSubmittedToState(
    String email,
  ) async* {
    yield ResetPasswordState.loading();
    try {
      await _userRepository.resetPassword(email: email);
      yield ResetPasswordState.success();
    } catch (_) {
      yield ResetPasswordState.failure();
    }
  }
}
