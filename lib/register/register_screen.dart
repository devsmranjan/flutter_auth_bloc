import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_repository.dart';
import 'bloc/bloc.dart';
import 'register_form.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
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
        child: BlocProvider<RegisterBloc>(
          create: (BuildContext context) => _registerBloc, child: RegisterForm()),
      ),
    );
  }
}