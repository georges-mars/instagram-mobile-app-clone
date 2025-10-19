import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors.dart';
import '../../../core/utils/app_toasts.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../widgets/common/auth_screen_footer.dart';
import '../../widgets/signup/signup_form.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = '/signup';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AccountCreated) {
            AppToast.showSuccess(context, title: "Account created successfully!");
            Navigator.pushNamed(context, '/login');
          } else if (state is AccountCreationFailed) {
            AppToast.showError(context, title: state.errorMessage.toString());
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CupertinoActivityIndicator());
          }
          
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: ListView(
              children: [
                // 1. Instagram logo
                Image.asset(
                  'assets/images/logo-black-bg.jpg',
                  height: MediaQuery.of(context).size.height * .12,
                ),
                SizedBox(height: 5.0),
                // 2. Signup form
                SignupForm(),
              ],
            ),
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        AuthScreenFooter(
          primaryText: "Have an account? ",
          redirectText: "Login",
          redirectTo: TapGestureRecognizer()
            ..onTap = () => Navigator.pushNamed(context, '/login'),
        ),
      ],
      persistentFooterDecoration: BoxDecoration(
        color: kPersistentFooterBgColor,
      ),
    );
  }
}
