import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/register/register_screen.dart';
import '../user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.all(14.0),
        onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
      child: Text('Create an Account'.toUpperCase(), style: TextStyle(color: Colors.white),),
      color: Theme.of(context).primaryColor,
    );
  }
}