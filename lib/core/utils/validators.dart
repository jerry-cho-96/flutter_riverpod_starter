import 'package:riverpod3_starter/core/error/app_exception.dart';

abstract final class Validators {
  static void requireEmail(String email) {
    if (!email.contains('@')) {
      throw const ValidationException('올바른 이메일을 입력하세요.');
    }
  }

  static void requirePassword(String password) {
    if (password.length < 8) {
      throw const ValidationException('비밀번호는 8자 이상이어야 합니다.');
    }
  }
}
