import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseHelper firebaseHelper;
  SignupCubit(this.firebaseHelper) : super(SignupInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signUp() async {
    emit(SignupLoadingState());
    try {
      await firebaseHelper
          .registerUser(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) => emit(SignupSuccessState()));
    } catch (e) {
      emit(SignupErrorState());
    }
  }
}
