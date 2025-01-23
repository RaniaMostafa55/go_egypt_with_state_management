
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<LoginRequested>((event, emit) async{
      emit(AuthLoading());
      try{
        await Future.delayed(Duration(seconds:2));
        emit(AuthAuthenticated());
      }catch(e){
        emit(AuthError(message: 'Error when authenticated ${e.toString()}'));
      }

    });
    on<LogoutRequested>((event, emit) async{
      emit(AuthLoading());
      try{
        await Future.delayed(Duration(seconds: 2));
        emit(AuthUnauthenticated());
      }catch(e){
        emit(AuthError(message: 'Error when unauthenticated ${e.toString()}'));
      }
    });
    on<SignupRequested>((event, emit)async{
      emit(AuthLoading());
      try{
        await Future.delayed(Duration(seconds: 2));
        emit(AuthAuthenticated());
      }catch(e){
        emit(AuthError(message: 'Error when SignUp ${e.toString()}'));
      }

    });
  }
}
