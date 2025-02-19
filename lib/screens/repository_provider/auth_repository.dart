class AuthRepository {
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    // returns true if fake data satisfy the condition
    return email == 'test@gmail.com' && password == 'test1234';
  }
}
