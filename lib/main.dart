import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_state_management/go_egypt_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc()..add(DetectTheme()),
      child: GoEgyptApp(),
    ),
  );
}
