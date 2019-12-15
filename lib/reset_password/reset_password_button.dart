import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  final VoidCallback _onPressed;

  ResetPasswordButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.all(14.0),
      onPressed: _onPressed,
      child: Text('RESET PASSWORD', style: TextStyle(color: Colors.white),),
      color: Theme.of(context).primaryColor,
    );
  }
}