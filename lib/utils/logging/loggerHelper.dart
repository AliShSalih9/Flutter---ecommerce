import 'package:logger/logger.dart';

class DLoggerhelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );
  static void debug(String message) {
    _logger.d(message);
  }

  static void error(String message) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warn(String message) {
    _logger.w(message);
  }
}
