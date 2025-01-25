import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/helpers/shared_pref_helper.dart';
import 'package:go_egypt_with_state_management/features/auth/user-profile.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        var name = await SharedPrefHelper.getString("name") ?? "";
        var phone =await SharedPrefHelper.getString("phone") ?? "";
        var email =  await SharedPrefHelper.getString("email") ?? "";
        var password = await SharedPrefHelper.getString("pass") ?? "";
        if (name.isNotEmpty &&
            phone.isNotEmpty &&
            email.isNotEmpty &&
            password.isNotEmpty) {
          final user = UserProfile(
              name: name, email: email, password: password, phone: phone);
          emit(ProfileLoaded(user));
        } else {
          emit(ProfileInitial());
        }
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
    on<UpdateProfile>((event, emit) async {
      emit(ProfileLoading());
       await Future.delayed(Duration(seconds: 2));
      try {
        var profileUpdate = event.profileData;
        await SharedPrefHelper.setData("name", profileUpdate.name);
        await SharedPrefHelper.setData("pass", profileUpdate.password);
        await SharedPrefHelper.setData("email", profileUpdate.email);
        await SharedPrefHelper.setData("phone", profileUpdate.phone);
        print('${profileUpdate.name} ${profileUpdate.password} ${profileUpdate.email} ${profileUpdate.phone}');
        print('-----------------------------------------------');
        emit(ProfileUpdated(profileUpdate));
        print('${profileUpdate.name} ${profileUpdate.password} ${profileUpdate.email} ${profileUpdate.phone}');

        

      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
    on<UpdateAvatar>((event, emit) async {
      emit(ProfileLoading());
      try {
        String path = event.avatarPath;
        var name = SharedPrefHelper.getString("name") ?? "";
        var phone = SharedPrefHelper.getString("phone") ?? "";
        var email = SharedPrefHelper.getString("email") ?? "";
        var password = SharedPrefHelper.getString("pass") ?? "";
        final user = UserProfile(
            name: name,
            email: email,
            password: password,
            phone: phone,
            path: path);
        emit(ProfileUpdated(user));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
