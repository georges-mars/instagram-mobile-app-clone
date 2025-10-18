import '../constants/errors.dart';

class FormValidation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return kNameNullError;
    } else if (value.length < 2) {
      return kShortNameError;
    } else if (value.length > 20) {
      return kLongNameError;
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return kNameNullError;
    } else if (value.length < 2) {
      return kShortNameError;
    } else if (value.length > 20) {
      return kLongNameError;
    }
    return null;
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return kTextNullError;
    } 
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return kemailNullError;
    } else if (!emailValidatorRegex.hasMatch(value)) {
      return kInvalidEmailError;
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return kPhoneNumberNullError;
    }

    // Remove spaces and hyphens for validation
    String cleaned = value.replaceAll(RegExp(r'\s+|-'), '');

    // Allow optional "+" at start, then digits only
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(cleaned) || value.length < 10 || value.length > 15) {
      return "Please enter a valid phone number";
    }

    return null;
  }

  static String? validateEmailAndPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an email or phone number!';
    }

    final text = value.trim();

    final isPhoneValid = validatePhoneNumber(text) == null;
    final isEmailValid = validateEmail(text) == null;
    final isUsernameValid = validateUsername(text) == null;

    if (!isPhoneValid && !isEmailValid && !isUsernameValid) {
      return 'Enter a valid username, email or phone number';
    }

    return null;
  }

  static String? validatePassword(String? password, String? confirmPassword) {
    if (password == null || password.isEmpty) {
      return kPasswordNullError;
    } else if (password.length < 8) {
      return kShortPasswordError;
    } else if (password != confirmPassword) {
      return kPasswordMatchError;
    }
    return null;
  }

  static String? validatePasswordResetCode(String? value) {
    if (value == null || value.isEmpty) {
      return kOTPCodeError;
    } else if (value.length < 4) {
      return kShortOTPCodeError;
    }
    return null;
  }
}
