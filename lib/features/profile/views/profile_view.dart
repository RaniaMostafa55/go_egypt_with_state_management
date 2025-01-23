import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/bloc/auth/auth_bloc.dart';
import 'package:go_egypt_with_state_management/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_state_management/core/core_cubits/language_cubit.dart';
import 'package:go_egypt_with_state_management/dialog_utils.dart';
import 'package:go_egypt_with_state_management/features/auth/views/login_page.dart';
import 'package:go_egypt_with_state_management/features/profile/widgets/custom_editing_text_field.dart';
import 'package:go_egypt_with_state_management/features/profile/widgets/custom_list_tile.dart';
import 'package:go_egypt_with_state_management/features/profile/widgets/custom_text_buttom.dart';
import 'package:go_egypt_with_state_management/features/profile/widgets/profile_pic_frame.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';

  getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? "";
    phone = prefs.getString("phone") ?? "";
    email = prefs.getString("email") ?? "";
    password = prefs.getString("pass") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
      if (state is AuthLoading) {
        DialogUtils.showLoading(context: context);
      } else if (state is AuthUnauthenticated) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: 'Logout successfully',
            title: 'Logout',
            posMessageName: 'Ok',
            posAction: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
            });
      }else if(state is AuthError){
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.message??"",
            title: 'Error',
            posMessageName: 'Ok');
      }
  },
  child: Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
                  },
                  icon: state is DarkModeState
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfilePicFrame(
              img:
                  "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
            ),
            SizedBox(
              height: 20,
            ),
            CustomListTile(
              icon: Icons.person,
              title: S.of(context).full_name,
              subtitle: name,
              id: 'name',
              onPressed: () {
                showEditDialog(
                  context,
                  'name',
                  S.of(context).full_name,
                );
              },
            ),
            CustomListTile(
              icon: Icons.phone,
              title: S.of(context).phone_number,
              subtitle: phone,
              id: 'phone',
              onPressed: () {
                showEditDialog(
                  context,
                  'phone',
                  S.of(context).phone_number,
                );
              },
            ),
            CustomListTile(
              icon: Icons.mail_rounded,
              title: S.of(context).email_address,
              subtitle: email,
              id: 'email',
              onPressed: () {
                showEditDialog(
                  context,
                  'email',
                  S.of(context).email_address,
                );
              },
            ),
            CustomListTile(
              icon: Icons.password,
              title: S.of(context).password,
              subtitle: hashedPassword(password.length),
              id: 'password',
              onPressed: () {
                showEditDialog(
                  context,
                  'password',
                  S.of(context).password,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            buildLanguageSwitcher(size),

            TextButton(onPressed: (){
              context.read<AuthBloc>().add(LogoutRequested());
            }, child: Text('Logout'))
          ],
        ),
      ),
    ),
);
  }

  ToggleSwitch buildLanguageSwitcher(Size size) {
    return ToggleSwitch(
      radiusStyle: true,
      minWidth: 90.0,
      initialLabelIndex: Intl.getCurrentLocale() == "ar" ? 1 : 0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['English', 'العربية'],
      customTextStyles: [
        TextStyle(fontSize: 18),
        TextStyle(fontSize: 18),
      ],
      activeBgColors: [
        [
          Theme.of(context).colorScheme.primary,
        ],
        [
          Theme.of(context).colorScheme.error,
        ]
      ],
      animate: true,
      animationDuration: 200,
      customWidths: [size.width * 0.3, size.width * 0.3],
      onToggle: (index) {
        context.read<LanguageCubit>().toggleLanguage();
      },
    );
  }

  String hashedPassword(int passLength) {
    String stars = '';
    for (int i = 0; i < passLength; i++) {
      stars += '*';
    }
    return stars;
  }

  Future<void> showEditDialog(
      BuildContext context, String id, String title) async {
    String editedValue = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${S.of(context).edit} $title',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          content: CustomEditingTextField(
            id: id,
            onChanged: (value) {
              editedValue = value;
            },
          ),
          actions: <Widget>[
            CustomTextButtom(
              text: S.of(context).confirm,
              onPressed: () {
                switch (id) {
                  case 'name':
                    name = editedValue;
                    break;
                  case 'phone':
                    phone = editedValue;
                    break;
                  case 'email':
                    email = editedValue;
                    break;
                  case 'password':
                    password = editedValue;
                    break;
                  default:
                }
                setState(() {});
                Navigator.pop(context);
                SnackBar snackBar = SnackBar(
                  content: Text(S.of(context).profile_has_successfully_updated),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            CustomTextButtom(
              text: S.of(context).back,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
