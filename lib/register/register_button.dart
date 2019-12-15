import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton( 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: EdgeInsets.all(14.0),
        onPressed: _onPressed,
        child: Text('REGISTER', style: TextStyle(color: Colors.white),),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}