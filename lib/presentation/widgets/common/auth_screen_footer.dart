import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class AuthScreenFooter extends StatelessWidget {
  const AuthScreenFooter({
    super.key,
    required this.redirectTo,
    required this.primaryText,  // the unclickable text
    required this.redirectText, // the link text - "Login", "Sign up"
  });

  final GestureRecognizer redirectTo;
  final String primaryText, redirectText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: primaryText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.0),
        children: [
          TextSpan(
            text: redirectText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: kBlueColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            recognizer: redirectTo,
          ),
        ],
      ),
    );
  }
}
