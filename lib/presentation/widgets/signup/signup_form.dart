import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors.dart';
import '../../../core/utils/form_validation.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../common/form_input_field.dart';
import 'upload_avatar.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UploadAvatarWidget(), // widget that allows user to upload profile picture
          SizedBox(height: 10.0),
          // Form widgets - input fields and signup btn
          // 1. Username form input field
          FormInputField(
            textEditingController: _usernameController,
            hintText: 'Username',
            labelText: 'Username',
            isPasswordField: false,
            validator: (value) {
              return FormValidation.validateName(value);
            },
          ),
          SizedBox(height: 8.0),
          // 2. Email form input field
          FormInputField(
            textEditingController: _emailController,
            hintText: 'Email address',
            labelText: 'Email address',
            isPasswordField: false,
            validator: (value) {
              return FormValidation.validateEmail(value);
            },
          ),
          SizedBox(height: 8.0),
          // 3. Password form input field
          FormInputField(
            textEditingController: _passwordController,
            hintText: 'Password',
            labelText: 'Password',
            isPasswordField: true,
            validator: (value) {
              return FormValidation.validatePassword(
                value,
                _passwordController.text,
              );
            },
          ),
          SizedBox(height: 8.0),
          // 4. Confirm password form input field
          FormInputField(
            textEditingController: _confirmPasswordController,
            hintText: 'Confirm password',
            labelText: 'Confirm Password',
            isPasswordField: true,
            validator: (value) {
              return FormValidation.validatePassword(
                _passwordController.text,
                value
              );
            },
          ),
          SizedBox(height: 8.0),
          // 5. Signup button
          SignupFormButton(
            formKey: _formKey,
            usernameCtrlr: _usernameController,
            emailCtrlr: _emailController,
            passwordCtrlr: _passwordController,
          ),
        ],
      ),
    );
  }
}

class SignupFormButton extends StatelessWidget {
  const SignupFormButton({
    super.key,
    required this.formKey,
    required this.usernameCtrlr,
    required this.emailCtrlr,
    required this.passwordCtrlr,
  });

  final TextEditingController usernameCtrlr, emailCtrlr, passwordCtrlr;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          final form = formKey.currentState;

          if (form != null && form.validate()) {
            final username = usernameCtrlr.text.trim();
            final email = emailCtrlr.text.trim();
            final password = passwordCtrlr.text.trim();

            context.read<AuthBloc>().add(
              SignupRequested(username, email, password),
            );
          }
        },
        child: const Text(
          "Signup",
          style: TextStyle(fontSize: 16.0, color: kTextLightColor),
        ),
      ),
    );
  }
}
