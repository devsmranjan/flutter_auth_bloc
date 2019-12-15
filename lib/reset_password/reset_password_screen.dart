import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_repository.dart';
import 'bloc/bloc.dart';
import 'reset_password_form.dart';

class ResetPasswordScreen extends StatefulWidget {
  final UserRepository _userRepository;

  ResetPasswordScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordBloc _resetPasswordBloc;

  @override
  void initState() {
    super.initState();
    _resetPasswordBloc = ResetPasswordBloc(
      userRepository: widget._userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0.0, leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),),
      body: Center(
        child: BlocProvider<ResetPasswordBloc>(
          create: (BuildContext context) => _resetPasswordBloc, child: ResetPasswordForm()),
      ),
    );
  }
}