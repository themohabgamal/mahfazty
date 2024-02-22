import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/theming/my_colors.dart';
import 'package:mahfazty/core/widgets/my_button.dart';
import 'package:mahfazty/core/widgets/my_text_form_field.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';

import '../widgets/build_bloc_listener.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.blackColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150),
              const EmailAndPassword(),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: FontHelper.font18BoldWhite,
                ),
              ),
              verticalSpace(50),
              MyButton(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 1.0],
                      colors: [MyColors.orangeColor, MyColors.yellowColor]),
                  onPressed: () {
                    validateThenLogin(context);
                  },
                  child: Text(
                    'Login',
                    style: FontHelper.font18BoldWhite,
                  )),
              verticalSpace(20),
              const TermsAndConditions(),
              verticalSpace(20),
              const DontHaveAnAccount(),
              const BuildBlocListener()
            ],
          ),
        )));
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
