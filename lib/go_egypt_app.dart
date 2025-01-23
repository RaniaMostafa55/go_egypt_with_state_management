import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/core_cubits/language_cubit.dart';
import 'package:go_egypt_with_state_management/core/theme/theme.dart';
import 'package:go_egypt_with_state_management/core/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_state_management/features/auth/views/sign_up_page.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';

class GoEgyptApp extends StatelessWidget {
  const GoEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageCubit(),
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
                home: SignUpPage(),
              );
            },
          );
        },
      ),
    );
  }
}