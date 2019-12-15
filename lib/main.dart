import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'app.dart';
import 'simple_bloc_delegate.dart';

void main() {
  // BlocL().delegate = SimpleBlocDelegate();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  return runApp(App());
}
