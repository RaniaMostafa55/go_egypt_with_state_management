import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/blocs/auth/auth_bloc.dart';
import 'package:go_egypt_with_state_management/core/blocs/profile/profile_bloc.dart';
import 'package:go_egypt_with_state_management/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_state_management/core/core_cubits/language_cubit.dart';
import 'package:go_egypt_with_state_management/core/theme/theme.dart';
import 'package:go_egypt_with_state_management/features/auth/views/sign_up_page.dart';
import 'package:go_egypt_with_state_management/features/layout/layout_view.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';

import 'core/blocs/governments_bloc/governments_bloc.dart';
import 'core/blocs/places_bloc/places_bloc.dart';

class GoEgyptApp extends StatelessWidget {
  const GoEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => PlacesBloc(),
        ),
        BlocProvider(
          create: (context) => GovernmentsBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc ()..add(LoadProfile()),
        ),

      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                // ------------- Localization -------------
                locale: locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                // ------------- Localization -------------
                debugShowCheckedModeBanner: false,
                theme: light,
                darkTheme: dark,
                themeMode:
                    (state is DarkModeState) ? ThemeMode.dark : ThemeMode.light,
                // home: SignUpPage(),
                home: SignUpPage(),
              );
            },
          );
        },
      ),
    );
  }
}
