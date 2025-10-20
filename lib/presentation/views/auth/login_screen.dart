import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/app_toasts.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../widgets/common/auth_screen_footer.dart';
import '../../widgets/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is IsAuthenticated) {
            Navigator.pushNamed(context, '/homescreen');
          } else if (state is AuthFailed) {
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
                // use [SizedBox] to push the form to the center of the page
                SizedBox(height: MediaQuery.of(context).size.height * .16),
                Image.asset(AppAssets.kAppLogoDark, height: 70.0),
                SizedBox(height: 24.0),
                LoginForm(),
              ],
            ),
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        AuthScreenFooter(
          primaryText: "Don't have an account? ",
          redirectText: "Sign up",
          redirectTo: TapGestureRecognizer()
            ..onTap = () => Navigator.pushNamed(context, '/signup'),
        ),
      ],
      persistentFooterDecoration: BoxDecoration(
        color: kPersistentFooterBgColor,
      ),
    );
  }
}
