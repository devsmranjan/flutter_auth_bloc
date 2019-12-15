import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/bloc.dart';
import 'bloc/bloc.dart';
import 'reset_password_button.dart';
// import 'ResetPassword_button.dart';

class ResetPasswordForm extends StatefulWidget {
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController _emailController = TextEditingController();

  ResetPasswordBloc _resetPasswordBloc;

  bool get isPopulated => _emailController.text.isNotEmpty;

  bool isResetPasswordButtonEnabled(ResetPasswordState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);
    _emailController.addListener(_onEmailChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _resetPasswordBloc,
      listener: (BuildContext context, ResetPasswordState state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sending reset password link...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sending reset link failed'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder(
        bloc: _resetPasswordBloc,
        builder: (BuildContext context, ResetPasswordState state) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Reset your password!",
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                      ),
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isEmailValid ? 'Invalid Email' : null;
                      },
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ResetPasswordButton(
                        onPressed: isResetPasswordButtonEnabled(state)
                            ? _onFormSubmitted
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _resetPasswordBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onFormSubmitted() {
    _resetPasswordBloc.add(
      Submitted(
        email: _emailController.text,
      ),
    );
  }
}
