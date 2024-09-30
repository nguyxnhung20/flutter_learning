import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'logic_event.dart';
part 'logic_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<LoginWithUsernamePassword>((event, emit) async {
      final username = event.username;
      emit(LoadingLoginState());
      await Future.delayed(const Duration(seconds: 5), () {
        final random = Random();
        final isSuccess = random.nextBool();
        if (isSuccess) {
          emit(SuccessfullyLoginState(
              successfulMsg:
                  "Chúc mừng username: $username đã login thành công"));
        } else {
          emit(FailedLoginState(
              errorMessage:
                  "Đăng nhập bằng username và password thất bại. Hãy thử lại sau!!!"));
        }
      });
    });

    on<LoginWithThirdParty>((event, emit) async {
      final isGoogleSignIn = event.isGoogle;
      final signInMethod = isGoogleSignIn ? "Google" : "Facebook";
      emit(LoadingLoginState());
      await Future.delayed(const Duration(seconds: 5), () {
        final random = Random();
        final isSuccess = random.nextBool();
        if (isSuccess) {
          emit(SuccessfullyLoginState(
              successfulMsg: "Bạn đã đăng nhập bằng $signInMethod thành công"));
        } else {
          emit(FailedLoginState(
              errorMessage:
                  "Đăng nhập bằng $signInMethod thất bại. Hãy thử lại sau!!!"));
        }
      });
    });

    on<ForgotPassword>((event, emit) {});
  }
}
