/// Custom exception class to handle various Firebase-related errors.
class TFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'No user found for the given email or identifier.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'wrong-password':
        return 'The password is invalid for the given email, or the account corresponding to the email does not have a password set.';
      case 'weak-password':
        return 'The password must be 6 characters long or more.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. You may need to enable it in the Firebase Console.';
      case 'invalid-action-code':
        return 'The action code is invalid. This can happen if the code is malformed or has already been used.';
      case 'expired-action-code':
        return 'The action code has expired.';
      case 'invalid-message-payload':
        return 'The email template corresponding to this action contains invalid characters in its message.';
      case 'invalid-sender':
        return 'The email template corresponding to this action contains an invalid sender email or name.';
      case 'invalid-recipient-email':
        return 'The email corresponding to this action failed to send as the provided recipient email address is invalid.';
      case 'missing-iframe-start':
        return 'The email template corresponding to this action contains missing iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template corresponding to this action contains missing iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template corresponding to this action contains missing iframe src attribute.';
      case 'auth-domain-config-required':
        return 'Be sure to include authDomain when calling firebase.initializeApp().';
      case 'missing-app-credential':
        return 'The App Check token is missing. Please ensure you have App Check configured.';
      case 'invalid-app-credential':
        return 'The App Check token is invalid. Please ensure you have App Check configured correctly.';
      case 'network-request-failed':
        return 'Network error (such as timeout, interrupted connection or unreachable host) has occurred.';
      case 'internal-error':
        return 'An internal error has occurred. Please try again later.';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
