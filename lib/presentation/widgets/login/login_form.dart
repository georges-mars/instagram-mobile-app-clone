import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/form_validation.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../common/form_input_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameEmailCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // 1. Username, email or mobile no. form input field
          FormInputField(
            textEditingController: usernameEmailCtrlr,
            hintText: 'Mobile no., username or email',
            labelText: 'Enter your mobile no., username or email',
            isPasswordField: false,
            validator: (value) {
              return FormValidation.validateEmail(value);
            },
          ),
          SizedBox(height: 8.0),
          // 2. Password input field
          FormInputField(
            textEditingController: passwordCtrlr,
            hintText: 'Password',
            labelText: 'Enter your password',
            isPasswordField: true,
            validator: (value) {
              return FormValidation.validatePassword(value, passwordCtrlr.text);
            },
          ),
          SizedBox(height: 8.0),
          // 3. Login button
          LoginButton(
            formKey: _formKey,
            usernameCtrlr: usernameEmailCtrlr,
            passwordCtrlr: passwordCtrlr,
          ),
          // 4. Forgot password link
          ForgotPasswordLink(),
          // 5. "OR" with the dividers
          ORDivider(),
          // 6. Option to login with facebook
          LoginWithFacebook(),
        ],
      ),
    );
  }
}

class LoginWithFacebook extends StatelessWidget {
  const LoginWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppAssets.kFacebookLogo), height: 20.0),
          Text(" Continue with ", style: Theme.of(context).textTheme.bodySmall),
          Text(
            "facebook",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ORDivider extends StatelessWidget {
  const ORDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Container(height: 1, color: Colors.white)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "OR",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Flexible(child: Container(height: 1, color: Colors.white)),
        ],
      ),
    );
  }
}

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 52.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Forgot password?",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: kBlueColor),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.usernameCtrlr,
    required this.passwordCtrlr,
  });
  final TextEditingController usernameCtrlr, passwordCtrlr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          final form = formKey.currentState;

          if (form != null && form.validate()) {
            final username = usernameCtrlr.text.trim();
            final password = passwordCtrlr.text.trim();

            context.read<AuthBloc>().add(LoginRequested(username, password));
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 16.0, color: kTextLightColor),
        ),
      ),
    );
  }
}
